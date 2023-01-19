import 'package:flutter/material.dart';

class DemoTablayout extends StatefulWidget {
  const DemoTablayout({Key? key}) : super(key: key);

  @override
  State<DemoTablayout> createState() => _DemoTablayoutState();
}

class _DemoTablayoutState extends State<DemoTablayout>
    with TickerProviderStateMixin {
  TabController? _controller;
  int _selectedIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = TabController(length: 2, vsync: this);
    _controller?.addListener(() {
      setState(() {
        _selectedIndex = _controller!.index;
      });
      print("Selected! Index: ${_controller!.index}");
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Demo TabLayout"),
          bottom: TabBar(
            onTap: (index) {
              //phương thức này không được gọi khi bạn vuốt
              //fix tabBar
            },
            tabs: [
              Tab(icon: Icon(Icons.card_travel)),
              Tab(icon: Icon(Icons.add_shopping_cart)),
            ],
          ),
        ),
        body: TabBarView(
          controller: _controller,
          children: [
            Center(
                child: Text(
              "0",
              style: TextStyle(fontSize: 40),
            )),
            Center(
                child: Text(
              "1",
              style: TextStyle(fontSize: 40),
            )),
          ],
        ),
      ),
    );
  }
}
