import 'dart:io';

import 'package:flutter/material.dart';

class PreviewPhotoScreen extends StatelessWidget {
  final String filePath;
  const PreviewPhotoScreen({super.key, required this.filePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Xem trước ảnh")),
      body: Column(
        children: [
          Expanded(child: Image.file(File(filePath))),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton.icon(
                onPressed: () => Navigator.pop(context, false),
                icon: const Icon(Icons.close),
                label: const Text("Hủy"),
              ),
              ElevatedButton.icon(
                onPressed: () => Navigator.pop(context, true),
                icon: const Icon(Icons.check),
                label: const Text("Dùng ảnh này"),
              ),
            ],
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
