import 'dart:io';
import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';

class ImagePickerWidget extends StatefulWidget {
  const ImagePickerWidget({super.key});

  @override
  State<ImagePickerWidget> createState() => _ImagePickerWidgetState();
}

class _ImagePickerWidgetState extends State<ImagePickerWidget> {
  File? _image;

  // اختيار الصورة من المعرض
  Future<void> _pickImage() async {
    // final ImagePicker picker = ImagePicker();
    // final XFile? pickedFile =
    //     await picker.pickImage(source: ImageSource.gallery);

    // if (pickedFile != null) {
    //   setState(() {
    //     _image = File(pickedFile.path); // حفظ الصورة بعد اختيارها
    //   });
    // }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _pickImage, // عند الضغط على الصورة يتم فتح المعرض
      child: _image == null
          ? Container(
              height: 150,
              width: double.infinity,
              color: Colors.grey[300],
              child: const Icon(Icons.add_a_photo,
                  size: 50,
                  color: Colors.grey), // عرض أيقونة إذا لم يتم اختيار صورة
            )
          : Image.file(
              _image!, // عرض الصورة المحملة
              width: double.infinity,
              height: 150,
              fit: BoxFit.cover,
            ),
    );
  }
}
