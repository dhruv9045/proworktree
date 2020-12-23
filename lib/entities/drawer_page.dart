import 'package:flutter/material.dart';
import 'package:proworktree/reusable_widget/drawer_tiles.dart';

import '../constants.dart';
import '../route_constants.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        child: new ListView(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 30.0),
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                      image: AssetImage('assets/images/registered-image-2.png'),
                      height: 50.0),
                ],
              ),
            ),
            Divider(
              color: Colors.black,
              thickness: 1,
            ),
            DrawerTiles(
              label: 'Dashboard',
              icon: Icons.home,
              function: ()=>Navigator.pushReplacementNamed(context, homeScreen),
            ),
            DrawerTiles(
              function: ()=>Navigator.popAndPushNamed(context, companyRegistration),
              label: 'Company Registration',
            ),
            DrawerTiles(
              function: ()=>Navigator.popAndPushNamed(context, onePersonCompany),
              label: 'One Person Company',
            ),
            DrawerTiles(
              function: ()=>Navigator.popAndPushNamed(context, partnershipRegistration),
              label: 'Business Registration',
            ),
            DrawerTiles(
              function: ()=>Navigator.popAndPushNamed(context, contactUs),
              label: 'Contact Us',
            ),
            DrawerTiles(
              function: ()=>Navigator.popAndPushNamed(context, searchCompanyName),
              label: 'Search Company Name',
            ),
            DrawerTiles(
              function: ()=>Navigator.popAndPushNamed(context, blog),
              label: 'Blog',
              icon: Icons.block,
            ),
          ],
        ),
      ),
    );
  }
}
