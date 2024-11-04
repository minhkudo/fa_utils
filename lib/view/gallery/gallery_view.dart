import 'package:fa_utils/fa_utils.dart';
import 'package:flutter/material.dart';

import 'media_tile.dart';

typedef MediaBuilder = Widget? Function(BuildContext, AssetEntity);

class GalleryView extends StatefulWidget {
  final MediaBuilder mediaBuilder;

  const GalleryView({super.key, required this.mediaBuilder});

  @override
  State<GalleryView> createState() => _GalleryViewState();
}

class _GalleryViewState extends State<GalleryView> {
  late ScrollController _scrollController;
  List<AssetPathEntity> _albums = [];
  List<AssetEntity> _assets = [];
  Map<String, AssetEntity> _selected = {};
  final int _size = 36;
  int _page = 0;
  bool _loading = false;
  bool _hasMoreData = true;

  @override
  void initState() {
    _loading = true;
    super.initState();
    requestPermission();

    _scrollController = ScrollController()
      ..addListener(() {
        if (_scrollController.position.extentAfter < 500 && _hasMoreData && !_loading) {
          setState(() => _loading = true);
          fetchMedia();
        }
      });
  }

  void requestPermission() async {
    var permission = await PhotoManager.requestPermissionExtend();
    if (!permission.isAuth) {
      PhotoManager.openSetting();
    } else {
      List<AssetPathEntity> albums = await PhotoManager.getAssetPathList(onlyAll: true);

      setState(() {
        _albums = albums;
        _loading = false;
      });
    }
  }

  Future<void> fetchMedia({AssetPathEntity? assetPathEntity}) async {
    List<AssetEntity> assets = await loadAssets(assetPathEntity ?? ((_albums.isEmpty) ? null : _albums.first));
    List<AssetEntity> listAssets = [..._assets, ...assets];

    setState(() {
      _assets = listAssets;
      _page++;
      _hasMoreData = assets.length == _size;
      _loading = false;
    });
  }

  Future<List<AssetEntity>> loadAssets(AssetPathEntity? assetPathEntity) async =>
      await assetPathEntity?.getAssetListPaged(page: _page, size: _size) ?? [];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      controller: _scrollController,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 3,
        mainAxisSpacing: 3,
      ),
      cacheExtent: 200,
      addAutomaticKeepAlives: true,
      shrinkWrap: true,
      padding: const EdgeInsets.all(8.0),
      itemCount: _assets.length,
      itemBuilder: (context, index) => InkWell(
        onTap: () => setState(() => _selected.containsKey(_assets[index].id)
            ? _selected.remove(_assets[index].id)
            : _selected.putIfAbsent(_assets[index].id, () => _assets[index])),
        child: Container(
          decoration: BoxDecoration(
            border: (_selected.containsKey(_assets[index].id)) ? Border.all(color: Colors.blue, width: 3) : null,
          ),
          child: MediaTile(
            assetEntity: _assets[index],
          ),
        ),
      ),
    );
  }
}
