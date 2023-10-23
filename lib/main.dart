import 'package:flutter/material.dart';
import 'package:story_approve/features/login.dart';
import 'package:supabase_auth_ui/supabase_auth_ui.dart';

late SupabaseClient client;

void main() async {
  await Supabase.initialize(
    url: 'https://dcxanhwjwbbklpbkejdn.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImRjeGFuaHdqd2Jia2xwYmtlamRuIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTc5NzA4MjQsImV4cCI6MjAxMzU0NjgyNH0.N-nQrel9FVb7iPkQ1iwKhGHFmQjvoNH0Fnxb7jy0eXg',
  );
  client = SupabaseClient('https://dcxanhwjwbbklpbkejdn.supabase.co',
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImRjeGFuaHdqd2Jia2xwYmtlamRuIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTc5NzA4MjQsImV4cCI6MjAxMzU0NjgyNH0.N-nQrel9FVb7iPkQ1iwKhGHFmQjvoNH0Fnxb7jy0eXg');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const LoginScreen(),
    );
  }
}
