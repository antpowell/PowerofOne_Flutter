import 'package:flutter/material.dart';
import 'package:power_one/Views/ScoreCard/hustle_points_section.dart';
import 'package:power_one/Views/ScoreCard/ScoreBoard.dart';
import 'package:power_one/Views/ScoreCard/points_section.dart';

class ScoreCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScoreCardScreen();
  }
}

class ScoreCardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScoreCardScreenWidget(),
    );
  }
}

// class ScoreCardScreenWidget extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Container(
//         padding: EdgeInsets.fromLTRB(16, 24, 16, 8),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: <Widget>[
//             Container(
//               child: Row(
//                 // TODO: TRYING TO IMPLEMENT THE COMMAND PATTEREN
//                 children: <Widget>[
//                   Container(
//                     child: HustlePointsSection(),
//                   ),
//                   Container(
//                     child: ScoreBoard(),
//                   ),
//                   Container(
//                     child: PointsSection(),
//                   ),
//                 ],
//               ),
//             ),
//             Container(
//               child: Row(
//                 children: <Widget>[
//                   MaterialButton(
//                     onPressed: () {
//                       Navigator.pop(context);
//                     },
//                     child: Text('Reset Player'),
//                   ),
//                   MaterialButton(
//                     onPressed: () {
//                       // TODO: clear both hustle points and points values,
//                     },
//                     child: Text('Undo'),
//                   ),
//                   MaterialButton(
//                     onPressed: () {
//                       // TODO: Reset point or maybe pop point off top of stack
//                     },
//                     child: Text('Rest Points'),
//                   ),
//                   MaterialButton(
//                     onPressed: () {},
//                     child: Text('PowerOf1 ReportCard'),
//                   ),
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     );

class ScoreCardScreenWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.fromLTRB(16, 24, 16, 8),
      height: double.infinity,
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: HustlePointsSection(),
              ),
              Expanded(
                child: Text('second'),
              ),
              Expanded(
                child: PointsSection(),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                child: Text("first"),
              ),
              Container(
                child: Text('second'),
              ),
              Container(
                child: Text('third'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
