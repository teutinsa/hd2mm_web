import 'dart:collection';
import 'package:flutter/material.dart';
import '../models/notification_message.dart';

class NotificationProvider extends ChangeNotifier {
  UnmodifiableListView<NotificationMessage> get notifications => UnmodifiableListView(_notifications);

  static final _instance = NotificationProvider._internal();
  final List<NotificationMessage> _notifications = [
    NotificationMessage(title: "Test!", description: "Ullamco dolor ad reprehenderit velit reprehenderit mollit.")
  ];

  NotificationProvider._internal();

  factory NotificationProvider() => _instance;

  void add(NotificationMessage notification) {
    _notifications.add(notification);
    notifyListeners();
  }

  void remove(NotificationMessage notification) {
    _notifications.remove(notification);
    notifyListeners();
  }
}