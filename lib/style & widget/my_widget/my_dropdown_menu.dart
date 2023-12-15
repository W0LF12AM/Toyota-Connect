// // import 'package:flutter/material.dart';

// // const List<String> menu = <String>[
// //   'Body Repairment',
// //   'Machine Check Up',
// //   'Oil Change'
// // ];

// // const String intialmenu = 'Pilih menu';

// // class DropdownMenuExample extends StatefulWidget {
// //   const DropdownMenuExample({super.key});

// //   @override
// //   State<DropdownMenuExample> createState() => _DropdownMenuExampleState();
// // }

// // class _DropdownMenuExampleState extends State<DropdownMenuExample> {
// //   String dropdownValue = menu.first;
// //   String initialMenu = intialmenu;

// //   @override
// //   Widget build(BuildContext context) {
// //     return DropdownMenu<String>(
// //       initialSelection: initialMenu,
// //       width: 390,
// //       textStyle: TextStyle(color: Colors.black12),
// //       onSelected: (String? value) {
// //         // This is called when the user selects an item.
// //         setState(() {
// //           dropdownValue = value!;
// //         });
// //       },
// //       dropdownMenuEntries: menu.map<DropdownMenuEntry<String>>((String value) {
// //         return DropdownMenuEntry<String>(value: value, label: value);
// //       }).toList(),
// //     );
// //   }
// // }

// import 'package:flutter/material.dart';



// class MyDropdownMenuPage extends StatefulWidget {
//   @override
//   _MyDropdownMenuPageState createState() => _MyDropdownMenuPageState();
// }

// class _MyDropdownMenuPageState extends State<MyDropdownMenuPage> {
//   List.Map

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('DropdownMenu Example'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text('Selected Value: ${selectedValue ?? 'None'}'),
//             PopupMenuButton<String>(
//               onSelected: (String value) {
//                 setState(() {
//                   selectedValue = value;
//                 });
//               },
//               itemBuilder: (BuildContext context) {
//                 return <PopupMenuEntry<String>>[
//                   PopupMenuItem<String>(
//                     value: 'Option 1',
//                     child: Text('Option 1'),
//                   ),
//                   PopupMenuItem<String>(
//                     value: 'Option 2',
//                     child: Text('Option 2'),
//                   ),
//                   PopupMenuItem<String>(
//                     value: 'Option 3',
//                     child: Text('Option 3'),
//                   ),
//                 ];
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
