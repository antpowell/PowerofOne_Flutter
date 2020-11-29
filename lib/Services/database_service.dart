import 'package:firebase_database/firebase_database.dart';
import 'package:power_one/models/PO1User.dart';

import 'dart:developer' as dev;

final DatabaseReference dbRef = FirebaseDatabase.instance.reference();

class FBDBService {
  create() {
    newGame(String id) {}
  }

  createNewUser(PO1User user) {
    final userId = dbRef.child('user/byEmail/');
    dev.log(user.email.split(".")[0]);
    userId.child('${user.email.split(".")[0]}/').set(user.toJSON());
  }

  createNewGame(String id) {}

  read() {
    game(String id) {}
    user(String id) {}
  }

  update() {
    user(String id) {}
  }

  delete() {
    game(String id) {}
    user(String id) {}
  }
}
