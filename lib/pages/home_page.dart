import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sqflite_usage/Model/Student.dart';
import 'package:sqflite_usage/utils/database_helper.dart';


class HomePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return StateHome();

  }

}
class StateHome extends State<HomePage>{
DatabaseHelper databaseHelper = DatabaseHelper();


  @override
  Widget build(BuildContext context) {
    databaseHelper.addDatabase(Student("tuba", 1));
    getStudents();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Students"
        ),
        backgroundColor: Colors.teal.shade200,
      ),
    );
  }

   getStudents() async{
    var resuult= await databaseHelper.getAllStudents();
    print(resuult);
   }

}