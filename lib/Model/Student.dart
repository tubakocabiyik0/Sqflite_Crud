import 'package:flutter/material.dart';
class Student {
  int _id;
  String _name;
  int _continuous;

  int get id => _id;

  set id(int value) {
    _id = value;
  }

  String get name => _name;

  int get continuous => _continuous;

  set continuous(int value) {
    _continuous = value;
  }

  set name(String value) {
    _name = value;
  }

  Student(this._name,this._continuous);
  Student.WidhtId(this._id,this._name,this._continuous);

  Map<String,dynamic> toMap(){
    Map<String,dynamic> map ;
    map['id'] = id;
    map['name'] = name;
    map['continuous'] = continuous;

  }

  Student fromMap (Map<String,dynamic> map){
    id=map['id'];
    name=map['name'];
    continuous=map['continuous'];
  }

}


