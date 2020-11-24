import 'package:flutter/material.dart';

void main() => runApp(FeedBack());

class FeedBack extends StatelessWidget {
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
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                new Expanded(
                  flex: 1,
                  child: new SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: new Text("Shooting Percentage\n",
                        style: new TextStyle(
                          fontSize: 16.0,
                          color: Colors.white,
                        )),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      // bottomNavigationBar: new BottomNavigationBar(
      //   backgroundColor: Colors.black12,
      //   fixedColor: Colors.white,
      //   items: [
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.arrow_back),
      //       label: "Back",
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.backpack_outlined),
      //       label: 'Test',
      //     ),
      //   ],
      // ),
    );
  }
}
