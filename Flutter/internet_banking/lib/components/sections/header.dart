import 'package:flutter/material.dart';
import 'package:internet_banking/themes/theme_colors.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: ThemeColors.headerGradient),
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(10)),
      ),
      child:  Padding(
        padding: EdgeInsets.fromLTRB(16.0, 80, 16, 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text.rich(
                  TextSpan(
                    text: '\$',
                    children: <TextSpan>[
                      TextSpan(
                        text: "1000.00",
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ],
                  ),
                ),
                Text(
                  'Balanço Disponível',
                ),
              ],
            ),
            Icon(
              Icons.account_circle,
              size: 42,
            ),
          ],
        ),
      ),
    );
  }
}
