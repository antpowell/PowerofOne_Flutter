import 'package:flutter/material.dart';

class StatTicker extends StatefulWidget {
  StatTicker({this.mainLabel});

  final String mainLabel;

  int count = 0;
  @override
  _StatTickerState createState() => _StatTickerState();
}

class _StatTickerState extends State<StatTicker> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          children: <Widget>[
            Text(
              widget.count.toString(),
              style: TextStyle(
                fontSize: 38,
                color: (widget.count > 0 ? Colors.green : Colors.red),
              ),
            ),
            Text(widget.mainLabel),
            Row(
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.add),
                  color: Colors.green,
                  onPressed: () {
                    setState(
                      () {
                        widget.count++;
                      },
                    );
                  },
                ),
                IconButton(
                  icon: Icon(Icons.remove),
                  color: Colors.red,
                  onPressed: () {
                    setState(
                      () {
                        --widget.count;
                      },
                    );
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
