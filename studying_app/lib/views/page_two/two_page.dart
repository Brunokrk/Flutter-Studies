import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TwoPage extends StatelessWidget {
  const TwoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Page Two"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.looks_two_sharp, size: 90,),
            Text("Page Two", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
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
