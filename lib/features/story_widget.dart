import 'package:flutter/material.dart';
import 'package:story_approve/core/api.dart';
import 'package:story_approve/core/story_model.dart';

class StoryWidget extends StatelessWidget {
  const StoryWidget({super.key, required this.story, required this.index});

  final StoryModel story;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: [
          ListView(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            children: [
              Text(story.name,
                  style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.w500)),
              const SizedBox(height: 8),
              Align(
                alignment: Alignment.center,
                child: Text(story.title,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold)),
              ),
              const SizedBox(height: 16),
              Hero(
                  tag: index,
                  child: Image.network(story.picture, fit: BoxFit.cover)),
              const SizedBox(height: 16),
              Text(story.longBio, style: const TextStyle(fontSize: 14)),
              const SizedBox(height: 100),
            ],
          ),
          Positioned.fill(
            bottom: 20,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FilledButton(
                    onPressed: () async {
                      await deleteStory(story.id.toString());
                    },
                    style: FilledButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 16),
                      backgroundColor: Colors.red,
                    ),
                    child: const Text("Reject"),
                  ),
                  const SizedBox(width: 35),
                  FilledButton(
                    onPressed: () async {
                      try {
                        await approveStory(story.id.toString());
                        if (context.mounted) Navigator.of(context).pop();
                      } catch (e) {
                        print(e);
                      }
                    },
                    style: FilledButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 16),
                      backgroundColor: Colors.green,
                    ),
                    child: const Text("Accept"),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
