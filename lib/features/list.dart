import 'package:flutter/material.dart';
import 'package:story_approve/constants.dart';
import 'package:story_approve/core/api.dart';
import 'package:story_approve/core/story_model.dart';
import 'package:story_approve/features/story_widget.dart';

class StoryList extends StatefulWidget {
  const StoryList({super.key});

  @override
  State<StoryList> createState() => _StoryListState();
}

class _StoryListState extends State<StoryList> {
  List<StoryModel> stories = [];

  @override
  void initState() {
    populate();
    super.initState();
  }

  populate() async {
    var fetched = await fetchStories();
    setState(() {
      stories = fetched;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Stories list',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: stories.isEmpty
          ? const Center(
              child: CircularProgressIndicator(color: primaryColor),
            )
          : ListView.builder(
              itemCount: stories.length,
              itemBuilder: (context, index) {
                StoryModel story = stories[index];
                return ListTile(
                  title: Text(story.title),
                  leading: Text(story.name),
                  subtitle: Text(story.location),
                  onTap: () async {
                    await Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                StoryWidget(story: story, index: index)));
                    populate();
                  },
                  trailing: Hero(
                    tag: index,
                    child: Image.network(
                      story.picture,
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            ),
    );
  }
}
