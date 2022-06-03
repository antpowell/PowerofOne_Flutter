import 'package:firebase_database/firebase_database.dart';
import 'package:power_one/Models/PO1User.dart';

import 'dart:developer' as dev;

final DatabaseReference dbRef = FirebaseDatabase.instance.reference();
final PO1User _user = PO1User();

class FBDBService {
  createNewUser(PO1User user) {
    final userId = dbRef.child('user/byEmail/');
    dev.log(user.email.split(".")[0]);
    if (user.subscription != null) {
      Map<String, dynamic> userObj = {}
        ..addAll(user.subscription.toJSON())
        ..addAll(user.toJSON());
    } else {
      Map<String, dynamic> userObj = user.toJSON();
    }
    // TODO: add 7 day trial period
    userId.child('${user.email.split(".")[0]}/').set({...user.toJSON()});
  }

  getUsersSubscription() async {
    final userSnapshot =
        await dbRef.child('users/${_user.email.split(".")[0]}').get();
    if (userSnapshot.exists) {
      print('User found byUserName: ${userSnapshot.value}');
      // _user.subscription.setSubscription(
      //     isActive: userSnapshot.value.isActive,
      //     timeLeft: userSnapshot.value.timeLeft,
      // );
    } else {
      print('No data available.');
    }
  }

  updateUserInfo() {
    // add playerName
    // add player
  }

  createNewGame() {
    final gameRef = dbRef.child('games/byUser/');
    final gameId = dbRef.child('games/byUser/').push();

    dev.log(_user.score.toJSON().toString());

    gameRef
        .child(_user.emailSignature())
        .child(_user.playerName)
        .child(new DateTime.now().toString().replaceAll('.', ':'))
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
