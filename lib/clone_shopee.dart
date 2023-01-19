import 'package:flutter/material.dart';
import 'package:ui_login_2/ui/calendar_page.dart';
import 'package:ui_login_2/ui/home_page.dart';
import 'package:ui_login_2/ui/profile_page.dart';

class Shopee extends StatefulWidget {
  const Shopee({Key? key}) : super(key: key);

  @override
  State<Shopee> createState() => _ShopeeState();
}

class _ShopeeState extends State<Shopee> {
  PageController pageController = PageController(
    initialPage: 0,
    keepPage: true,
  );
  int _currentIndex = 0;
  final List<Widget> _widgetOption = [
    HomePage(),
    CalendarPage(),
    ProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bottom Navigation"),
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: true,
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Colors.blue,
            ),
            label: "Home",
            activeIcon: Icon(
              Icons.home,
              color: Colors.red,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.calendar_month,
              color: Colors.blue,
            ),
            label: "CALENDAR",
            activeIcon: Icon(
              Icons.calendar_month,
              color: Colors.red,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              color: Colors.blue,
              size: 36,
            ),
            label: "PROFILE",
            activeIcon: Icon(
              Icons.person,
              color: Colors.red,
              size: 36,
            ),
          ),
        ],
        currentIndex: _currentIndex,
        onTap: _opTabBottomNav,
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: pageController,
              onPageChanged: (index) {
                pageChanged(index);
              },
              children: [
                _myPageWidget(color: Colors.yellow),
                _myPageWidget(color: Colors.red),
                _myPageWidget(color: Colors.blueAccent),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _myPageWidget({required Color? color}) {
    return Container(
      height: 200,
      color: color,
    );
  }

  void _opTabBottomNav(index) {
    setState(() {
      _currentIndex = index;
      pageController.animateToPage(index,
          duration: Duration(microseconds: 500), curve: Curves.ease);
    });
  }

  void pageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
