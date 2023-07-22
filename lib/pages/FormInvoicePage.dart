// ignore_for_file: file_names

import 'package:flutter/material.dart';

class FormInvoicePage extends StatefulWidget {
  const FormInvoicePage({super.key, required this.title});

  final String title;
  @override
  State<FormInvoicePage> createState() => _FormInvoicePageState();
}

class _FormInvoicePageState extends State<FormInvoicePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        title: Text(widget.title),
      ),
    );
  }
}
