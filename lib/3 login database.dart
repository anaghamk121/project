import 'package:hive/hive.dart';

import '3 login model.dart';

class DBFunction {
  DBFunction.internal();

  //if the class have one object we can calledD instance
// singleton class
  static DBFunction instance = DBFunction.internal();

  Future<void> userSignUp(User user) async {
    final db = await Hive.openBox<User>('Users');
    db.put(user.id, user);
  }

  Future<List<User>> getUser() async {
    final db = await Hive.openBox<User>('Users');
    return db.values.toList();
  }
}
