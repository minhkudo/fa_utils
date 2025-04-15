import 'dart:io';

import 'package:camera/camera.dart';
import 'package:fa_utils/view/camera/camera_service.dart';
import 'package:fa_utils/view/camera/preview_photo_screen.dart';
import 'package:flutter/material.dart';

class CameraView extends StatefulWidget {
  final bool autoSave;

  const CameraView({super.key, this.autoSave = false});

  @override
  State<CameraView> createState() => _CameraViewState();
}

class _CameraViewState extends State<CameraView> {
  final CameraService _cameraService = CameraService();

  @override
  void initState() {
    super.initState();
    _cameraService.initialize().then((_) {
      if (mounted) setState(() {});
    });
  }

  @override
  void dispose() {
    _cameraService.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!_cameraService.isInitialized) {
      return const Center(child: CircularProgressIndicator());
    }

    return SafeArea(
      child: Stack(
        children: [
          // Camera preview full màn
          CameraPreview(_cameraService.controller),

          // Nút Back
          Positioned(
            top: 16,
            left: 16,
            child: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => Navigator.pop(context),
            ),
          ),

          // Nút đổi camera
          Positioned(
            top: 16,
            right: 16,
            child: IconButton(
              icon: const Icon(Icons.flip_camera_ios, color: Colors.white),
              onPressed: () async {
                await _cameraService.switchCamera();
                setState(() {});
              },
            ),
          ),

          // Nút chụp ảnh chính giữa dưới cùng
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Center(
              child: FloatingActionButton(
                backgroundColor: Colors.white,
                onPressed: () async {
                  if (!_cameraService.isInitialized) return;

                  if (widget.autoSave) {
                    final asset = await _cameraService.takePhotoAndSave();
                    if (asset == null) return;
                    Navigator.pop(context, asset);
                    return;
                  }

                  // Manual confirm
                  final file = await _cameraService.takePhoto();
                  if (file == null) return;

                  final confirmed = await Navigator.push<bool>(
                    context,
                    MaterialPageRoute(
                      builder: (_) => PreviewPhotoScreen(filePath: file.path),
                    ),
                  );

                  if (confirmed == true) {
                    final asset = await _cameraService.savePhoto(file);
                    if (asset != null) {
                      Navigator.pop(context, asset);
                    }
                  } else {
                    await file.delete();
                  }
                },
                child: const Icon(Icons.camera_alt, color: Colors.black),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
