import 'package:flutter/material.dart';

import '../components/bottom_nav_bar.dart';
import 'add_note_page.dart';
import 'notes_list_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final pageController = PageController();
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // padding left (25) + container with (50) + inside padding left (2)
        leadingWidth: 77,
        leading: Padding(
          padding: const EdgeInsets.only(left: 25, top: 5),
          child: Container(
            height: 50,
            width: 50,
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: Colors.grey,
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network('https://github.com/vagnereix.png'),
            ),
          ),
        ),
        title: const Text(
          'Notinha do rolê',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        surfaceTintColor: Colors.transparent,
      ),
      drawer: const Drawer(),
      body: PageView(
        controller: pageController,
        onPageChanged: (value) => setState(() {
          _selectedIndex = value;
        }),
        children: const [
          NotesListPage(),
          AddNotePage(),
        ],
      ),
      bottomNavigationBar: BottomNavBar(
        selectedIndex: _selectedIndex,
        onTabChange: (value) => pageController.animateToPage(
          value,
          duration: const Duration(seconds: 1),
          curve: Curves.fastLinearToSlowEaseIn,
        ),
      ),
    );
  }
}
