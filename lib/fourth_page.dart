import 'package:flutter/material.dart';

class ExpandedFlexiblePage extends StatefulWidget {
  const ExpandedFlexiblePage({super.key});

  @override
  State<ExpandedFlexiblePage> createState() => _ExpandedFlexiblePageState();
}

class _ExpandedFlexiblePageState extends State<ExpandedFlexiblePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Column(children: [
          Row(
            children: [
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
              )
            ],
          ),
        ],),
      ),
    );
  }
}

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