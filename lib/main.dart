import 'package:flutter/material.dart';
import 'package:proworktree/pages/blog.dart';
import 'package:proworktree/pages/limited_liability_partnership.dart';
import 'package:proworktree/pages/company_registration.dart';
import 'package:proworktree/pages/contact_us.dart';
import 'package:proworktree/pages/home_page.dart';
import 'package:proworktree/pages/one_person_company.dart';
import 'package:proworktree/pages/partnership_registration.dart';
import 'package:proworktree/pages/proprietorship_registration.dart';
import 'package:proworktree/pages/search_company_name.dart';
import 'package:proworktree/pages/splash_screen.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
        secondaryHeaderColor: Colors.green,

      ),
      initialRoute: '/splash_screen',
      routes:{
        '/home_screen':             (context) => HomePage(),
        '/splash_screen':           (context) => SplashScreen(),
        '/blog':                    (context) => Blog(),
        '/search_company_name':     (context) => SearchCompanyName(),

        '/company_registration':    (context) => CompanyRegistration(),
        '/one_person_company':       (context) => OnePersonCompany(),
        '/limited_liability_partnership': (context) => LimitedLiabilityPartnership(),
        '/proprietorship_registration':              (context) => ProprietorshipRegistration(),
        '/partnership_registration':              (context) => PartnershipRegistration(),
        '/contact_us':              (context) => ContactUs(),
      },
    );
  }
}
