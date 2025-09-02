import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zoom_module/zoom_integration/zoom_launcher.dart';

class MyZoomScreen extends StatefulWidget {
  const MyZoomScreen({super.key});

  @override
  State<MyZoomScreen> createState() => _MyZoomScreenState();
}

class _MyZoomScreenState extends State<MyZoomScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Widget>(
      future: ZoomLauncher.initializeAndGetVideoChatWidget(
        appKey: "lDH5eS-EQ8CtrenG_3h-Qg",
        appSecret: "johztfiUeCBmuouMJOWafvSnrb1JLCtlJa5p",
        sessionDetails: {
          "sessionName": "Demo Session",
          "sessionPassword": "123456",
          "displayName": "Nurse",
          "roleType": "0", // 1 = host, 0 = participant
          "sessionTimeout": "30", // in minutes
          "isLobbyRequired": "true",
        },
      ),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            backgroundColor: Colors.black,
            body: Center(
              child: CupertinoActivityIndicator(color: Colors.white),
            ),
          );
        } else if (snapshot.hasError) {
          return Scaffold(
            body: Center(child: Text("Error: ${snapshot.error}")),
          );
        } else {
          return snapshot.data!;
        }
      },
    );
  }
}
