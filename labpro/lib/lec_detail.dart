// import 'dart:ui';

// import 'package:flutter/material.dart';
// import 'package:labpro/detail.dart';

// class Lec_detail extends StatelessWidget {
//   Lec_detail({Key? key, required this.details}) : super(key: key);

//   var details = Details();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.purple,
//         title: const Text("Lec Details"),
//         leading: IconButton(
//             onPressed: () => Navigator.pop(context),
//             icon: const Icon(Icons.arrow_back)),
//       ),
//       body: Container(
//         padding: const EdgeInsets.all(20),
//         child: ListView(
//           children: [
//             ListTile(
//               title: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   // ignore: prefer_const_constructors
//                   Chip(
//                     padding: const EdgeInsets.all(20),
//                     label: Text("Lecture Details"),
//                     backgroundColor: Colors.deepPurple,
//                     labelStyle: TextStyle(color: Colors.white),
//                   ),
//                   const SizedBox(
//                     width: 5.0,
//                     height: 5.0,
//                   ),
//                   Text(
//                     'Title of The Lecture is: ${Details.lecname}',
//                     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
//                   ),
//                   Text(
//                     'Time and Venue of Lecture is: ${Details.timeandven}',
//                     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
//                   ),
//                   const SizedBox(
//                     width: 20.0,
//                     height: 30.0,
//                   ),
//                   Text(
//                     'Here is a breif description of lecture: ${Details.short}',
//                     style:
//                         TextStyle(fontWeight: FontWeight.normal, fontSize: 18),
//                   ),
//                   const SizedBox(
//                     width: 20.0,
//                     height: 30.0,
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       MaterialButton(
//                         onPressed: () {},
//                         child: Text('Prerequisites:  ${Details.prereq}'),
//                         color: Colors.blue[200],
//                       ),
//                       Text(
//                         'Outcome: ${Details.out}',
//                         style: TextStyle(
//                             fontWeight: FontWeight.normal, fontSize: 18),
//                       ),
//                       // MaterialButton(
//                       //   onPressed: () {},
//                       //   child: Text('Prerequisites:  ${Details.prereq}'),
//                       //   color: Colors.blue[200],
//                       // )
//                     ],
//                   ),
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
