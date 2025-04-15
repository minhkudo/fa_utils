import 'package:flutter/material.dart';
import 'package:photo_manager/photo_manager.dart';

class MediaSelectionController {
  final bool isMultipleImage;

  final Map<String, AssetEntity> _multipleSelected = {};
  AssetEntity? _singleSelected;

  MediaSelectionController({this.isMultipleImage = false});

  /// Danh sách ảnh đã chọn
  List<AssetEntity> get selectedAssets {
    if (isMultipleImage) {
      return _multipleSelected.values.toList();
    }
    return _singleSelected != null ? [_singleSelected!] : [];
  }

  /// Kiểm tra một asset đã được chọn hay chưa
  bool isSelected(AssetEntity assetEntity) {
    return isMultipleImage
        ? _multipleSelected.containsKey(assetEntity.id)
        : _singleSelected?.id == assetEntity.id;
  }

  /// Chọn hoặc bỏ chọn một asset
  void pickMedia(AssetEntity assetEntity) {
    if (isMultipleImage) {
      if (isSelected(assetEntity)) {
        _multipleSelected.remove(assetEntity.id);
      } else {
        _multipleSelected[assetEntity.id] = assetEntity;
      }
    } else {
      _singleSelected =
      (_singleSelected?.id == assetEntity.id) ? null : assetEntity;
    }
  }

  /// Xoá toàn bộ media đã chọn
  void clearSelection() {
    _multipleSelected.clear();
    _singleSelected = null;
  }

  /// Kiểm tra xem có media nào đang được chọn hay không
  bool get hasSelection =>
      isMultipleImage ? _multipleSelected.isNotEmpty : _singleSelected != null;
}

