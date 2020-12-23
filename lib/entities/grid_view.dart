import 'package:flutter/material.dart';
import 'package:proworktree/reusable_widget/grid_view_tiles.dart';

import '../route_constants.dart';

class GridViewPage extends StatefulWidget {
  @override
  _GridViewPageState createState() => _GridViewPageState();
}

class _GridViewPageState extends State<GridViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 2,
        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
        mainAxisSpacing: 7,
        children: <Widget>[
          ReusableGridViewTile(
            label: 'Company Registration',
            icon: Icons.home,
            function: () => Navigator.pushNamed(context, companyRegistration),
          ),
          ReusableGridViewTile(
            label: 'One Person Company',
            icon: Icons.home,
            function: () => Navigator.pushNamed(context, onePersonCompany),
          ),
          ReusableGridViewTile(
            label: 'Limited Liability Partnership',
            icon: Icons.home,
            function: () => Navigator.pushNamed(context, limitedLiabilityPartnership),
          ),ReusableGridViewTile(
            label: 'Proprietorship Registration',
            icon: Icons.home,
            function: () => Navigator.pushNamed(context, proprietorshipRegistration),
          ),ReusableGridViewTile(
            label: 'Partnership Registration',
            icon: Icons.home,
            function: () => Navigator.pushNamed(context, partnershipRegistration),
          ),
          ReusableGridViewTile(
            label: 'Contact Us',
            icon: Icons.home,
            function: () => Navigator.pushNamed(context, contactUs),
          ),
        ],
      ),
    );
  }
}
