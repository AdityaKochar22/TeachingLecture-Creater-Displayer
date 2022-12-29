import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:labpro/detail.dart';
import 'package:labpro/lec_detail.dart';
import 'package:http/http.dart' as http;
import 'package:labpro/lecbrief.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Project',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: const MyHomePage(title: 'Lecture Details Form'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _formKey = GlobalKey<FormState>();

  final lecController = TextEditingController();
  final preController = TextEditingController();
  final outController = TextEditingController();
  final shorController = TextEditingController();
  final venController = TextEditingController();
  final dateinput = TextEditingController();
  DateTime _dateTime = DateTime.now();
  Lect lecturedetail = Lect();

  void _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2022),
      lastDate: DateTime(2023),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: lecController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Field can be empty';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        icon: Icon(Icons.book),
                        hintText: 'Mention the Title of the Lecture',
                        labelText: 'Lecture Title',
                      ),
                    ),
                    const SizedBox(
                      width: 20.0,
                      height: 30.0,
                    ),
                    TextFormField(
                      controller: venController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Field can be empty';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        icon: Icon(Icons.location_disabled),
                        hintText: 'Mention the venue of the Lecture ',
                        labelText: ' Lecture Venue',
                      ),
                    ),
                    const SizedBox(
                      width: 20.0,
                      height: 30.0,
                    ),
                    ElevatedButton(
                      onPressed: _showDatePicker,
                      child: TextField(
                        controller:
                            dateinput, //editing controller of this TextField
                        decoration: const InputDecoration(
                            icon:
                                Icon(Icons.calendar_today), //icon of text field
                            labelText:
                                "Enter Date of the Lecture" //label text of field
                            ),
                        readOnly:
                            true, //set it true, so that user will not able to edit text
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(
                                  2000), //DateTime.now() - not to allow to choose before today.
                              lastDate: DateTime(2101));

                          if (pickedDate != null) {
                            print(
                                pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                            String formattedDate =
                                DateFormat('yyyy-MM-dd').format(pickedDate);
                            print(
                                formattedDate); //formatted date output using intl package =>  2021-03-16
                            //you can implement different kind of Date Format here according to your requirement

                            setState(() {
                              dateinput.text =
                                  formattedDate; //set output date to TextField value.
                            });
                          } else {
                            print("Date is not selected");
                          }
                        },
                      ),
                    ),
                    const SizedBox(
                      width: 20.0,
                      height: 30.0,
                    ),
                    TextFormField(
                      controller: preController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Field can be empty';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        icon: Icon(Icons.request_quote),
                        hintText: 'Mention requistes if Required',
                        labelText: 'Pre Requisites',
                      ),
                    ),
                    const SizedBox(
                      width: 20.0,
                      height: 30.0,
                    ),
                    TextFormField(
                      controller: outController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Field can be empty';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        icon: Icon(Icons.output),
                        hintText:
                            'What Outcomes will the Students learn through the Lecture',
                        labelText: 'Outcome',
                      ),
                    ),
                    const SizedBox(
                      width: 20.0,
                      height: 30.0,
                    ),
                    TextFormField(
                      controller: shorController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Field can be empty';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        icon: Icon(Icons.short_text_outlined),
                        hintText:
                            'Give Some Brief Description about the lecture ',
                        labelText: 'Short Detail',
                      ),
                    ),
                    const SizedBox(
                      width: 20.0,
                      height: 30.0,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          apiHit();
                          // Details details = Details();
                          // Details.lecname = lecController.text;
                          // Details.prereq = preController.text;
                          // Details.out = outController.text;
                          // Details.short = shorController.text;
                          // Details.timeandven = venController.text;
                          // Navigator.push(context,
                          //     MaterialPageRoute(builder: (context) {
                          //   return Lec_detail(details: details);
                          // }));
                        }
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Lecbrief()));
                      },
                      child: const Text('Submit'),
                    ),
                    const SizedBox(
                      width: 20.0,
                      height: 30.0,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Lecbrief()));
                        },
                        child: const Text('View Lecture Details'))
                  ],
                ))
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Future<void> apiHit() async {
    String applydate = DateFormat('yyyy-MM-dd').format(DateTime.now());
    print(dateinput.text);
    final http.Response response = await http.post(
      Uri.parse('http://127.0.0.1:8000/datt'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "title": lecController.text,
        "timenven": venController.text,
        "prereq": preController.text,
        "out": outController.text,
        "shodet": shorController.text,
        "datee": dateinput.text
      }),
    );
    print("Hi");
    print(response.statusCode);
    if (response.statusCode == 200) {
      print("succesfully record added");
    }
  }
}
