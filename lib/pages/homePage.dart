import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  late double _deviceHeight, _deviceWidth;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //print(_deviceHeight*0.05);
    //print(_deviceWidth*0.4);
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        right: false,
        left: false,
        minimum:
            EdgeInsets.fromLTRB(_deviceWidth * 0.05, 0, _deviceWidth * 0.05, 0),
        child: Container(
          height: _deviceHeight,
          width: _deviceWidth,
          child: Column(
            children: [
              _topBarWidget(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _topBarWidget() {
    return Container(
      margin: EdgeInsets.only(top: _deviceHeight * 0.01),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          const Icon(Icons.menu, color: Colors.black87),
          Container(
            height: _deviceHeight * 0.05,
            width: _deviceWidth * 0.3,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage("assets/images/logo_discover.png"))),
          ),
          const Icon(Icons.search, color: Colors.black87),
        ],
      ),
    );
  }
}
