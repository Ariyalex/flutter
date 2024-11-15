import 'package:flutter/material.dart';


class ExpandedFlexiblePage extends StatelessWidget {
  const ExpandedFlexiblePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expanded & Flexible', style: TextStyle(color: Colors.white),),
        leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            color: Colors.white,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        backgroundColor: Colors.blue,
      ),
      body: const SafeArea(
        child: Column(children: [
          Row(
            children: [
              ExpandedWidget(),
              FlexibleWidget(),
            ],
          ),
          Row(
            children: [
              FlexibleWidget(),
              FlexibleWidget(),
            ],
          ),
          Row(
            children: [
              FlexibleWidget(),
              ExpandedWidget(),
            ],
          ),
        ],),
      ),
    );
  }
}

//expanded widget untuk membuat widget yang bisa mengisi ruang kosong yang tersisa
class ExpandedWidget extends StatelessWidget {
  const ExpandedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(child: Container(
      decoration: BoxDecoration(
        color: Colors.teal,
        border: Border.all(color: Colors.white),
      ),
      child: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(
          'Expanded',
          style: TextStyle(
            fontSize: 24,
            color: Colors.white,
          ),
        ),
      ),
    )
    );
  }
}

//flexible widget untuk membuat widget yang bisa menyesuaikan ukuran widget lain
class FlexibleWidget extends StatelessWidget {
  const FlexibleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Flexible(child: Container(
      decoration: BoxDecoration(
        color: Colors.tealAccent,
        border: Border.all(color: Colors.white),
      ),
      child: const Padding(
        padding:  EdgeInsets.all(16.0),
        child: Text(
          'Flexible',
          style: TextStyle(
            fontSize: 24,
            color: Colors.white,
          ),
      ),
    ),)
    );
  }
}