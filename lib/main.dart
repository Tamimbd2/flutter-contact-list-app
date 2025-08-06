



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled12/main2.dart';

main(){

  runApp(contact());

}
class contact extends StatefulWidget {
  const contact({super.key});

  @override
  State<contact> createState() => _contactState();
}

class _contactState extends State<contact> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: con(),
    );
  }
}
