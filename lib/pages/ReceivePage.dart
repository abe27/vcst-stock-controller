// ignore_for_file: file_names

import 'package:flutter/material.dart';

import 'FormInvoicePage.dart';

class ReceivePage extends StatefulWidget {
  const ReceivePage({super.key, required this.title, this.refType, this.refId});

  final String title;
  final String? refType;
  final String? refId;

  @override
  State<ReceivePage> createState() => _RecevePage();
}

class _RecevePage extends State<ReceivePage> {
  TextEditingController dateinput = TextEditingController();

  bool isSearch = false;

  @override
  void initState() {
    DateTime date = DateTime.now();
    dateinput.text = date.toString().substring(0, 10);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          title: isSearch ? TextBox() : Text(widget.title),
          actions: [
            TextButton(
                onPressed: () {},
                child: Text(
                  "Filter Date: ${dateinput.text.toString()}",
                  style: const TextStyle(color: Colors.white),
                )),
            IconButton(
              onPressed: () async {
                DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(
                        2020), //DateTime.now() - not to allow rto choose before today.
                    lastDate: DateTime(2101));

                if (pickedDate != null) {
                  print(pickedDate);
                  setState(() {
                    dateinput.text = pickedDate
                        .toString()
                        .substring(0, 10); //set output date to TextField value.
                  });
                } else {
                  print("Date is not selected");
                }
              },
              tooltip: 'เลือกวันที่ ${widget.title}',
              icon: const Icon(Icons.calendar_today_outlined),
            ),
            IconButton(
              onPressed: () => setState(() {
                isSearch = !isSearch;
              }),
              tooltip: 'ค้นหาข้อมูล ${widget.title}',
              icon: const Icon(Icons.search_outlined),
            ),
            IconButton(
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const FormInvoicePage(
                          title: "เพิ่มข้อมูล Incvoice"))),
              tooltip: 'เพิ่มข้อมูล ${widget.title}',
              icon: const Icon(Icons.add),
            ),
            IconButton(
              onPressed: () {},
              tooltip: 'Export ${widget.title}',
              icon: const Icon(Icons.list_alt_outlined),
            )
          ],
        ),
        body: Column(
          children: [
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.start,
            //   children: [
            //     Padding(
            //       padding: const EdgeInsets.only(left: 20, top: 20),
            //       child: SizedBox(
            //         width: 250,
            //         child: TextField(
            //           controller: dateinput,
            //           keyboardType: TextInputType.datetime,
            //           decoration: const InputDecoration(
            //               prefixIcon: Icon(Icons.calendar_today),
            //               hintText: "เลือกวันที่"),
            //         ),
            //       ),
            //     ),
            //   ],
            // ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: SizedBox(
                width: double.infinity,
                child: DataTable(columns: const <DataColumn>[
                  DataColumn(label: Text('#')),
                  DataColumn(label: Text('เลขที่ภายใน')),
                  DataColumn(label: Text('เลขที่อ้างอิง')),
                  DataColumn(label: Text('วันที่')),
                  DataColumn(label: Text('เลขที่ Invoice')),
                  DataColumn(label: Text('สถานะ')),
                  DataColumn(label: Text('หมายเหตุ')),
                ], rows: <DataRow>[
                  DataRow(
                    cells: <DataCell>[
                      const DataCell(Text('1')),
                      const DataCell(Text('REFNO12123')),
                      const DataCell(Text('RED0001222')),
                      DataCell(
                          Text(dateinput.text.toString().substring(0, 10))),
                      const DataCell(Text('INV0001222')),
                      DataCell(TextButton(
                          onPressed: () {},
                          child: const Text(
                            'Success',
                            style: TextStyle(color: Colors.green),
                          ))),
                      const DataCell(Text('-')),
                    ],
                  ),
                  DataRow(
                    cells: <DataCell>[
                      const DataCell(Text('2')),
                      const DataCell(Text('REFNO12123')),
                      const DataCell(Text('RED0001222')),
                      DataCell(
                          Text(dateinput.text.toString().substring(0, 10))),
                      const DataCell(Text('INV0001222')),
                      DataCell(TextButton(
                          onPressed: () {},
                          child: const Text(
                            'In Progress',
                            style: TextStyle(color: Colors.amber),
                          ))),
                      const DataCell(Text('-')),
                    ],
                  ),
                  DataRow(
                    cells: <DataCell>[
                      const DataCell(Text('3')),
                      const DataCell(Text('REFNO12123')),
                      const DataCell(Text('RED0001222')),
                      DataCell(
                          Text(dateinput.text.toString().substring(0, 10))),
                      const DataCell(Text('INV0001222')),
                      DataCell(TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Failed',
                          style: TextStyle(color: Colors.red),
                        ),
                      )),
                      const DataCell(Text('-')),
                    ],
                  ),
                  DataRow(
                    cells: <DataCell>[
                      const DataCell(Text('4')),
                      const DataCell(Text('REFNO12123')),
                      const DataCell(Text('RED0001222')),
                      DataCell(
                          Text(dateinput.text.toString().substring(0, 10))),
                      const DataCell(Text('INV0001222')),
                      DataCell(TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Success',
                          style: TextStyle(color: Colors.green),
                        ),
                      )),
                      const DataCell(Text('-')),
                    ],
                  ),
                ]),
              ),
            )
          ],
        ));
  }
}

class TextBox extends StatefulWidget {
  const TextBox({super.key});

  @override
  State<TextBox> createState() => _TextBoxState();
}

class _TextBoxState extends State<TextBox> {
  // const TextBox({super.key});
  TextEditingController txtFilter = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      child: TextField(
        controller: txtFilter,
        style: const TextStyle(color: Colors.white),
        onSubmitted: (value) => print(value),
        decoration: InputDecoration(
            prefixIcon: const Icon(
              Icons.search_outlined,
              color: Colors.white,
            ),
            hintText: 'Search',
            suffixIcon: IconButton(
                onPressed: () => setState(() {
                      txtFilter.text = ""; //set output date to TextField value.
                    }),
                icon: const Icon(
                  Icons.close_outlined,
                  color: Colors.white,
                ))),
      ),
    );
  }
}
