import 'dart:io';
import 'package:book_shelf_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter/services.dart';
import 'package:device_info_plus/device_info_plus.dart';

class ShareImagePage extends StatelessWidget {
  const ShareImagePage({super.key});

  // Function to get Android version
  Future<int> _getAndroidVersion() async {
    if (Platform.isAndroid) {
      final deviceInfo = DeviceInfoPlugin();
      final androidInfo = await deviceInfo.androidInfo;
      return androidInfo.version.sdkInt; // Returns the Android SDK version
    }
    return 0; // Not Android
  }

  // Function to share the placeholder image
  Future<void> _sharePlaceholderImage(BuildContext context, String imagePath) async {
    try {
      // Load image from assets
      final byteData = await rootBundle.load(imagePath);
      final buffer = byteData.buffer.asUint8List();

      // Save to a temporary file
      final tempDir = await getTemporaryDirectory();
      final tempFilePath = '${tempDir.path}/placeholder_image.png';
      final file = File(tempFilePath);
      await file.writeAsBytes(buffer);

      // Share the temporary file
      await Share.shareXFiles([XFile(file.path)], text: 'Check out my bookshelf!');

      print('Shared placeholder image successfully.');
    } catch (e) {
      print('Error sharing placeholder image: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to share the image.')),
      );
    }
  }

  // Function to request storage permission
  Future<bool> _requestStoragePermission() async {
    if (await Permission.storage.isGranted || await Permission.manageExternalStorage.isGranted) {
      return true;
    }

    if (await Permission.storage.request().isGranted || await Permission.manageExternalStorage.request().isGranted) {
      return true;
    } else if (await Permission.storage.isPermanentlyDenied || await Permission.manageExternalStorage.isPermanentlyDenied) {
      await openAppSettings();
      return false;
    }

    return false;
  }

  // Function to download the placeholder image
  Future<void> _downloadPlaceholderImage(BuildContext context, String imagePath) async {
    try {
      // Request storage permission
      final permissionGranted = await _requestStoragePermission();
      if (!permissionGranted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Storage permission is required to download the image.')),
        );
        return;
      }

      // Load the image from assets
      final byteData = await rootBundle.load(imagePath);
      final buffer = byteData.buffer.asUint8List();

      // Save to the appropriate directory for both Android 12+ and below
      String filePath;
      if (Platform.isAndroid) {
        final directory = await getExternalStorageDirectory(); // Gets the external storage directory
        filePath = '${directory?.path}/placeholder_image.png'; // Save to the path
      } else {
        final directory = await getApplicationDocumentsDirectory(); // iOS fallback
        filePath = '${directory.path}/placeholder_image.png'; 
      }

      final file = File(filePath);
      await file.create(recursive: true);  // Ensure the directory is created
      await file.writeAsBytes(buffer);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Image downloaded successfully at $filePath')),
      );
    } catch (e) {
      print('Error downloading image: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to download the image.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final String imagePath = AppConstants.placeholderImagePath;

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(25),
          child: Container(
            width: double.infinity,
            height: double.infinity,
            color: Theme.of(context).colorScheme.surfaceContainerHigh,
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                children: [
                  // App Bar
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        iconSize: 18,
                        style: IconButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100),
                          ),
                          backgroundColor: Colors.white.withAlpha(40),
                        ),
                        onPressed: () => Navigator.of(context).pop(),
                        icon: Icon(Icons.arrow_back_ios_rounded, color: Colors.black),
                      ),
                      IconButton(
                        iconSize: 18,
                        style: IconButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100),
                          ),
                          backgroundColor: Colors.white.withAlpha(40),
                        ),
                        onPressed: () => Navigator.of(context).pop(),
                        icon: Icon(Icons.close, color: Colors.black),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  // Image Preview
                  ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: Image.asset(
                      imagePath,
                      height: MediaQuery.of(context).size.height * 0.6,
                      width: MediaQuery.of(context).size.width * 0.6,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text("Be sure to tag us!", style: TextStyle(color: Colors.black)),
                    ],
                  ),
                  const Spacer(),
                  // Buttons for Share and Download
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          IconButton(
                            style: IconButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(100),
                              ),
                            ),
                            onPressed: () => _sharePlaceholderImage(context, imagePath),
                            icon: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: Image.asset(
                                AppConstants.instaImagePath,
                                width: 40,
                                height: 40,
                              ),
                            ),
                          ),
                          const Text("Share", style: TextStyle(fontSize: 12)),
                        ],
                      ),
                      const SizedBox(width: 20),
                      Column(
                        children: [
                          IconButton(
                            onPressed: () => _downloadPlaceholderImage(context, imagePath),
                            icon: Icon(Icons.download, size: 40, color: Colors.black),
                          ),
                          const Text("Download", style: TextStyle(fontSize: 12)),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
