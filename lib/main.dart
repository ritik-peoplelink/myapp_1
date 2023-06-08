import 'package:flutter/material.dart';
import 'package:myapp_1/ExpensionListSample/Expanded_List.dart';
import 'package:myapp_1/listProvider.dart';
import 'package:provider/provider.dart';
import './my_app_screen.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (context)=>ListProvider()),
    ],
      child: MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Expansion List'),
        ),
        //body: const MyAppScreen(),  Custum Creation using Expanded Container
        body:const  ExpandedListSample()
      ),
    ),
    );
  }
}

