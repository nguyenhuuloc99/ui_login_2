import 'dart:async';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = new PageController(initialPage: 999);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  void onPageChange(index) {
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 100,
        ),
        Expanded(child: Container())
      ],
    );
  }


}
