import 'package:flutter/material.dart';
import 'package:photo_manager/photo_manager.dart';

class MediaSelectionProvider extends ChangeNotifier {
  final bool isMultipleImage;
  final Map<String, AssetEntity> _multipleSelected = {};
  AssetEntity? _singleSelected;

  MediaSelectionProvider({this.isMultipleImage = false});

  Map<String, AssetEntity> get multipleSelected => _multipleSelected;
  AssetEntity? get singleSelected => _singleSelected;

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
    notifyListeners();
  }

  List<AssetEntity> get selectedAssets {
    return isMultipleImage ? _multipleSelected.values.toList() : _singleSelected != null ? [_singleSelected!] : [];
  }

  bool isSelected(AssetEntity assetEntity) {
    if (isMultipleImage) {
      return _multipleSelected.containsKey(assetEntity.id);
    } else {
      return _singleSelected?.id == assetEntity.id;
    }
  }
}
