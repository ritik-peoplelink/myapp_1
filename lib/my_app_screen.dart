import 'package:flutter/material.dart';
import 'package:myapp_1/listProvider.dart';
import 'package:provider/provider.dart';
class MyAppScreen extends StatefulWidget {
  const MyAppScreen({super.key});

  @override
  State<MyAppScreen> createState() => _MyAppScreenState();
}

class _MyAppScreenState extends State<MyAppScreen> {

  Widget build(BuildContext context) { 
    final myRef = Provider.of<ListProvider>(context,listen: false);
    return ListView.builder(
      itemCount:myRef.myPanelList.length,
      itemBuilder: (context,index){
        return myRef.myPanelList[index];
      },
    );
  }
}

