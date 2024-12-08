import 'package:flutter/material.dart';
import 'package:photo_manager/photo_manager.dart';

class MediaSelectionController {
  final bool isMultipleImage;
  final Map<String, AssetEntity> _multipleSelected = {};
  AssetEntity? _singleSelected;

  MediaSelectionController({this.isMultipleImage = false});

  // Lấy danh sách ảnh đã chọn
  List<AssetEntity> get selectedAssets {
    return isMultipleImage
        ? _multipleSelected.values.toList()
        : _singleSelected != null
        ? [_singleSelected!]
        : [];
  }

  // Kiểm tra xem ảnh có được chọn hay không
  bool isSelected(AssetEntity assetEntity) {
    if (isMultipleImage) {
      return _multipleSelected.containsKey(assetEntity.id);
    } else {
      return _singleSelected?.id == assetEntity.id;
    }
  }

  // Phương thức để chọn hoặc bỏ chọn media
  void pickMedia(AssetEntity assetEntity) {
    if (isMultipleImage) {
      // Toggle the selection for multiple images
      if (_multipleSelected.containsKey(assetEntity.id)) {
        _multipleSelected.remove(assetEntity.id);
      } else {
        _multipleSelected[assetEntity.id] = assetEntity;
      }
    } else {
      // For single selection, toggle it on/off
      if (_singleSelected == null || _singleSelected?.id != assetEntity.id) {
        _singleSelected = assetEntity;
      } else {
        _singleSelected = null;
      }
    }
  }
}
