class Student {
  String _name;
  int _id;
  int _continuous;

  Student(this._name, this._continuous);
  Student.withId(this._name, this._id, this._continuous);

  int get continuous => _continuous;

  set continuous(int value) {
    _continuous = value;
  }

  int get id => _id;

  set id(int value) {
    _id = value;
  }

  String get name => _name;

  set name(String value) {
    _name = value;
  }
  Map<String,dynamic> toMap(){
    var map=Map<String,dynamic>();
    
    map['id']=_id;
    map['name']=_name;
    map['continuous']=_continuous;
    return map;
  }
  
  Student.fromMap(Map<String,dynamic> map){
    this._id=map['id'];
    this._name=map['name'];
    this._continuous=map['continuous'];


  }}