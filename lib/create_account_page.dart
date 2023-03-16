// import 'package:english_words/english_words.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'main.dart';
//
//
// class CreateAccountPage extends StatefulWidget {
//   const CreateAccountPage({super.key});
//   @override
//   State<CreateAccountPage> createState() => _MyCreateAccountPageState();
// }
//
// class _MyCreateAccountPageState extends State<CreateAccountPage> {
//
//   void _createAccountLogin() {
//     setState(() {
//       Navigator.push(
//         context,
//         MaterialPageRoute(builder: (context) => const MyApp()),
//       );
//     });
//   }
//
//   void _cancelAccountLogin() {
//     setState(() {
//       Navigator.push(
//         context,
//         MaterialPageRoute(builder: (context) => const MyAppLogin()),
//       );
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("BestMatcher"),
//       ),
//       body: Center(
//         // Center is a layout widget. It takes a single child and positions it
//         // in the middle of the parent.
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const TextField(
//               obscureText: false,
//               decoration: InputDecoration(
//                 border: OutlineInputBorder(),
//                 labelText: 'USERNAME',
//               ),
//             ),
//             const TextField(
//               obscureText: true,
//               decoration: InputDecoration(
//                 border: OutlineInputBorder(),
//                 labelText: 'PASSWORD',
//               ),
//             ),
//             const TextField(
//               obscureText: false,
//               decoration: InputDecoration(
//                 border: OutlineInputBorder(),
//                 labelText: 'EMAIL ADDRESS',
//               ),
//             ),
//             const TextField(
//               obscureText: false,
//               decoration: InputDecoration(
//                 border: OutlineInputBorder(),
//                 labelText: 'AGE',
//               ),
//             ),
//             const TextField(
//               obscureText: false,
//               decoration: InputDecoration(
//                 border: OutlineInputBorder(),
//                 labelText: 'FIRST NAME',
//               ),
//             ),
//             const TextField(
//               obscureText: false,
//               decoration: InputDecoration(
//                 border: OutlineInputBorder(),
//                 labelText: 'LAST NAME',
//               ),
//             ),
//             ElevatedButton(
//               style: ElevatedButton.styleFrom(
//                 minimumSize: Size(100, 40),
//                 maximumSize: Size(300, 40),
//               ),
//               onPressed: _createAccountLogin,
//               child: const Icon(Icons.account_box),
//             ),
//             ElevatedButton(
//               style: ElevatedButton.styleFrom(
//                 minimumSize: Size(100, 40),
//                 maximumSize: Size(300, 40),
//               ),
//               onPressed: _cancelAccountLogin,
//               child: const Icon(Icons.cancel),
//             ),
//           ],
//         ),
//       ),
// // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }