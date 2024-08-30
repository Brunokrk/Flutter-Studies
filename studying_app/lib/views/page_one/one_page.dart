import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OnePage extends StatelessWidget {
  const OnePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Page One"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.looks_one_sharp, size: 90,),
            Text("Page One", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ()=> {GoRouter.of(context).push('/two')},
        tooltip: 'Next Page',
        child: const Icon(Icons.navigate_next_sharp),
      ),
    );
  }

}
