import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';

class ProfileImageSelector extends StatefulWidget {
  const ProfileImageSelector({super.key, required this.viewModel});
  final dynamic viewModel;

  @override
  State<ProfileImageSelector> createState() => _ProfileImageSelectorState();
}


class _ProfileImageSelectorState extends State<ProfileImageSelector> {
  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(child: Stack(
      clipBehavior: Clip.none,
      children: [
        CircleAvatar(
          radius: 50,
          backgroundImage: widget.viewModel.imageFile != null
          ? FileImage(File(widget.viewModel.imageFile!.path))
          : const AssetImage('./assets/images/blank-profile-img.png') as ImageProvider,
        ),
        Positioned(
          right: -20,
          bottom: 1,
          child: CircularCameraButton(onPressed: choosePhoto))
        ]
    ),
    );
  }

  void choosePhoto() async {
    final pickedFile = await _picker.pickImage(
      source: ImageSource.gallery,
    );
    setState(() {
      widget.viewModel.imageFile = pickedFile;
    });
}
}

class CircularCameraButton extends StatelessWidget {
  final VoidCallback onPressed;

  const CircularCameraButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: CircleBorder(),
        padding: EdgeInsets.all(10),
        // foregroundColor: Theme.of(context)., // Button color
        backgroundColor: Theme.of(context).primaryColor, // Splash color
      ),
      child: Icon(
        color: Theme.of(context).scaffoldBackgroundColor,
        Icons.camera_alt,
        size: 20,
      ),
    );
  }
}