import 'package:flutter/material.dart';
import 'package:newgooglemap/convertLatLan.dart';
import 'home_screen.dart';
void main()
{
  runApp(firstScreen());
}
class firstScreen extends StatefulWidget {
  const firstScreen({Key? key}) : super(key: key);

  @override
  State<firstScreen> createState() => _firstScreenState();
}

class _firstScreenState extends State<firstScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ConvertLatLan(),
    );
  }
}
