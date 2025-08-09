import 'dart:io';

import 'package:aloroupia/core/manager/images/app_images.dart';
import 'package:aloroupia/features/home/presentation/views/widgets/drawer_widgets/profileWidgets/profile_picture_option_item.dart';
import 'package:aloroupia/features/home/presentation/views/widgets/drawer_widgets/profileWidgets/profile_storage.dart';
import 'package:aloroupia/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

class ProfilePicture extends StatefulWidget {
  const ProfilePicture({super.key});

  @override
  State<ProfilePicture> createState() => _ProfilePictureState();
}

class _ProfilePictureState extends State<ProfilePicture> {
  File? _selectedImage;
  String _defaultImageUrl = AppImages.profileImage;

  @override
  void initState() {
    super.initState();
    _loadSavedImage();
  }

  // Load saved image when the app starts
  Future<void> _loadSavedImage() async {
    final savedPath = await ProfilePictureStorage.loadImagePath();
    if (savedPath != null && File(savedPath).existsSync()) {
      setState(() {
        _selectedImage = File(savedPath);
      });
    }
  }

  // Pick new image and save its path
  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      // Copy the image to app's local directory for persistence
      final appDir = await getApplicationDocumentsDirectory();
      final fileName =
          'profile_pic_${DateTime.now().millisecondsSinceEpoch}.jpg';
      final savedImage = await File(
        pickedFile.path,
      ).copy('${appDir.path}/$fileName');

      setState(() {
        _selectedImage = savedImage;
      });

      // Save the new path
      await ProfilePictureStorage.saveImagePath(savedImage.path);
    }
  }

  // Remove image and clear saved path
  void _removeImage() async {
    if (_selectedImage != null) {
      // Delete the file from storage
      await _selectedImage!.delete();
    }

    setState(() {
      _selectedImage = null;
    });

    // Clear the saved path
    await ProfilePictureStorage.clearImagePath();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          barrierColor: Colors.black,
          context: context,
          builder:
              (context) => Column(
                spacing: 30,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: Icon(Icons.close, color: Colors.grey, size: 40),
                    ),
                  ),
                  //SizedBox(height: 20),
                  InteractiveViewer(
                    child:
                        _selectedImage != null
                            ? Image.file(_selectedImage!, fit: BoxFit.contain)
                            : Image.asset(
                              _defaultImageUrl,
                              fit: BoxFit.contain,
                            ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ProfilePictureOptionItem(
                        lable: S.of(context).change,
                        icon: Icons.edit,
                        onPressed: () async {
                          await _pickImage();
                          if (_selectedImage != null) {
                            Navigator.of(
                              context,
                            ).pop(); // Close dialog only if image was selected
                          }
                        },
                      ),
                      ProfilePictureOptionItem(
                        lable: S.of(context).remove,
                        icon: Icons.delete,
                        onPressed: () {
                          _removeImage();
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  ),
                ],
              ),
        );
      },
      child: Container(
        constraints: BoxConstraints(maxHeight: 70, maxWidth: 70),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            fit: BoxFit.cover,
            image:
                _selectedImage != null
                    ? FileImage(_selectedImage!) as ImageProvider
                    : AssetImage(_defaultImageUrl) as ImageProvider,
          ),
        ),
      ),
    );
  }
}
