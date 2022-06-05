import 'package:flutter/material.dart';
import 'package:uni/view/Pages/general_page_view.dart';
import 'package:uni/view/Pages/secondary_page_view.dart';

class FilterScreenView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => FilterScreenState();
}

class FilterItem extends SecondaryPageViewState {
  FilterItem({this.isSelected = false});
  bool isSelected;
  Icon getIcon() {
    if (isSelected) {
      return Icon(Icons.check_box);
    }
    return Icon(Icons.check_box_outline_blank);
  }
}

class Item {
  Item({this.isExpanded = false});
  bool isExpanded;
  List<FilterItem> filterItems = [
    new FilterItem(),
    new FilterItem(),
    new FilterItem()
  ];
}

class FilterScreenState extends GeneralPageViewState {
  List<Item> expandableFilters = [new Item()];
  @override
  Widget getBody(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              child: ExpansionPanelList(
                expansionCallback: (int index, bool isExpanded) {
                  setState(() {
                    expandableFilters[index].isExpanded = !isExpanded;
                  });
                },
                children: [
                  ExpansionPanel(
                    headerBuilder: (BuildContext context, bool isExpanded) {
                      return const ListTile(
                        title: Text("Áreas"),
                      );
                    },
                    body: Column(
                      children: [
                        ListTile(
                          tileColor: const Color.fromARGB(255, 247, 247, 247),
                          title: const Text("Engenharia Informatica"),
                          trailing:
                              expandableFilters[0].filterItems[0].getIcon(),
                          onTap: () {
                            setState(
                              () {
                                expandableFilters[0].filterItems[0].isSelected =
                                    !expandableFilters[0]
                                        .filterItems[0]
                                        .isSelected;
                              },
                            );
                          },
                        ),
                        ListTile(
                          tileColor: const Color.fromARGB(255, 247, 247, 247),
                          title: const Text("Engenharia Quimica"),
                          trailing:
                              expandableFilters[0].filterItems[1].getIcon(),
                          onTap: () {
                            setState(
                              () {
                                expandableFilters[0].filterItems[1].isSelected =
                                    !expandableFilters[0]
                                        .filterItems[1]
                                        .isSelected;
                              },
                            );
                          },
                        ),
                        ListTile(
                          tileColor: const Color.fromARGB(255, 247, 247, 247),
                          title: const Text("Engenharia Mecanica"),
                          trailing:
                              expandableFilters[0].filterItems[2].getIcon(),
                          onTap: () {
                            setState(
                              () {
                                expandableFilters[0].filterItems[2].isSelected =
                                    !expandableFilters[0]
                                        .filterItems[2]
                                        .isSelected;
                              },
                            );
                          },
                        ),
                      ],
                    ),
                    isExpanded: expandableFilters[0].isExpanded,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 20,
              ),
              child: Container(
                alignment: Alignment.bottomCenter,
                child: ElevatedButton(
                  key: Key('Apply'),
                  onPressed: () {
                    //
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 169, 47, 26),
                  ),
                  child: const Text('APPLY'),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
