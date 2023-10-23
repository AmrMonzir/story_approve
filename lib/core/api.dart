import 'package:story_approve/core/story_model.dart';
import 'package:story_approve/main.dart';

Future<bool> login(String email, String password) async {
  var res =
      await client.auth.signInWithPassword(password: password, email: email);
  return res.user != null;
}

Future<List<StoryModel>> fetchStories() async {
  var res = await client.from('story').select().eq('approved', false);
  return (res as List).map((e) => StoryModel.fromJson(e)).toList();
}

Future<void> approveStory(String id) async {
  await client.from('story').update({"approved": true}).eq("id", id);
  return;
}

Future<void> deleteStory(String id) async {
  await client.from('story').update({"approved": false}).eq("id", id);
  return;
}
