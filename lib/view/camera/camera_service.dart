import 'dart:io';
import 'package:camera/camera.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'package:photo_manager/photo_manager.dart';

class CameraService {
  late CameraController _cameraController;
  late List<CameraDescription> _cameras;

  int _currentCameraIndex = 0;

  bool _isInitialized = false;

  bool get isInitialized => _isInitialized;

  CameraController get controller => _cameraController;

  /// Gọi ở initState
  Future<void> initialize() async {
    _cameras = await availableCameras();
    _currentCameraIndex = 0;

    _cameraController = CameraController(
      _cameras[_currentCameraIndex],
      ResolutionPreset.high,
      enableAudio: false,
    );

    await _cameraController.initialize();
    _isInitialized = true;
  }


  /// Đổi camera (trước/sau)
  Future<void> switchCamera() async {
    if (_cameras.length < 2) return;

    _currentCameraIndex = (_currentCameraIndex + 1) % _cameras.length;
    await _cameraController.dispose();

    _cameraController = CameraController(
      _cameras[_currentCameraIndex],
      ResolutionPreset.high,
      enableAudio: false,
    );
    await _cameraController.initialize();
  }

  /// Gọi ở dispose
  void dispose() {
    _cameraController.dispose();
  }

  /// Chụp ảnh và trả về AssetEntity
  Future<AssetEntity?> takePhotoAndSave() async {
    if (!_isInitialized) return null;

    final xFile = await _cameraController.takePicture();

    final directory = await getTemporaryDirectory();
    final tempPath = path.join(directory.path, '${DateTime.now().millisecondsSinceEpoch}.jpg');

    final saved = await File(xFile.path).copy(tempPath);

    final asset = await PhotoManager.editor.saveImageWithPath(saved.path);
    return asset;
  }

  /// Chụp ảnh, trả về file tạm (chưa lưu vào thư viện)
  Future<File?> takePhoto() async {
    if (!_isInitialized) return null;

    final xFile = await _cameraController.takePicture();

    final directory = await getTemporaryDirectory();
    final tempPath = path.join(directory.path, '${DateTime.now().millisecondsSinceEpoch}.jpg');

    return File(xFile.path).copy(tempPath);
  }

  /// Lưu file ảnh vào thư viện
  Future<AssetEntity?> savePhoto(File file) async {
    return await PhotoManager.editor.saveImageWithPath(file.path);
  }
}
