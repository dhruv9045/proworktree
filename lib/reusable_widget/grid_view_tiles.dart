import 'package:flutter/material.dart';

class ReusableGridViewTile extends StatelessWidget {
   ReusableGridViewTile({@required this.label, @required this.function, @required this.icon});
  IconData icon;
  String label;
  Function function;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
            function();
      },
      child: Container(
        child: Card(
          elevation: 10.0,
          margin: EdgeInsets.all(5.0),
          child: Column(
            children: [
              Expanded(
                flex: 4,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                        child: Icon(
                          icon,
                          color: Colors.black,
                          size: 50,
                        )),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      label,
                      textAlign: TextAlign.center,
                    ),

                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.amber
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Get Started'),
                    ],
                  ),
                ),
              ),
            ],
          ),

        ),
      ),
    );
  }
}