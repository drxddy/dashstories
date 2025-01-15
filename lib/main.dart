import 'package:dashstories/domain/providers/dash_shorts_provider.dart';
import 'package:dashstories/domain/services/bootstrap_service.dart';
import 'package:dashstories/presentation/dash_stories.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  BootstrapService.start(() {
    runApp(MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => DashShortsProvider()),
    ], child: const MyApp()));
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: const DashStories(),
    );
  }
}
