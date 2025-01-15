import 'package:cached_network_image/cached_network_image.dart';
import 'package:dashstories/data/models/show_model.dart';
import 'package:dashstories/domain/providers/dash_shorts_provider.dart';
import 'package:dashstories/presentation/story_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DashStories extends StatefulWidget {
  const DashStories({super.key});
  @override
  State<DashStories> createState() => _DashStoriesState();
}

class _DashStoriesState extends State<DashStories> {
  @override
  Widget build(BuildContext context) {
    return Consumer<DashShortsProvider>(
      builder: (context, provider, _) => Scaffold(
          backgroundColor: Colors.black,
          body: SafeArea(
            child: GridView.builder(
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemCount: provider.shorts.length,
              itemBuilder: (context, index) =>
                  _buildShortWidget(provider, index),
            ),
          )),
    );
  }

  Widget _buildShortWidget(DashShortsProvider provider, int index) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) =>
                StoryView(index: index, short: provider.shorts[index]),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.all(8),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Stack(
          children: [
            if (provider.shorts[index].show.thumbNailUrl != null) ...{
              CachedNetworkImage(
                imageUrl: provider.shorts[index].show.thumbNailUrl!,
                fit: BoxFit.cover,
              ),
            },
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                    provider.shorts[index].show.name,
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    provider.shorts[index].show.description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.start,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ShowBuilder extends StatelessWidget {
  final List<ShowModel>? shows;

  const ShowBuilder({super.key, this.shows});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: shows?.length ?? 0,
      itemBuilder: (context, index) {
        final show = shows![index];
        return ListTile(
          title: Text(show.name),
          subtitle: Text(show.description),
        );
      },
    );
  }
}
