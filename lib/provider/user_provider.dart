import 'package:amazon_clone/models/user.dart';
import 'package:flutter/cupertino.dart';

class Userprovider extends ChangeNotifier {
  User _user = User('', '', '', '', '', '', '');

  User get user => _user;

  void setuser(String user) {
    _user = User.fromJson(user);
    notifyListeners();
  }
}
