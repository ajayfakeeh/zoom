import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:zoom_module/zoom_integration/zoom_launcher.dart';
import 'package:zoommainproject/firebase_options.dart';
import 'package:zoommainproject/my_zoom_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  print("Firebase initialized: ${Firebase.apps.length}");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Page')),
      body: Center(
        child: ElevatedButton(
          onPressed: ()async {
            await ZoomLauncher().signInWithFirebase();
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const MyZoomScreen()),
            );
          },
          child: const Text('Open Zoom Meeting'),
        ),
      ),
    );
  }
}
