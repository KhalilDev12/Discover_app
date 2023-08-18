import 'package:discover_app/data/data.dart';
import 'package:discover_app/widgets/articleWidget.dart';
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
  final List<String> _locations = [
    'Paris',
    'London',
    'Tokyo',
    'Moscow',
    'Milan',
    'Amsterdam'
  ];
  int _activeLocation = 2;

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
    //print(_deviceHeight*0.07);
    //print(_deviceWidth*0.4);
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        right: false,
        left: false,
        minimum:
            EdgeInsets.fromLTRB(_deviceWidth * 0.05, 0, _deviceWidth * 0.05, 0),
        child: SizedBox(
          height: _deviceHeight,
          width: _deviceWidth,
          child: Column(
            children: [
              _topBarWidget(),
              SizedBox(height: _deviceHeight * 0.01),
              _locationBarWidget(),
              SizedBox(height: _deviceHeight * 0.03),
              _articlesListWidget(),
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
            decoration: const BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage("assets/images/logo_discover.png"))),
          ),
          const Icon(Icons.search, color: Colors.black87),
        ],
      ),
    );
  }

  Widget _locationBarWidget() {
    return Container(
      width: _deviceWidth,
      height: _deviceHeight * 0.08,
      padding: EdgeInsets.symmetric(
          vertical: _deviceHeight * 0.015, horizontal: _deviceWidth * 0.05),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(69, 69, 69, 1),
        borderRadius: BorderRadius.circular(100),
      ),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: _locations.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                _activeLocation = index;
              });
            },
            child: Column(
              children: [
                Text(
                  _locations[index],
                  style: TextStyle(
                    color: _activeLocation == index
                        ? Colors.white
                        : Colors.white24,
                    fontSize: 15,
                    fontFamily: 'Montserrat',
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: _activeLocation == index
                          ? Colors.red
                          : Colors.transparent),
                  height: 6,
                  width: _deviceWidth * 0.07,
                )
              ],
            ),
          );
        },
        separatorBuilder: (context, index) {
          return Container(
            width: _deviceWidth * 0.07,
          );
        },
      ),
    );
  }

  Widget _articlesListWidget() {
    return Expanded(
      child: ListView.builder(
        itemCount: articles.length,
        itemBuilder: (context, index) {
          return ArticleWidget(
              article: articles[index],
              deviceHeight: _deviceHeight,
              deviceWidth: _deviceWidth);
        },
      ),
    );
  }
}
