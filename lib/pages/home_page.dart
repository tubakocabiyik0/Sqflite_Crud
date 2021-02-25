import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sqflite_usage/utils/database_helper.dart';

class HomePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return StateHome();

  }

}
class StateHome extends State<HomePage>{
  DatabaseHelper dbh = DatabaseHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Students"
        ),
        backgroundColor: Colors.teal.shade200,
      ),
    );
  }

}