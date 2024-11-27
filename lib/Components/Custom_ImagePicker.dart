// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'dart:io';

// class CustomImagePicker extends StatefulWidget {
//   final String defaultText;
//   final double imageHeight;
//   final Function(File?) onImageSelected;

//   const CustomImagePicker({
//     Key? key,
//     required this.defaultText,
//     required this.onImageSelected,
//     this.imageHeight = 100,
//   }) : super(key: key);

//   @override
//   _CustomImagePickerState createState() => _CustomImagePickerState();
// }

// class _CustomImagePickerState extends State<CustomImagePicker> {
//   File? _image;
//   final picker = ImagePicker();

//   Future<void> _pickImage() async {
//     try {
//       final pickedFile = await picker.pickImage(source: ImageSource.gallery);
//       setState(() {
//         if (pickedFile != null) {
//           _image = File(pickedFile.path);
//           widget.onImageSelected(_image);
//         } else {
//           ScaffoldMessenger.of(context).showSnackBar(
//             const SnackBar(content: Text('No image selected.')),
//           );
//         }
//       });
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Error selecting image: $e')),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         _image == null
//             ? Text(widget.defaultText)
//             : Image.file(_image!, height: widget.imageHeight),
//         TextButton(
//           onPressed: _pickImage,
//           child: const Text('Pick Image'),
//         ),
//       ],
//     );
//   }
// }
