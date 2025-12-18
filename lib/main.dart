import 'package:flutter/material.dart';
import 'package:vertical_videos/config/theme/app_theme.dart';
import 'package:provider/provider.dart';
import 'package:vertical_videos/presentation/providers/discover_provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => DiscoverProvider())
      ],
      child: MaterialApp(
        title: 'Vertical Videos',
        theme: AppTheme().getTheme(),
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(title: const Text('Material App Bar')),
          body: const Center(child: Text('Hello World')),
        ),
      ),
    );
  }
}
