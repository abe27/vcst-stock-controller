// ignore_for_file: file_names

import 'package:drop_down_search_field/drop_down_search_field.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:solar_icons/solar_icons.dart';

// import 'FormAddItemPage.dart';

class FormInvoicePage extends StatefulWidget {
  const FormInvoicePage({super.key, required this.title});

  final String title;
  @override
  State<FormInvoicePage> createState() => _FormInvoicePageState();
}

class _FormInvoicePageState extends State<FormInvoicePage> {
  final TextEditingController bookController = TextEditingController();
  final TextEditingController customerController = TextEditingController();
  final TextEditingController departController = TextEditingController();
  final TextEditingController frmInvoice = TextEditingController();

  String? selectedBook;
  String? selectedCustomer;
  String? selectedDepart;

  SuggestionsBoxController suggestionBoxController = SuggestionsBoxController();
  static final List<String> books = [
    '003-คลังตัวประกอบ(ซื้อ)',
    '005-คลัง DAMAGE',
  ];

  static List<String> getSuggestions(String query) {
    List<String> matches = <String>[];
    matches.addAll(books);

    matches.retainWhere((s) => s.toLowerCase().contains(query.toLowerCase()));
    return matches;
  }

  // Future<void> _navigateAndDisplayAddItem(BuildContext context) async {
  //   // Navigator.push returns a Future that completes after calling
  //   // Navigator.pop on the Selection Screen.
  //   final result = await Navigator.push(
  //     context,
  //     // Create the SelectionScreen in the next step.
  //     MaterialPageRoute(builder: (context) => const FormAddItemPage()),
  //   );

  //   if (!mounted) return;

  //   // After the Selection Screen returns a result, hide any previous snackbars
  //   // and show the new result.
  //   ScaffoldMessenger.of(context)
  //     ..removeCurrentSnackBar()
  //     ..showSnackBar(SnackBar(content: Text('$result')));
  // }

  @override
  void initState() {
    frmInvoice.text = "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          title: Text(widget.title),
          actions: [
            TextButton(
                onPressed: () {},
                child: const Icon(
                  Ionicons.save_outline,
                  color: Colors.white,
                ))
          ],
        ),
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20, top: 20),
                      child: SizedBox(
                        width: 260,
                        height: 40,
                        child: GestureDetector(
                          onTap: () {
                            suggestionBoxController.close();
                          },
                          child: DropDownSearchFormField(
                            textFieldConfiguration: TextFieldConfiguration(
                              style: const TextStyle(fontSize: 14),
                              decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  prefixIcon: Icon(
                                    Ionicons.home_outline,
                                    size: 20,
                                  ),
                                  labelText: 'เลือกคลังสินค้า',
                                  suffixIcon: Icon(Ionicons.search_outline)),
                              controller: bookController,
                            ),
                            suggestionsCallback: (pattern) {
                              return getSuggestions(pattern);
                            },
                            itemBuilder: (context, String suggestion) {
                              return ListTile(
                                title: Text(suggestion),
                              );
                            },
                            itemSeparatorBuilder: (context, index) {
                              return const Divider();
                            },
                            transitionBuilder:
                                (context, suggestionsBox, controller) {
                              return suggestionsBox;
                            },
                            onSuggestionSelected: (String suggestion) {
                              bookController.text = suggestion;
                            },
                            suggestionsBoxController: suggestionBoxController,
                            validator: (value) =>
                                value!.isEmpty ? 'Please select a fruit' : null,
                            onSaved: (value) => selectedBook = value,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, top: 20),
                      child: SizedBox(
                        width: 260,
                        height: 40,
                        child: GestureDetector(
                          onTap: () {
                            suggestionBoxController.close();
                          },
                          child: DropDownSearchFormField(
                            textFieldConfiguration: TextFieldConfiguration(
                              style: const TextStyle(fontSize: 14),
                              decoration: const InputDecoration(
                                  prefixIcon: Icon(
                                    SolarIconsOutline.user,
                                    size: 20,
                                  ),
                                  border: OutlineInputBorder(),
                                  labelText: 'รหัสผู้ขาย',
                                  suffixIcon: Icon(Ionicons.search_outline)),
                              controller: customerController,
                            ),
                            suggestionsCallback: (pattern) {
                              return getSuggestions(pattern);
                            },
                            itemBuilder: (context, String suggestion) {
                              return ListTile(
                                title: Text(suggestion),
                              );
                            },
                            itemSeparatorBuilder: (context, index) {
                              return const Divider();
                            },
                            transitionBuilder:
                                (context, suggestionsBox, controller) {
                              return suggestionsBox;
                            },
                            onSuggestionSelected: (String suggestion) {
                              customerController.text = suggestion;
                            },
                            suggestionsBoxController: suggestionBoxController,
                            validator: (value) =>
                                value!.isEmpty ? 'Please select a fruit' : null,
                            onSaved: (value) => selectedCustomer = value,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, top: 20),
                      child: SizedBox(
                        width: 250,
                        height: 40,
                        child: GestureDetector(
                          onTap: () {
                            suggestionBoxController.close();
                          },
                          child: DropDownSearchFormField(
                            textFieldConfiguration: TextFieldConfiguration(
                              style: const TextStyle(fontSize: 14),
                              decoration: const InputDecoration(
                                  prefixIcon: Icon(
                                    SolarIconsOutline.tag,
                                    size: 22,
                                  ),
                                  border: OutlineInputBorder(),
                                  labelText: 'รหัสแผนก',
                                  suffixIcon: Icon(Ionicons.search_outline)),
                              controller: departController,
                            ),
                            suggestionsCallback: (pattern) {
                              return getSuggestions(pattern);
                            },
                            itemBuilder: (context, String suggestion) {
                              return ListTile(
                                title: Text(suggestion),
                              );
                            },
                            itemSeparatorBuilder: (context, index) {
                              return const Divider();
                            },
                            transitionBuilder:
                                (context, suggestionsBox, controller) {
                              return suggestionsBox;
                            },
                            onSuggestionSelected: (String suggestion) {
                              departController.text = suggestion;
                            },
                            suggestionsBoxController: suggestionBoxController,
                            validator: (value) =>
                                value!.isEmpty ? 'Please select a fruit' : null,
                            onSaved: (value) => selectedDepart = value,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, right: 20),
                  child: SizedBox(
                    width: 500,
                    height: 40,
                    child: TextField(
                      controller: frmInvoice,
                      style: const TextStyle(fontSize: 14),
                      decoration: InputDecoration(
                          prefixIcon: const Icon(
                            SolarIconsOutline.pen,
                            size: 20,
                          ),
                          border: const OutlineInputBorder(),
                          labelText: 'เลขที่ Invoice',
                          hintText: 'ระบุเลขที่ Invoice',
                          suffixIcon: IconButton(
                              onPressed: () =>
                                  setState(() => frmInvoice.text = ""),
                              icon: const Icon(
                                SolarIconsOutline.closeCircle,
                                size: 20,
                              ))),
                    ),
                  ),
                ),
              ],
            ),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(right: 20, top: 20, bottom: 20),
                      child: TextButton.icon(
                          onPressed: () {},
                          icon: const Icon(SolarIconsOutline.addCircle),
                          label: const Text("เพิ่มรายการสิxxxนค้า")),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(right: 20, top: 20, bottom: 20),
                      child: TextButton.icon(
                          onPressed: () {},
                          icon: const Icon(SolarIconsOutline.addCircle),
                          label: const Text("เพิ่มรายการสินค้า")),
                    )
                  ],
                )
              ],
            ),
            SizedBox(
              width: double.infinity,
              child: DataTable(
                columns: const <DataColumn>[
                  DataColumn(label: Text('#')),
                  DataColumn(label: Text('รหัสสินค้า')),
                  DataColumn(label: Text('รายละเอียด')),
                  DataColumn(label: Text('จำนวน')),
                  DataColumn(label: Text('หน่วย')),
                  DataColumn(label: Text('ราคา')),
                  DataColumn(label: Text('มูลค่า')),
                ],
                rows: const [],
              ),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.only(right: 20, top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    width: 150,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("จำนวนสินค้า:"),
                        TextButton(
                          onPressed: () {},
                          child: const Text("0"),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 25,
                  ),
                  SizedBox(
                    width: 150,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("มูลค่าสินค้า:"),
                        TextButton(
                          onPressed: () {},
                          child: const Text("0"),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20, top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    width: 170,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("มูลค่า VAT \$7%:"),
                        TextButton(
                          onPressed: () {},
                          child: const Text("0.00"),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20, top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    width: 170,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("ยอดรวม:"),
                        TextButton(
                          onPressed: () {},
                          child: const Text("0.00"),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                    padding: const EdgeInsets.only(right: 20, top: 50),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                const RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(1.5)),
                                    side: BorderSide(color: Colors.blue))),
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.blue),
                            foregroundColor:
                                MaterialStateProperty.all<Color>(Colors.white),
                          ),
                          onPressed: () => Navigator.pop(context),
                          child: const Row(
                            children: [
                              Icon(SolarIconsOutline.addCircle),
                              SizedBox(
                                width: 5,
                              ),
                              Text("บันทึกข้อมูล")
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        ElevatedButton(
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                const RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(1.5)),
                                    side: BorderSide(color: Colors.red))),
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.red),
                            foregroundColor:
                                MaterialStateProperty.all<Color>(Colors.white),
                          ),
                          onPressed: () {},
                          child: const Row(
                            children: [
                              Icon(Ionicons.close_circle_outline),
                              SizedBox(
                                width: 15,
                              ),
                              Text("เคลียร์ทั้งหมด")
                            ],
                          ),
                        )
                      ],
                    )),
              ],
            )
          ],
        ));
  }
}
