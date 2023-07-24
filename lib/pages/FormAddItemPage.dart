// ignore_for_file: file_names

import 'package:drop_down_search_field/drop_down_search_field.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:solar_icons/solar_icons.dart';

// Navigator.pop(context, 'Nope!');

class FormAddItemPage extends StatefulWidget {
  const FormAddItemPage({super.key});

  @override
  State<FormAddItemPage> createState() => _FormAddItemPageState();
}

class _FormAddItemPageState extends State<FormAddItemPage> {
  final TextEditingController txtItemNo = new TextEditingController();

  String? selectTxtItemNo;

  SuggestionsBoxController suggestionBoxController = SuggestionsBoxController();

  static final List<String> items = [
    '003-คลังตัวประกอบ(ซื้อ)',
    '005-คลัง DAMAGE',
  ];

  static final List<String> units = [
    '-',
    '001-KG',
  ];

  static List<String> getSuggestions(String query, item) {
    List<String> matches = <String>[];
    matches.addAll(item);

    matches.retainWhere((s) => s.toLowerCase().contains(query.toLowerCase()));
    return matches;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        title: const Text("เพิ่มรายการสินค้า"),
      ),
      body: Column(
        children: [
          SizedBox(
            width: 620,
            child: Center(
              child: DropDownSearchFormField(
                textFieldConfiguration: TextFieldConfiguration(
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'ค้นหาสินค้า',
                      suffixIcon: Icon(Ionicons.search_outline)),
                  controller: txtItemNo,
                ),
                suggestionsCallback: (pattern) {
                  return getSuggestions(pattern, items);
                },
                itemBuilder: (context, String suggestion) {
                  return ListTile(
                    title: Text(suggestion),
                  );
                },
                itemSeparatorBuilder: (context, index) {
                  return const Divider();
                },
                transitionBuilder: (context, suggestionsBox, controller) {
                  return suggestionsBox;
                },
                onSuggestionSelected: (String suggestion) {
                  txtItemNo.text = suggestion;
                },
                suggestionsBoxController: suggestionBoxController,
                validator: (value) =>
                    value!.isEmpty ? 'Please select a fruit' : null,
                onSaved: (value) => selectTxtItemNo = value,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const SizedBox(
            width: 620,
            child: Center(
                child: SizedBox(
              width: 620,
              child: TextField(
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.edit_outlined),
                    suffixIcon: Icon(SolarIconsOutline.closeCircle),
                    border: OutlineInputBorder(),
                    labelText: 'ระบุจำนวน',
                    hintText: 'ระบุจำนวนที่ต้องการ'),
              ),
            )),
          ),
          SizedBox(
            width: 620,
            child: Center(
              child: DropDownSearchFormField(
                textFieldConfiguration: TextFieldConfiguration(
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'เลือกหน่วย',
                      suffixIcon: Icon(Ionicons.search_outline)),
                  controller: txtItemNo,
                ),
                suggestionsCallback: (pattern) {
                  return getSuggestions(pattern, units);
                },
                itemBuilder: (context, String suggestion) {
                  return ListTile(
                    title: Text(suggestion),
                  );
                },
                itemSeparatorBuilder: (context, index) {
                  return const Divider();
                },
                transitionBuilder: (context, suggestionsBox, controller) {
                  return suggestionsBox;
                },
                onSuggestionSelected: (String suggestion) {
                  txtItemNo.text = suggestion;
                },
                suggestionsBoxController: suggestionBoxController,
                validator: (value) =>
                    value!.isEmpty ? 'Please select a fruit' : null,
                onSaved: (value) => selectTxtItemNo = value,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
