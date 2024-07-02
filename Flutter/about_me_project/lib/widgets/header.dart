import 'package:about_me_project/screens/Home%20View/home_view.dart';
import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 57.6,
      color: Colors.black,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Home_View()));
            },
            child: Container(
              child: Image.asset('assets/images/Logo2.png'),
              width: 200,
            ),
          ),
        ],
      ),
    );
  }
}
