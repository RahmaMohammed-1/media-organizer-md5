# 📁 Organize Media with MD5 Duplicate Detection

A powerful Bash script to organize your **images**, **videos**, or **audio files** into year-based folders using metadata — while detecting duplicates using **MD5 checksums**.

✅ Supports EXIF-aware sorting  
✅ Prevents duplicate files by content (MD5)  
✅ Works recursively across folders  
✅ Deletes empty directories automatically  
✅ Dry-run mode for safe testing

---

## 🚀 Features

- 📷 Organize **Images**, 🎞️ **Videos**, 🎵 **Audio**, or **All**
- 🕒 Uses `DateTimeOriginal`, `CreateDate`, or `FileModifyDate`
- 🧠 Automatically avoids duplicate content using **MD5 hashing**
- 🧹 Removes empty folders after sorting
- 🧪 `--dry-run` option available
- 🔏 Logs everything in `organize_<type>.log`

---

## 📦 Requirements

Ensure these are installed:

- `bash`
- `exiftool` (for extracting timestamps)
- `md5sum`
- `find`

On Ubuntu/Debian:

```bash
sudo apt update
sudo apt install libimage-exiftool-perl
````

---

## 🔧 Usage

```bash
chmod +x media_organizer_md5.sh
./media_organizer_md5.sh /path/to/parent/folder [--dry-run]
./media_organizer_md5.sh /path/to/parent/folder
```

You’ll be prompted to choose:

```
1. Images
2. Videos
3. Audio
4. All (Images + Videos + Audio)
```

---

## 🧪 Example

```bash
./media_organizer_md5.sh /media/zz/CC70-D0--/Media_Backups/ --dry-run
```

→ Simulates moving your media into `/media/zz/CC70-D0--/Media_Backups/Images/YYYY`, etc., without changing anything.

---

## 📂 Folder Structure

```
ParentDirectory/
├── Images/
│   └── 2024/
│       └── 2024-05-20_14-22-31.jpg
├── Videos/
│   └── 2023/
│       └── 2023-11-02_18-07-00.mp4
├── Audio/
│   └── 2021/
│       └── 2021-08-19_10-05-12.mp3
```

---

## 🛡️ Duplicate Handling

Before moving a file, the script:

* Computes its **MD5 hash**
* Compares against existing files in the target folder
* Skips if identical content is already present

No clutter. No overwrite. Just smart moves.

---

## 📝 License

MIT License

---

## ✨ Author

Developed by \[debjit018].
Feel free to fork, suggest improvements, or contribute!
