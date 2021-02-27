import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sqflite_usage/Model/Student.dart';
import 'package:sqflite_usage/utils/database_helper.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return StateHome();
  }
}

class StateHome extends State<HomePage> {
  DatabaseHelper databaseHelper;
  List<Student> list;
  var key = GlobalKey<FormState>();
  bool Iscontinuous = false;
  var _controller = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    databaseHelper = DatabaseHelper();
    list = new List<Student>();
    databaseHelper.getAllStudents().then((value) {
      for (Map getStudentMap in value) {
        list.add(Student.fromMap(getStudentMap));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Students CRUD"),
        backgroundColor: Colors.teal.shade200,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Form(
              child: TextFormField(
                controller: _controller,
                decoration: InputDecoration(
                  labelText: "name",
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.deepPurple)),
                ),
              ),
            ),
          ),
          SwitchListTile(
            title: Text("Continuous"),
            value: Iscontinuous,
            onChanged: (value) {
              setState(() {
                Iscontinuous = value;
              });
            },
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30, left: 30),
                child: RaisedButton(
                  onPressed: () {
                    addStudent();
                  },
                  color: Colors.green,
                  child: Text("Add"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30, left: 30),
                child: RaisedButton(
                  onPressed: () {

                    deleteTable();
                  },
                  color: Colors.redAccent,
                  child: Text("Remove all "),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30, left: 30),
                child: RaisedButton(
                  onPressed: () {},
                  color: Colors.yellow,
                  child: Text("Update"),
                ),
              ),
            ],
          ),
          Expanded(child: studentList()),
        ],
      ),
    );
  }

  Widget studentList() {
    return ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
          return Card(
            color: list[index].continuous == 1 ? Colors.green.shade300 : Colors.red.shade300,
            elevation: 0,
            child: ListTile(
              leading: Text(list[index].id.toString()),
              title: Text(list[index].name),

            ),
          );
        });
  }

  void addStudent() async{
     var dataId =await databaseHelper.addDatabase(Student(_controller.text, Iscontinuous == true ? 1 : 0 ));
     if(dataId>0){
       setState(() {
         list.insert(0,Student.withId(_controller.text,dataId,Iscontinuous == true ? 1 : 0 ));
       });
     }

  }

  void deleteTable() async{
    var rowCount =await databaseHelper.deleteAll();
    if(rowCount>0){
      setState(() {
        list.clear();
      });
    }

  }
}
