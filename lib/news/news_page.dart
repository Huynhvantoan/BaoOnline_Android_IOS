import 'dart:async';
import 'package:flutter/material.dart';
import 'dart:convert';

class NewsPage extends StatefulWidget {
  NewsPage({Key key}) : super(key: key);

  @override
  _NewsPageState createState() => new _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Load local JSON file"),
        ),
        body: new Container(
          child: new Center(
            // Use future builder and DefaultAssetBundle to load the local JSON file
            child: new FutureBuilder(
                future: DefaultAssetBundle
                    .of(context)
                    .loadString('assets/data_test.json'),
                builder: (context, snapshot) {
                  // Decode the JSON
                  var new_data = JSON.decode(snapshot.data.toString());

                  return new ListView.builder(
                    // Build the ListView
                    itemBuilder: (BuildContext context, int index) {
                      return new Card(
                        child: new Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            new Text("Name: " + new_data[index]['name']),
                            new Text("Height: " + new_data[index]['height']),
                            new Text("Mass: " + new_data[index]['mass']),
                            new Text(
                                "Hair Color: " + new_data[index]['hair_color']),
                            new Text(
                                "Skin Color: " + new_data[index]['skin_color']),
                            new Text(
                                "Eye Color: " + new_data[index]['eye_color']),
                            new Text(
                                "Birth Year: " + new_data[index]['birth_year']),
                            new Text("Gender: " + new_data[index]['gender'])
                          ],
                        ),
                      );
                    },
                    itemCount: new_data == null ? 0 : new_data.length,
                  );
                }),
          ),
        ));
    /*return new RefreshIndicator(
        child: new AnimatedCrossFade(
            firstChild: new Center(child: new CircularProgressIndicator()),
            secondChild:
            new Column(children: <Widget>[new Expanded(child: gridView)]),
            crossFadeState: _images.isEmpty
                ? CrossFadeState.showFirst
                : CrossFadeState.showSecond,
            duration: new Duration(milliseconds: 200)),
        onRefresh: _onRefresh);*/
  }

}
