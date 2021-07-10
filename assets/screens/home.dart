import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverAppBar(
          pinned: true,
          title: Text(
            'Home',
          ),
          centerTitle: true,
          expandedHeight: 200,
          backgroundColor: Colors.red,
        ),
        SliverList(
            delegate: SliverChildBuilderDelegate(
          (context, index) {
            return Center(child: Text('Hello World !'));
          },
          childCount: 50,
        )),
        // SliverFillRemaining(
        //   child: Center(
        //     child: Text('Hello World'),
        //   ),
        // )
      ],
    ));
  }
}
