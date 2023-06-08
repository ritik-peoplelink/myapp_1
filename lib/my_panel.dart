import 'package:flutter/material.dart';
import 'package:myapp_1/listProvider.dart';
import 'package:provider/provider.dart';
class MyPanel extends StatefulWidget {
  int index;
  MyPanel(this.index,{super.key});

  @override
  State<MyPanel> createState() => _MyPanelState(index);
}

class _MyPanelState extends State<MyPanel> {
  int indexx;
  _MyPanelState(this.indexx);
  double maxheight = 150.0;//if we will make responsive then just change the height and width using media query
  double minheight = 80.0;// this is just for example so i am making it constant
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    final myProvider = Provider.of<ListProvider>(context,listen: false);
     Size size = MediaQuery.of(context).size;
    return Container(
      height: isPressed?maxheight:minheight,
      width: size.width,
      decoration: const BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Color(0xffDDDDDD),
                blurRadius: 6.0,
                spreadRadius: 2.0,
                offset: Offset(0.0, 0.0),
              )
            ],
          ),
      child : Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ListTile(
            title:  Text('Panel $indexx'),
            trailing: IconButton(
              icon: isPressed ? const Icon(Icons.keyboard_arrow_up_sharp) : const Icon(Icons.keyboard_arrow_down_sharp),
              onPressed: () {
                setState(() {
                  isPressed = !isPressed;
                  print("Btn is Clickeeddd");
                });
              },
            ),
          ),
          SizedBox(
            child: isPressed ? ListTile(
                title: Text('Hey BigMouse How are You?'),
                subtitle: Text('Yeah I am good but not well and i am busy to do something in diffrent way!!'),
                trailing: IconButton(
                icon: Icon(Icons.delete_sharp),
                onPressed: (){
                  setState(() {
                    myProvider.deletePanelValue(indexx);
                  });
                },
                ),
                
              ):null,
          ),
        ],
      )
    );
  }
}