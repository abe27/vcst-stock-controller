// ignore_for_file: file_names

import 'package:flutter/material.dart';

import 'ReceivePage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        title: const Text('AppBar Demo'),
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        leadingWidth: 50,
        actions: <Widget>[
          Padding(
            padding:
                const EdgeInsets.only(left: 0, right: 15.0, top: 0, bottom: 0),
            child: IconButton(
              icon: const Icon(Icons.add_alert),
              tooltip: 'Show Snackbar',
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('This is a snackbar')));
              },
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 0, right: 15.0, top: 0, bottom: 0),
            child: IconButton(
              icon: const Icon(Icons.account_circle),
              tooltip: 'Go to the next page',
              onPressed: () {
                Navigator.push(context, MaterialPageRoute<void>(
                  builder: (BuildContext context) {
                    return Scaffold(
                      appBar: AppBar(
                        title: const Text('Next page'),
                      ),
                      body: const Center(
                        child: Text(
                          'This is the next page',
                          style: TextStyle(fontSize: 24),
                        ),
                      ),
                    );
                  },
                ));
              },
            ),
          )
        ],
        automaticallyImplyLeading: true,
      ),
      drawer: Drawer(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(0), bottomRight: Radius.circular(0)),
        ),
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              accountEmail: const Text("email@email.com"),
              accountName: const Text("Full Name"),
              currentAccountPicture: CircleAvatar(
                radius: 35.0,
                child: Image.asset('assets/images/app_logo.png'),
              ),
            ),
            SafeArea(
              child: Column(
                children: [
                  ListTile(
                    leading: const Icon(Icons.home_outlined),
                    title: const Text(
                      'หน้าแรก',
                      style: TextStyle(color: Colors.blue),
                    ),
                    selected: _selectedIndex == 0,
                    onTap: () {
                      // Update the state of the app
                      // _onItemTapped(0);
                      // Then close the drawer
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.note_add_outlined),
                    title: const Text('ใบรับสินค้าชั่วคราว'),
                    // selected: _selectedIndex == 0,
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ReceivePage(
                                  title: 'ใบรับสินค้าชั่วคราว')));
                    },
                  ),
                  ExpansionTile(
                    title: const Text("ใบรับสินค้า(FR)"),
                    leading: const Icon(Icons.task_outlined), //add icon
                    childrenPadding:
                        const EdgeInsets.only(left: 5), //children padding
                    children: [
                      ListTile(
                        leading: const Icon(Icons.arrow_right),
                        title: const Text("Child Category 1"),
                        onTap: () {
                          //action on press
                        },
                      ),

                      ListTile(
                        leading: const Icon(Icons.arrow_right),
                        title: const Text("Child Category 2"),
                        onTap: () {
                          //action on press
                        },
                      ),

                      //more child menu
                    ],
                  ),
                  ExpansionTile(
                    title: const Text("ใบเบิกสินค้า(WR)"),
                    leading: const Icon(Icons.edit_note_outlined), //add icon
                    childrenPadding:
                        const EdgeInsets.only(left: 10), //children padding
                    children: [
                      ListTile(
                        leading: const Icon(Icons.arrow_right),
                        title: const Text("Child Category 1"),
                        onTap: () {
                          //action on press
                        },
                      ),

                      ListTile(
                        leading: const Icon(Icons.arrow_right),
                        title: const Text("Child Category 2"),
                        onTap: () {
                          //action on press
                        },
                      ),

                      //more child menu
                    ],
                  ),
                  ExpansionTile(
                    title: const Text("ใบโอนสินค้า(TR)"),
                    leading:
                        const Icon(Icons.move_to_inbox_outlined), //add icon
                    childrenPadding:
                        const EdgeInsets.only(left: 10), //children padding
                    children: [
                      ListTile(
                        leading: const Icon(Icons.arrow_right),
                        title: const Text("Child Category 1"),
                        onTap: () {
                          //action on press
                        },
                      ),
                      ListTile(
                        leading: const Icon(Icons.arrow_right),
                        title: const Text("Child Category 2"),
                        onTap: () {
                          //action on press
                        },
                      ),
                    ],
                  ),
                  ExpansionTile(
                    title: const Text("ยืนยันการส่งสินค้า(PDS)"),
                    leading: const Icon(Icons.check_box_outlined), //add icon
                    childrenPadding:
                        const EdgeInsets.only(left: 10), //children padding
                    children: [
                      ListTile(
                        leading: const Icon(Icons.arrow_right),
                        title: const Text("Child Category 1"),
                        onTap: () {
                          //action on press
                        },
                      ),
                      ListTile(
                        leading: const Icon(Icons.arrow_right),
                        title: const Text("Child Category 2"),
                        onTap: () {
                          //action on press
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: const Center(
        child: Text("Child Category"),
      ),
    );
  }
}
