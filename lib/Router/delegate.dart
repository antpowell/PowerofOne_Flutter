// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:power_of_one_basketball/Views/FeedBack/FeedBack.dart';
// import 'package:power_of_one_basketball/Views/Help/helpPage.dart';
// import 'package:power_of_one_basketball/Views/Login/LoginForm.dart';
// import 'package:power_of_one_basketball/Views/PlayerName/PlayerNameForm.dart';
// import 'package:power_of_one_basketball/Views/Register/register.dart';
// import 'package:power_of_one_basketball/Views/ReportCard/ReportCard.dart';
// import 'package:power_of_one_basketball/Views/ScoreCard/ScoreCard.dart';
// import 'package:power_of_one_basketball/Views/TermsAndConditions/TermsAndConditions.dart';

// enum routes { Login }

// class RouterDelegate extends RouterDelegate<List<RouteSettings>>
//     with ChangeNotifier, PopNavigatorRouterDelegateMixin<List<RouteSettings>> {
//   final _pages = <Page>[];

//   @override
//   final navigatorKey = GlobalKey<NavigatorState>();

//   @override
//   Widget build(BuildContext context) {
//     return Navigator(
//       key: navigatorKey,
//       pages: List.of(_pages),
//       onPopPage: _onPopPage,
//     );
//   }

//   @override
//   Future<bool> popRoute() {
//     if (_pages.length > 1) {
//       _pages.removeLast();
//       notifyListeners();
//       return Future.value(true);
//     }
//     return _confirmAppExit();
//   }

// // Empty for now until method is fully understood how it should be used but is a required override
//   @override
//   Future<void> setNewRoutePath(List<RouteSettings> configuration) async {}

//   bool _onPopPage(Route route, dynamic result) {
//     if (!route.didPop(result)) return false;
//     popRoute();
//     return true;
//   }

//   Future<bool> _confirmAppExit() {
//     return showDialog<bool>(
//         context: navigatorKey.currentContext,
//         builder: (context) {
//           return AlertDialog(
//             title: const Text('Exit App'),
//             content: const Text('Are you sure you want to exit the app?'),
//             actions: [
//               TextButton(
//                 child: const Text('Cancel'),
//                 onPressed: () => Navigator.pop(context, true),
//               ),
//               TextButton(
//                 child: const Text('Confirm'),
//                 onPressed: () => Navigator.pop(context, false),
//               ),
//             ],
//           );
//         });
//   }

//   MaterialPage _createPage(RouteSettings routeSettings) {
//     Widget child;
//     switch (routeSettings.name) {
//       case Login:
//         child = LoginFormScreen();
//         break;
//       case Register.id:
//         child = Register();
//         break;
//       case ReportCard.id:
//         child = ReportCard();
//         break;
//       case PlayerNameForm.id:
//         child = PlayerNameForm();
//         break;
//       case ScoreCard.id:
//         child = ScoreCard();
//         break;
//       case TermsAndConditions.id:
//         child = TermsAndConditions();
//         break;
//       case FeedBack.id:
//         child = FeedBack();
//         break;
//       case '/Help':
//         child = HelpPage();
//         break;
//     }
//     return MaterialPage(
//       child: child,
//       key: Key(routeSettings.name),
//       name: routeSettings.name,
//       arguments: routeSettings.arguments,
//     );
//   }
// }
