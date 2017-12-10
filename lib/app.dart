import 'package:flutter/material.dart';
import 'package:baoonline/common/services.dart';
import 'package:baoonline/news/news_page.dart';

final ThemeData _kGalleryLightTheme = new ThemeData(
  brightness: Brightness.light,
  primarySwatch: Colors.blue,
);

final ThemeData _kGalleryDarkTheme = new ThemeData(
  brightness: Brightness.dark,
  primarySwatch: Colors.blue,
);

class BaoOnline extends StatefulWidget {
  const BaoOnline({
    Key key
  }) : super(key: key);
  @override
  BaoOnlineAppState createState() => new BaoOnlineAppState();
}

class BaoOnlineAppState extends State<BaoOnline>
    with SingleTickerProviderStateMixin {
  TabController _controller;
  Page _currentTab;

  @override
  void initState() {
    super.initState();
    _controller = new TabController(vsync: this, length: PAGES.length);
    _controller.addListener(() {
      setState(() {
        _currentTab = PAGES[_controller.index];
      });
    });
    _currentTab = PAGES[_controller.index];
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = new ThemeData(
        primarySwatch: _currentTab.color,
        primaryColor: _currentTab.color,
        accentColor: _currentTab.color,
        brightness: Brightness.dark);

    return new MaterialApp(
        title: _currentTab.text,
        theme: themeData,
        home: new Scaffold(
            appBar: new AppBar(
              title: new Text(_currentTab.text),
              bottom: new TabBar(
                controller: _controller,
                isScrollable: false,
                indicatorColor: themeData.textTheme.title.color,
                tabs: PAGES.map((Page page) {
                  return new Tab(
                      icon: new ImageIcon(
                          new AssetImage('assets/icons/${page.icon}')));
                }).toList(),
              ),
            ),
            body: new TabBarView(
                controller: _controller,
                children: PAGES.map((Page page) {
                  switch (page.service) {
                    case Service.TOTAL_NEWS:
                      return new NewsPage();
                      break;
                    case Service.NEWS_HEALTH:
                      return new NewsPage();
                      break;
                    case Service.LIVE_STRONG:
                      return new NewsPage();
                      break;
                  }
                }).toList())));
  }
}
