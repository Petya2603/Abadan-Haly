import 'dart:io';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:video_player/video_player.dart';

class MediaViewer extends StatefulWidget {
  final String mediaPath;

  const MediaViewer({super.key, required this.mediaPath});

  @override
  _MediaViewerState createState() => _MediaViewerState();
}

class _MediaViewerState extends State<MediaViewer> {
  late VideoPlayerController _videoController;
  bool _isVideo = false;

  @override
  void initState() {
    super.initState();
    if (widget.mediaPath.endsWith('.mp4') ||
        widget.mediaPath.endsWith('.mov') ||
        widget.mediaPath.endsWith('.avi')) {
      _isVideo = true;
      _videoController = VideoPlayerController.file(File(widget.mediaPath))
        ..initialize().then((_) {
          setState(() {});
          _videoController.play();
        });
    }
  }

  @override
  void dispose() {
    if (_isVideo) {
      _videoController.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      backgroundColor: Colors.black,
      body: Center(
        child: _isVideo
            ? AspectRatio(
                aspectRatio: _videoController.value.aspectRatio,
                child: VideoPlayer(_videoController),
              )
            : PhotoView(
                imageProvider: FileImage(File(widget.mediaPath)),
              ),
      ),
    );
  }
}
