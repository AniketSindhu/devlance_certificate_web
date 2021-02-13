import 'package:devlance_certificate_web/screens/homepage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _initialization,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return MaterialApp(
              home: Scaffold(
                body: Center(child: CircularProgressIndicator()),
              ),
            );
          } else if (snapshot.connectionState == ConnectionState.done) {
            return MaterialApp(
              title: 'Devlance certificates verfier',
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                primarySwatch: Colors.blue,
                visualDensity: VisualDensity.adaptivePlatformDensity,
              ),
              home: HomePage(),
            );
          } else {
            return MaterialApp(
              home: Scaffold(
                body: Center(
                    child: Text(
                  "Network error",
                  style: TextStyle(color: Colors.red),
                )),
              ),
            );
          }
        });
  }
}
