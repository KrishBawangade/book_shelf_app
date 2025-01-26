# Book Shelf App

## Overview
The Book Shelf App is a Flutter-based mobile application that allows users to:
1. Select books to add to their personal shelf (6 books required).
2. Organize their books in a visually appealing shelf layout with drag-and-drop functionality.
3. Download or share an image of their organized shelf.

## Features
### Page 1: Select Books
- Users can browse and search for books from a list.
- Exactly 6 books must be selected to proceed.
- Intuitive search functionality for finding books quickly.

### Page 2: Organize Books
- Users can drag and drop books to organize their shelf.
- Visual representation of the shelf with customizable book positions.
- Option to download the organized shelf as an image.

### Page 3: Share or Download
- Users can share the shelf image via social media platforms (e.g., Instagram).
- Option to download the image directly to the device.

## Tech Stack
- **Flutter**: Framework for building the app.
- **Dart**: Programming language for Flutter.
- **Firebase**: Backend for storing book data (optional, based on implementation).
- **Share Plus**: For sharing images.
- **Path Provider**: For accessing device storage.
- **Permission Handler**: For managing permissions.
- **Device Info Plus**: For retrieving device-specific information.

---

## Installation and Setup

### Prerequisites
1. Flutter installed on your machine ([Install Flutter](https://flutter.dev/docs/get-started/install)).
2. Android Studio or VS Code for development.
3. A device or emulator to run the app.

### Steps to Set Up

1. **Clone the Repository**
   ```bash
   git clone <repository-url>
   cd book_shelf_app
   ```

2. **Install Dependencies**
   Run the following command to install the necessary packages:
   ```bash
   flutter pub get
   ```

3. **Configure Firebase (Optional)**
   If you’re using Firebase for backend data storage:
   - Add the `google-services.json` file in the `android/app` directory for Android.
   - Add the `GoogleService-Info.plist` file in the `ios/Runner` directory for iOS.

4. **Run the App**
   Use the following command to run the app:
   ```bash
   flutter run
   ```

---

## Project Structure
```
lib/
├── main.dart                   # Entry point of the application
├── pages/                      # Contains all the app pages
│   ├── select_books_page/      # Contains select_book_page and it's related widgets
│   ├── organize_books_page.dart # Page for organizing the shelf
│   ├── share_image_page.dart   # Page for sharing/downloading the image
├── widgets/                    # Reusable widgets
│   ├── book_card.dart          # Widget for displaying book details
│   └── shelf_widget.dart       # Widget for the book shelf layout
├── providers/                  # State management using providers
│   └── books_provider.dart     # Manages book data and user selections
├── utils/                      # Utility files
│   ├── constants.dart          # Constants for assets and other configurations
│   └── helpers.dart            # Helper functions for common tasks
├── services/                      # Service Files

---

## How to Use

### 1. Select Books
- The app starts with a list of books.
- Use the search bar to find books by title or author.
- Select exactly 6 books to proceed.
- Tap the "Next" button to move to the organization page.

### 2. Organize Books
- Drag and drop books to arrange them on the shelf.
- Once satisfied with the layout, tap the "Download" button to save the shelf image.

### 3. Share or Download
- Share the shelf image via social media platforms using the "Share" button.
- Alternatively, download the image to the device using the "Download" button.

---

## Permissions Required
- **Storage**: To save the shelf image to the device.
- **Internet**: To load book images and enable sharing functionality.

Ensure permissions are managed appropriately for Android 13+ devices.

---

## Troubleshooting

1. **App Not Running**
   - Ensure Flutter is installed and the `flutter doctor` command shows no issues.
   - Check if the emulator or device is connected properly.

2. **Permission Denied**
   - Grant storage permissions in your device settings.
   - For Android 13+, ensure the app requests `READ_MEDIA_IMAGES` permissions.

3. **Image Not Downloaded**
   - Verify the app has write access to the Downloads or external storage directory.
   - Check logs for errors during the download process.

---

## Future Enhancements
- Support for more customizable shelf layouts.
- Integration with online book databases for dynamic content.
- Option to save multiple shelves.
- Enhanced social media sharing options.

---

## License
This project is licensed under the MIT License. See the `LICENSE` file for more details.

---

## Contact
If you have any questions or suggestions, feel free to contact us at:
- **Email**: krishbawangade08@gmail.com


