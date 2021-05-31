import 'package:flutter/material.dart';
import 'package:flutter_express_app_demo/screens/register.screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,

      ),
      debugShowCheckedModeBanner: false,
      initialRoute: RegisterScreen.id,
      routes: <String, WidgetBuilder>{
        RegisterScreen.id: (BuildContext context) => new RegisterScreen(),
      },
      home: Container(),
    );
  }
}
