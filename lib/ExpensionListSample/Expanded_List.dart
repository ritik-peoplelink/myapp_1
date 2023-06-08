import 'package:flutter/material.dart';
import 'package:myapp_1/ExpensionListSample/List_Items.dart';

class ExpandedListSample extends StatefulWidget {
  const ExpandedListSample({super.key});

  @override
  State<ExpandedListSample> createState() => _ExpandedListSampleState();
}

class _ExpandedListSampleState extends State<ExpandedListSample> {

  static List<ListItems> generateListItems(int counter){
    return List<ListItems>.generate(counter, (index) => 
      ListItems(headerData: 'Panel $index', subHeaderData: 'Hey I am Big mouse!!',description: 'Want To Delete the Panel Press On Delete!')
    );
  }

  final List<ListItems> _myItemList = generateListItems(10);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: _myPanel(),
      ),
    );
  }

  Widget _myPanel(){
    return ExpansionPanelList(
      expansionCallback: (panelIndex, isExpanded) => setState(() {
        _myItemList[panelIndex].isExpanded = !isExpanded;
      }),
      children: _myItemList.map<ExpansionPanel>((ListItems listItem){
        return ExpansionPanel(
          headerBuilder: (context, isExpanded) => ListTile(
            title: Text(listItem.headerData),
          ), 
          body: ListTile(
            title: Text(listItem.subHeaderData),
            subtitle: Text(listItem.description),
            trailing: const Icon(Icons.delete),
            onTap: (){
              setState(() {
                _myItemList.removeWhere((element) => listItem == element);
              });
            },
          ),
          isExpanded: listItem.isExpanded,
        );
      }).toList(),
    );
  }
}