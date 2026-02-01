# Media Organizer with MD5 Checksum: Organize Your Media Files

![Media Organizer](https://img.shields.io/badge/Download%20Latest%20Release-Click%20Here-brightgreen) [![GitHub Repo stars](https://img.shields.io/github/stars/RahmaMohammed-1/media-organizer-md5)](https://github.com/RahmaMohammed-1/media-organizer-md5/stargazers) [![GitHub forks](https://img.shields.io/github/forks/RahmaMohammed-1/media-organizer-md5)](https://github.com/RahmaMohammed-1/media-organizer-md5/network/members)

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

You can download the latest release [here](https://github.com/RahmaMohammed-1/media-organizer-md5/releases).

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
   git clone https://github.com/RahmaMohammed-1/media-organizer-md5.git
   ```

2. **Navigate to the Directory**:
   ```bash
   cd media-organizer-md5
   ```

3. **Make the Script Executable**:
   ```bash
   chmod +x media-organizer.sh
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
./media-organizer.sh /path/to/your/media
```

Replace `/path/to/your/media` with the path to your media files. 

### Options

- `--dry-run`: Preview actions without executing them.
- `--log`: Specify a log file to save actions.
- `--cleanup`: Automatically remove empty folders after processing.

Example command with options:

```bash
./media-organizer.sh /path/to/your/media --dry-run --log=organizer.log --cleanup
```

## How It Works

The script scans the specified directory for media files. It extracts metadata using `exiftool` to determine the creation year of each file. It then organizes the files into folders named after their respective years. 

MD5 checksums are calculated for each file to check for duplicates. If a duplicate is found, it will not be moved to the new folder. 

### File Structure

The resulting directory structure will look like this:

```
/media
    ├── 2020
    │   ├── image1.jpg
    │   ├── video1.mp4
    ├── 2021
    │   ├── audio1.mp3
    │   ├── image2.jpg
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
./media-organizer.sh /path/to/your/media --log=organizer.log
```

This command will create a log file named `organizer.log` in the current directory.

## Cleanup

The automatic cleanup feature removes empty folders after processing. This helps keep your media directory tidy. To enable cleanup, use the `--cleanup` option.

Example:

```bash
./media-organizer.sh /path/to/your/media --cleanup
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

If you have any questions or issues, feel free to open an issue in the GitHub repository. You can also download the latest release [here](https://github.com/RahmaMohammed-1/media-organizer-md5/releases) for updates and improvements. 

![Media Management](https://img.shields.io/badge/Media%20Management%20Made%20Easy-brightblue) 

For further assistance, please refer to the documentation within the repository.