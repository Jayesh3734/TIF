import 'package:flutter/material.dart';
import 'package:tif/screens/event_details_screen.dart';
import 'package:tif/screens/home_screen.dart';
import 'package:tif/screens/search_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Events',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/evevent: null,ent-details': (context) => EventDetailsScreen(
            event: ModalRoute.of(context)!.settings.arguments as dynamic),
      },
      onGenerateRoute: (settings) {
        if (settings.name == '/search') {
          return MaterialPageRoute(builder: (context) => SearchScreen());
        }
        return null;
      },
    );
  }
}
