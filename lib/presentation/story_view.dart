import 'package:cached_network_image/cached_network_image.dart';
import 'package:dashstories/data/data.dart';
import 'package:dashstories/domain/providers/dash_shorts_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StoryView extends StatefulWidget {
  final ShortModel short;
  final int index;
  const StoryView({super.key, required this.short, required this.index});

  @override
  State<StoryView> createState() => _StoryViewState();
}

class _StoryViewState extends State<StoryView> {
  late final int initialIndexPos = widget.index;
  late final PageController _pageController =
      PageController(initialPage: initialIndexPos);
  double _currentPosition = 0.0;
  late ShortModel short = widget.short;
  late final ScrollController _controller =
      ScrollController(initialScrollOffset: _currentPosition);

  @override
  void initState() {
    _currentPosition = short.getCurrentPosition();
    Future.delayed(const Duration(milliseconds: 1000), () {
      _controller.jumpTo(_currentPosition);
    });
    _controller.addListener(() {
      _currentPosition = _controller.offset;
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    short.saveCurrentPosition(_currentPosition);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<DashShortsProvider>(context, listen: false);
    return Scaffold(
      body: PageView.builder(
          controller: _pageController,
          itemCount: provider.shorts.length,
          onPageChanged: (value) => setState(() {
                short = provider.shorts[value];
                _currentPosition = short.getCurrentPosition();
                Future.delayed(const Duration(milliseconds: 1000), () {
                  _controller.jumpTo(_currentPosition);
                });
                short.saveCurrentPosition(_currentPosition);
              }),
          itemBuilder: (context, idx) {
            final currentShort = provider.shorts[idx];
            if (currentShort.show.episodes.isEmpty) {
              return const Center(
                child: Text('No episodes found'),
              );
            }
            return ListView.builder(
              scrollDirection: Axis.vertical,
              controller: _controller,
              itemCount: currentShort.show.episodes[0].panels.length,
              itemBuilder: (context, index) {
                return CachedNetworkImage(
                  imageUrl:
                      currentShort.show.episodes[0].panels[index].imageUrl,
                  memCacheWidth: currentShort
                      .show.episodes[0].panels[index].metadata.width,
                  fit: BoxFit.fitWidth,
                );
              },
            );
          }),
    );
  }
}
