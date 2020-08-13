import 'package:flutter/material.dart';

class ReportCard extends StatelessWidget {
  const ReportCard({Key key, this.title}) : super(key: key);
  final title;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            Text(title),
            GestureDetector(onTap: () {}, child: Text('Made')),
            GestureDetector(onTap: () {}, child: Text('Miss'))
          ],
        ),
      ),
    );
  }
}
