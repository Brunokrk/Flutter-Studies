import 'package:flutter/material.dart';

class ExploreDrawer extends StatelessWidget {
  const ExploreDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          ListTile(
            title: const Text('GitHub'),
            onTap: () {
              // Goes to GitHub
            },
          ),
          ListTile(
            title: const Text('LinkedIn'),
            onTap: () {
              // Goes to LinkedIn
              //
            },
          ),
          ListTile(
            title: const Text('Instagram'),
            onTap: (){
              // Goes to Instagram
            },
          ),
          ListTile(
            title: const Text('Baixe o currículo!'),
            onTap: (){
              // Goes to Instagram
            },
          ),
        ],
      ),
    );
  }
}
