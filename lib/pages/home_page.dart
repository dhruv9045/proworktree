import 'package:flutter/material.dart';
import 'package:proworktree/entities/drawer_page.dart';
import 'package:proworktree/entities/grid_view.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomePageScreen(),
    );
  }
}

class HomePageScreen extends StatefulWidget {
  @override
  _HomePageScreenState createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {

  @override
  Widget build(BuildContext context) {
    final ScreenSize = MediaQuery.of(context).size;

    Future<bool> _onWillPop() async {
      return (await showDialog(
            context: context,
            builder: (context) => new AlertDialog(
              title: new Text('Are you sure?'),
              content: new Text('Do you want to exit an App'),
              actions: <Widget>[
                new FlatButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: new Text('No'),
                ),
                new FlatButton(
                  onPressed: () => Navigator.of(context).pop(true),
                  child: new Text('Yes'),
                ),
              ],
            ),
          )) ??
          false;
    }

    return new WillPopScope(
      onWillPop: _onWillPop,
      child: new Scaffold(
        primary: true,
        appBar: new AppBar(
          title: new Text('Dashboard'),
          automaticallyImplyLeading: true,
        ),
        drawer: new MyDrawer(),
        body: new Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Image.asset(
                      'assets/images/registered-image-2.png',
                      height: 90,
                      width: ScreenSize.width,
                    ),
                  ),
                ),
              ],
            ),

            Divider(
              color: Colors.blue[900],
              thickness: 5,
            ),

            //Gradial View
            Flexible(
              fit: FlexFit.loose,
              child: GridViewPage(),
            ),
          ],
        ),
      ),
    );
  }
}
