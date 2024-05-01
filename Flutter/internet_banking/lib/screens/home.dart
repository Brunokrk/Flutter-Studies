import 'package:flutter/material.dart';
import 'package:internet_banking/components/box_card.dart';
import 'package:internet_banking/components/content_division.dart';
import 'package:internet_banking/components/sections/account_actions.dart';
import 'package:internet_banking/components/sections/account_points.dart';
import 'package:internet_banking/components/sections/header.dart';
import 'package:internet_banking/components/sections/recent_activity.dart';
import 'package:internet_banking/themes/theme_colors.dart';

import '../components/color_dot.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [Column(
          children: <Widget> [
            Header(),
            RecentActivity(),
            AccountActions(),
            AccountPoints(),
          ],
        )],
      ),
    );
  }
}
