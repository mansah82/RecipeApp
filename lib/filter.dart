import 'package:filter_list/filter_list.dart';
import 'package:flutter/material.dart';
import 'filterListClass.dart';

class FilterPage extends StatelessWidget {
  FilterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Filter your search"),
        titleTextStyle: const TextStyle(color: Colors.white),
        backgroundColor: const Color.fromARGB(255, 247, 88, 88),
      ),
      body: SafeArea(
        child: FilterListWidget<String>(
          themeData: FilterListThemeData(context),
          listData: const ['Breakfast', 'Lunch', 'Dinner', 'Dessert', 'Brunch'],
          selectedListData: const [],
          onApplyButtonClick: (list) {
            FilterList.FilterlistArray.clear();
            Navigator.pop(context, list);
            FilterList.FilterlistArray = List.from(list!);

            // ignore: avoid_print
            // print(FilterList.FilterlistArray);
          },
          choiceChipLabel: (item) {
            return item;
          },
          validateSelectedItem: (list, val) {
            return list!.contains(val);
          },
          onItemSearch: (text, query) {
            return text.toLowerCase().contains(query.toLowerCase());
          },
        ),
      ),
    );
  }
}
