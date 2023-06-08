import 'package:flutter/cupertino.dart';

import 'my_panel.dart';

class myLists{
  final List<Widget> myList = List.generate(20, (index) => MyPanel(index) );
}

class ListProvider extends ChangeNotifier{
  static var obj =  myLists();
  final List<Widget> myPanelList = List.from(obj.myList);
  
  void deletePanelValue(indexx){
    myPanelList.removeAt(indexx);
    print("Clicked------------ $indexx");
    notifyListeners();
  }
}