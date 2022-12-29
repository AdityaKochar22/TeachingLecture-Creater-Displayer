import 'dart:convert';

import 'package:flutter/material.dart';
import 'dart:ui';

import 'package:http/http.dart' as http;
import 'main.dart';

class Lect {
  String baseUrl = "http://127.0.0.1:8000/datt1";
  Future<List> getAllData() async {
    try {
      var response = await http.get(Uri.parse(baseUrl));
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return Future.error('Service Error');
      }
    } catch (e) {
      return Future.error(e);
    }
  }
}

class Lecbrief extends StatelessWidget {
  const Lecbrief({Key? key}) : super(key: key);

  get lecturedetail => Lect();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('DETATILS'),
        ),

        // ignore: avoid_unnecessary_containers
        body: Container(
          child: FutureBuilder<List>(
            future: lecturedetail.getAllData(),
            builder: (context, snapshot) {
              // ignore: avoid_print
              // print(snapshot.data);
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data?.length,
                    itemBuilder: (context, i) {
                      return Card(
                        margin: const EdgeInsets.all(8),
                        shadowColor: Colors.deepOrange,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        clipBehavior: Clip.antiAlias,
                        elevation: 12,
                        child: ListTile(
                          title: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // ignore: prefer_const_constructors
                              const SizedBox(
                                width: 5.0,
                                height: 5.0,
                              ),
                              Text(
                                '${snapshot.data![i]['title']}',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 30),
                              ),
                              RichText(
                                text: TextSpan(
                                  style: DefaultTextStyle.of(context).style,
                                  children: <TextSpan>[
                                    const TextSpan(
                                        text: 'Venue :',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20)),
                                    TextSpan(
                                        text:
                                            ' ${snapshot.data![i]['timenven']}',
                                        style: TextStyle(fontSize: 20)),
                                  ],
                                ),
                              ),
                              RichText(
                                text: TextSpan(
                                  style: DefaultTextStyle.of(context).style,
                                  children: <TextSpan>[
                                    const TextSpan(
                                        text: 'Date :',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20)),
                                    TextSpan(
                                        text: ' ${snapshot.data![i]['date']}',
                                        style: TextStyle(fontSize: 20)),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                width: 5.0,
                                height: 5.0,
                              ),
                              RichText(
                                text: TextSpan(
                                  style: DefaultTextStyle.of(context).style,
                                  children: <TextSpan>[
                                    const TextSpan(
                                        text: 'Brief Description :',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15)),
                                    TextSpan(
                                        text: ' ${snapshot.data![i]['shodet']}',
                                        style: TextStyle(fontSize: 15)),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                width: 5.0,
                                height: 5.0,
                              ),
                              MaterialButton(
                                onPressed: () {},
                                child: RichText(
                                  text: TextSpan(
                                    style: DefaultTextStyle.of(context).style,
                                    children: <TextSpan>[
                                      const TextSpan(
                                          text: 'Prerequisites :',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold)),
                                      TextSpan(
                                          text:
                                              ' ${snapshot.data![i]['prereq']}'),
                                    ],
                                  ),
                                ),
                                color: Colors.green[200],
                              ),
                              const SizedBox(
                                width: 5.0,
                                height: 5.0,
                              ),
                              MaterialButton(
                                onPressed: () {},
                                child: RichText(
                                  text: TextSpan(
                                    style: DefaultTextStyle.of(context).style,
                                    children: <TextSpan>[
                                      const TextSpan(
                                          text: 'Outcome :',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold)),
                                      TextSpan(
                                          text: ' ${snapshot.data![i]['out']}'),
                                    ],
                                  ),
                                ),
                                color: Colors.green[200],
                              ),
                            ],
                          ),
                        ),
                      );
                    });
              } else {
                return const Center(
                  child: Text('No Data Found'),
                );
              }
            },
          ),
        ));
  }
}
