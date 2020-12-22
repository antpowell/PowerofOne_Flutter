import 'package:firebase_database/firebase_database.dart';
import 'package:power_one/models/PO1Game.dart';
import 'package:power_one/models/PO1User.dart';

import 'dart:developer' as dev;

final DatabaseReference dbRef = FirebaseDatabase.instance.reference();
final PO1User _user = PO1User();

class FBDBService {
  createNewUser(PO1User user) {
    final userId = dbRef.child('user/byEmail/');
    dev.log(user.email.split(".")[0]);
    userId.child('${user.email.split(".")[0]}/').set(user.toJSON());
  }

  createNewGame() {
    final gameRef = dbRef.child('games/byUser/');
    final gameId = dbRef.child('games/byUser/').push();

    dev.log(_user.score.toJSON().toString());

    gameRef
        .child(_user.emailSignature())
        .child(_user.playerName)
        .push()
        .set(_user.score.toJSON());

    // gameRef.set(game.toJSON());
  }

  read() {
    game(String id) {}
    user(String id) {}
  }

  getUser() {}
  getGame() {}

  // factory FBDBService.createNewUser() {}

  delete() {
    game(String id) {}
    user(String id) {}
  }
}
