#!/bin/bash

SRC_DIR="$1"
DRY_RUN=false

if [[ -z "$SRC_DIR" ]]; then
  echo "Usage: $0 /path/to/source_directory [--dry-run]"
  exit 1
fi

if [[ "$2" == "--dry-run" ]]; then
  DRY_RUN=true
fi

declare -A MEDIA_EXTENSIONS=(
  [Images]="\( -iname '*.jpg' -o -iname '*.jpeg' -o -iname '*.png' -o -iname '*.gif' -o -iname '*.bmp' -o -iname '*.tiff' -o -iname '*.webp' -o -iname '*.heic' \)"
  [Videos]="\( -iname '*.mp4' -o -iname '*.mov' -o -iname '*.avi' -o -iname '*.mkv' -o -iname '*.webm' -o -iname '*.flv' -o -iname '*.3gp' -o -iname '*.mts' \)"
  [Audio]="\( -iname '*.mp3' -o -iname '*.wav' -o -iname '*.flac' -o -iname '*.aac' -o -iname '*.ogg' -o -iname '*.wma' -o -iname '*.m4a' -o -iname '*.amr' \)"
)

echo "Select media type to organize:"
echo "1. Images"
echo "2. Videos"
echo "3. Audio"
echo "4. All (Images + Videos + Audio)"
read -p "Enter 1/2/3/4: " choice

case "$choice" in
  1) TYPES_TO_PROCESS=(Images) ;;
  2) TYPES_TO_PROCESS=(Videos) ;;
  3) TYPES_TO_PROCESS=(Audio) ;;
  4) TYPES_TO_PROCESS=(Images Videos Audio) ;;
  *) echo "Invalid choice. Exiting."; exit 1 ;;
esac

for MEDIA_TYPE in "${TYPES_TO_PROCESS[@]}"; do
  EXTENSIONS=${MEDIA_EXTENSIONS[$MEDIA_TYPE]}
  TARGET_DIR="$SRC_DIR/$MEDIA_TYPE"
  mkdir -p "$TARGET_DIR"
  LOG_FILE="$SRC_DIR/organize_${MEDIA_TYPE}.log"
  > "$LOG_FILE"
  echo "Organizing $MEDIA_TYPE into: $TARGET_DIR" | tee -a "$LOG_FILE"

  # We will cache MD5 sums of target year folders to speed up duplicate checks
  declare -A MD5_CACHE=()

  # Find files excluding the target media folder itself
  eval find "\"$SRC_DIR\"" -type f "$EXTENSIONS" ! -path "\"$TARGET_DIR/*\"" -print0 |
  while IFS= read -r -d '' file; do
    echo "Processing: $file" | tee -a "$LOG_FILE"

    datetime=$(exiftool -s3 -DateTimeOriginal -CreateDate -MediaCreateDate -FileModifyDate "$file" | head -n1)
    if [[ -z "$datetime" ]]; then
      echo "⚠️ No valid date found for: $file. Skipping." | tee -a "$LOG_FILE"
      continue
    fi

    date_part=$(echo "$datetime" | cut -d' ' -f1 | tr ':' '-')
    time_part=$(echo "$datetime" | cut -d' ' -f2 | cut -d'+' -f1 | tr ':' '-')
    year="${date_part:0:4}"
    YEAR_DIR="$TARGET_DIR/$year"
    mkdir -p "$YEAR_DIR"

    filename=$(basename "$file")
    ext="${filename##*.}"
    ext="${ext,,}"
    base_name="${date_part}_${time_part}"
    target_file="$YEAR_DIR/${base_name}.${ext}"

    # Compute MD5 of source file
    md5_src=$(md5sum "$file" | cut -d ' ' -f1)

    # Load MD5 cache for this year folder if not loaded yet
    if [[ -z "${MD5_CACHE[$YEAR_DIR]+x}" ]]; then
      # Build MD5 cache: filename -> md5
      while IFS= read -r -d '' existing_file; do
        md5_existing=$(md5sum "$existing_file" | cut -d ' ' -f1)
        MD5_CACHE[$YEAR_DIR]+="$md5_existing "
      done < <(find "$YEAR_DIR" -type f -print0)
    fi

    # Check if this md5 already exists in the year folder
    if grep -qw "$md5_src" <<< "${MD5_CACHE[$YEAR_DIR]}"; then
      echo "⚠️ Duplicate detected. Skipping move for: $file" | tee -a "$LOG_FILE"
      continue
    fi

    # Make unique filename if file exists
    counter=1
    unique_target_file="$target_file"
    while [[ -e "$unique_target_file" ]]; do
      unique_target_file="$YEAR_DIR/${base_name}_$counter.${ext}"
      ((counter++))
    done

    if $DRY_RUN; then
      echo "[Dry-run] Would move $file -> $unique_target_file" | tee -a "$LOG_FILE"
    else
      if mv "$file" "$unique_target_file"; then
        echo "[Moved] $file -> $unique_target_file" | tee -a "$LOG_FILE"
        # Update MD5 cache for the year folder (append new md5)
        MD5_CACHE[$YEAR_DIR]+="$md5_src "
      else
        echo "❌ Failed to move $file" | tee -a "$LOG_FILE"
      fi
    fi
  done

  echo -e "\n===== Summary for $MEDIA_TYPE =====" | tee -a "$LOG_FILE"
  echo "Total files processed: $(grep -c '^Processing:' "$LOG_FILE")" | tee -a "$LOG_FILE"
  echo "Files moved:           $(grep -c '^\[Moved\]' "$LOG_FILE")" | tee -a "$LOG_FILE"
  echo "Files skipped:         $(grep -c 'Skipping' "$LOG_FILE")" | tee -a "$LOG_FILE"
done

echo -e "\nDeleting empty directories under $SRC_DIR..."
if $DRY_RUN; then
  echo "[Dry-run] Would delete empty directories under $SRC_DIR"
else
  find "$SRC_DIR" -depth -type d -empty -exec rmdir {} \;
  echo "Empty directories deleted."
fi

