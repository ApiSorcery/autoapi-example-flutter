import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class PhotoGalleryPage extends StatefulWidget {
  final Map<String, dynamic> data;
  const PhotoGalleryPage(this.data, {super.key});

  @override
  State<PhotoGalleryPage> createState() => _PhotoGalleryPageState();
}

class _PhotoGalleryPageState extends State<PhotoGalleryPage> {
  PageController? _pageController;
  int _initIndex = 0; //初始index
  int _currentIndex = 0;
  List<String> _photoList = <String>[];
  Color _preivewBgColor = Colors.black;

  @override
  void initState() {
    super.initState();
    _photoList = widget.data['photoList'] ?? <String>[];
    _initIndex = widget.data['index'] ?? 0;
    _preivewBgColor = widget.data['preivewBgColor'] ?? Colors.black;
    _currentIndex = _initIndex + 1;
    _pageController = PageController(initialPage: _initIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(58, 102, 242, 1),
        title: Text('$_currentIndex / ${_photoList.length}'),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          color: _preivewBgColor,
        ),
        constraints: BoxConstraints.expand(
          height: MediaQuery.of(context).size.height,
        ),
        child: PhotoViewGallery.builder(
          itemCount: _photoList.length,
          builder: (BuildContext context, int index) {
            return PhotoViewGalleryPageOptions(
                imageProvider: NetworkImage(_photoList[index]),
                minScale: PhotoViewComputedScale.contained,
                maxScale: PhotoViewComputedScale.covered * 2);
          },
          scrollPhysics: const BouncingScrollPhysics(),
          backgroundDecoration: BoxDecoration(
            color: _preivewBgColor,
          ),
          pageController: _pageController,
          onPageChanged: (int index) {
            setState(() {
              _currentIndex = index + 1;
            });
          },
        ),
      ),
    );
  }
}
