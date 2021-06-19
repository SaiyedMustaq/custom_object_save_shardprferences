import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:sharedpreferences/SharedPref.dart';
import 'package:sharedpreferences/Student.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  SharedPref sharedPref = SharedPref();
  Student studentSave = Student();
  Student studentLoad = Student();
  TextEditingController idTextEditingController = new TextEditingController();
  TextEditingController nameTextEditingController = new TextEditingController();
  TextEditingController surnameTextEditingController =
      new TextEditingController();
  TextEditingController mobileTextEditingController =
      new TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(left: 20.0, right: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 20.0),
              TextFormField(
                controller: idTextEditingController,
                onChanged: (value) {
                  studentSave.id = int.parse(value);
                  setState(() {});
                },
                decoration: InputDecoration(
                    hintText: 'Enter id',
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.only(left: 5.0)),
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 10.0),
              TextFormField(
                onChanged: (value) {
                  studentSave.name = value;
                  setState(() {});
                },
                decoration: InputDecoration(
                    hintText: 'Enter name',
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.only(left: 5.0)),
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.text,
              ),
              SizedBox(height: 10.0),
              TextFormField(
                onChanged: (value) {
                  studentSave.surname = value;
                  setState(() {});
                },
                decoration: InputDecoration(
                    hintText: 'Enter surname',
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.only(left: 5.0)),
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.text,
              ),
              SizedBox(height: 10.0),
              TextFormField(
                onChanged: (value) {
                  studentSave.mobile = int.parse(value);
                  setState(() {});
                },
                decoration: InputDecoration(
                    hintText: 'Enter mobile',
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.only(left: 5.0)),
                textInputAction: TextInputAction.done,
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  MaterialButton(
                    onPressed: () {
                      saveToPref();
                    },
                    child: Text('Save'),
                    color: Colors.blue,
                    textColor: Colors.white,
                  ),
                  MaterialButton(
                    onPressed: () => loadPref(),
                    child: Text('Load'),
                    color: Colors.blue,
                    textColor: Colors.white,
                  ),
                  MaterialButton(
                    onPressed: () => removePref(),
                    child: Text('Remove'),
                    color: Colors.blue,
                    textColor: Colors.white,
                  ),
                ],
              ),
              SizedBox(height: 20.0),
              Text(
                studentLoad.id == null ? "" : studentLoad.id.toString(),
                style: myStyle,
              ),
              Text(
                studentLoad.name == null ? "" : studentLoad.name.toString(),
                style: myStyle,
              ),
              Text(
                studentLoad.surname == null
                    ? ""
                    : studentLoad.surname.toString(),
                style: myStyle,
              ),
              Text(
                studentLoad.mobile == null ? "" : studentLoad.mobile.toString(),
                style: myStyle,
              ),
            ],
          ),
        ),
      ),
    );
  }

  final myStyle = TextStyle(fontSize: 25);

  saveToPref() async {
    print(
        '${studentSave.id} ${studentSave.name} ${studentSave.surname} ${studentSave.mobile}');
    sharedPref.save('student', studentSave);
  }

  loadPref() async {
    try {
      Student student = Student.fromJson(await sharedPref.read("student"));
      studentLoad = student;
      print(
          '${studentLoad.id} ${studentLoad.name} ${studentLoad.surname} ${studentLoad.mobile}');
      setState(() {});
    } catch (e) {
      log(e.toString());
    }
  }

  removePref() async {
    sharedPref.remove("student");
    setState(() {});
  }
}
