import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:uni/redux/action_creators.dart';
import 'package:uni/view/Pages/general_page_view.dart';
import 'package:uni/view/Pages/secondary_page_view.dart';

import '../../../model/app_state.dart';

class FilterScreenView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => FilterScreenState();
}

class FilterItem {
  FilterItem({this.isSelected = false, @required this.name});
  bool isSelected;
  String name;
  Icon getIcon() {
    if (isSelected) {
      return Icon(Icons.check_box);
    }
    return Icon(Icons.check_box_outline_blank);
  }
}

class Item {
  Item({this.isExpanded = false, List<String> filterItemsStrings, this.name}) {
    for (var item in filterItemsStrings) {
      filterItems.add(new FilterItem(name: item));
    }
  }
  bool isExpanded;
  String name;
  List<FilterItem> filterItems = <FilterItem>[];
}

class FilterScreenState extends GeneralPageViewState {
  List<Item> expandableFilters = [
    Item(
      name: "Áreas",
      filterItemsStrings: [
        "Engenharia Mecânica",
        "Engenharia Informática",
        "Engenharia Quimica",
      ],
    )
  ];

  @override
  Widget getBody(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            createFilter(expandableFilters[0]),
            Padding(
              padding: EdgeInsets.only(
                top: 20,
              ),
              child: Container(
                alignment: Alignment.bottomCenter,
                child: ElevatedButton(
                  key: Key('Apply'),
                  onPressed: () {
                    StoreProvider.of<AppState>(context).dispatch(
                      setJobFilters(
                        getFiltersToApply(expandableFilters),
                        Completer(),
                      ),
                    );

                    Navigator.pop(context);
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

  Widget createFilter(Item filterItem) {
    return Container(
      alignment: Alignment.center,
      child: ExpansionPanelList(
        expansionCallback: (int index, bool isExpanded) {
          setState(() {
            filterItem.isExpanded = !isExpanded;
          });
        },
        children: [
          ExpansionPanel(
            headerBuilder: (BuildContext context, bool isExpanded) {
              return ListTile(
                title: Text(filterItem.name),
              );
            },
            body: Column(children: createFilterOptions(filterItem)),
            isExpanded: filterItem.isExpanded,
          ),
        ],
      ),
    );
  }

  List<Widget> createFilterOptions(Item filter) {
    List<Widget> listFilters = <Widget>[];
    for (var item in filter.filterItems) {
      listFilters.add(
        ListTile(
          tileColor: const Color.fromARGB(255, 247, 247, 247),
          title: Text(item.name),
          trailing: item.getIcon(),
          onTap: () {
            setState(
              () {
                item.isSelected = !item.isSelected;
              },
            );
          },
        ),
      );
    }
    return listFilters;
  }

  List<String> getFiltersToApply(List<Item> filters) {
    List<String> retList = <String>[];
    for (var filterItem in filters) {
      for (var item in filterItem.filterItems) {
        if (item.isSelected) {
          retList.add(item.name);
        }
      }
    }
    return retList;
  }
}
