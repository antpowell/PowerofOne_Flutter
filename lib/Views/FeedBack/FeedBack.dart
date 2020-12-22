import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:power_one/Views/Buttons/PO1Button.dart';

class FeedBack extends StatelessWidget {
  static final String id = 'feedback_screen';
  const FeedBack({Key key, this.title}) : super(key: key);
  final title;

  @override
  Widget build(BuildContext context) {
    Color color = Theme.of(context).primaryColor;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black12,
        title: Text(
          'Power of 1 Score Feed Back',
          style: TextStyle(
            fontSize: 30,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [

              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("\nShooting Percentage\n",
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.white,
                        decoration: TextDecoration.underline,
                      )),
                  Text("Field Goal Percentage: \n",
                      style: TextStyle(
                        color: Colors.white,
                      )),
                  Text("    Free Throw Percentage: \n",
                      style: TextStyle(
                        color: Colors.white,
                      )),
                ],
              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Hustle Points\n",
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.white,
                        decoration: TextDecoration.underline,
                      )),
                  Text("Offensive Rebounds: \n",
                      style: TextStyle(
                        color: Colors.white,
                      )),
                  Text("Blocks: \n",
                      style: TextStyle(
                        color: Colors.white,
                      )),
                  Text("Steals: \n",
                      style: TextStyle(
                        color: Colors.white,
                      )),
                  Text("Assists: \n",
                      style: TextStyle(
                        color: Colors.white,
                      )),
                  Text("Turnovers: \n",
                      style: TextStyle(
                        color: Colors.white,
                      )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
