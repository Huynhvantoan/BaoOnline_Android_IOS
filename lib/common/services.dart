import 'constrant.dart';
import 'package:flutter/material.dart';

enum Service { TOTAL_NEWS, NEWS_HEALTH, LIVE_STRONG }

class Page {
  Page({this.service, this.text, this.icon, this.color});

  final Service service;
  final String text;
  final String icon;
  final Color color;
}

// ignore: non_constant_identifier_names
final List<Page> PAGE = <Page>[
  new Page(
      service: Service.TOTAL_NEWS,
      text: Strings.total_news,
      icon: 'ycombinator.png',
      color: Colors.deepOrange),
  new Page(
      service: Service.NEWS_HEALTH,
      text: Strings.news_health,
      icon: 'reddit.png',
      color: Colors.blue),
  new Page(
      service: Service.LIVE_STRONG,
      text: Strings.live_strong,
      icon: 'imgur.png',
      color: Colors.green)
];
