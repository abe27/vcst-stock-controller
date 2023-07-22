// ignore_for_file: file_names

import 'package:flutter/material.dart';

class ReceivePage extends StatefulWidget {
  const ReceivePage({super.key, required this.title, this.refType});

  final String title;
  final String? refType;

  @override
  State<ReceivePage> createState() => _RecevePage();
}

class _RecevePage extends State<ReceivePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          title: Text(widget.title),
          actions: [
            IconButton(
              onPressed: () {},
              tooltip: 'เลือกวันที่ ${widget.title}',
              icon: const Icon(Icons.calendar_today_outlined),
            ),
            IconButton(
              onPressed: () {},
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
            // const Row(
            //   mainAxisAlignment: MainAxisAlignment.start,
            //   children: [
            //     Padding(
            //       padding: EdgeInsets.only(left: 20, top: 20),
            //       child: SizedBox(
            //         width: 250,
            //         child: TextField(
            //           keyboardType: TextInputType.datetime,
            //           decoration: InputDecoration(
            //               prefixIcon: Icon(Icons.calendar_today),
            //               hintText: "เลือกวันที่"),
            //         ),
            //       ),
            //     ),
            //   ],
            // ),
            const Divider(),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
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
                ], rows: const <DataRow>[
                  DataRow(
                    cells: <DataCell>[
                      DataCell(Text('1')),
                      DataCell(Text('REFNO12123')),
                      DataCell(Text('RED0001222')),
                      DataCell(Text('20/01/2023')),
                      DataCell(Text('INV0001222')),
                      DataCell(Text(
                        'Success',
                        style: TextStyle(color: Colors.green),
                      )),
                      DataCell(Text('-')),
                    ],
                  ),
                  DataRow(
                    cells: <DataCell>[
                      DataCell(Text('2')),
                      DataCell(Text('REFNO12123')),
                      DataCell(Text('RED0001222')),
                      DataCell(Text('20/01/2023')),
                      DataCell(Text('INV0001222')),
                      DataCell(Text(
                        'Waiting',
                        style: TextStyle(color: Colors.indigo),
                      )),
                      DataCell(Text('-')),
                    ],
                  ),
                  DataRow(
                    cells: <DataCell>[
                      DataCell(Text('3')),
                      DataCell(Text('REFNO12123')),
                      DataCell(Text('RED0001222')),
                      DataCell(Text('20/01/2023')),
                      DataCell(Text('INV0001222')),
                      DataCell(Text(
                        'Error',
                        style: TextStyle(color: Colors.redAccent),
                      )),
                      DataCell(Text('-')),
                    ],
                  ),
                  DataRow(
                    cells: <DataCell>[
                      DataCell(Text('4')),
                      DataCell(Text('REFNO12123')),
                      DataCell(Text('RED0001222')),
                      DataCell(Text('20/01/2023')),
                      DataCell(Text('INV0001222')),
                      DataCell(Text(
                        'In Process',
                        style: TextStyle(color: Colors.blue),
                      )),
                      DataCell(Text('-')),
                    ],
                  ),
                ]),
              ),
            )
          ],
        ));
  }
}
