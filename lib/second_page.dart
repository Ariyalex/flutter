import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  final String message; //membuat variabel message
  const SecondPage(this.message, {super.key}); //mengirim pesan dari halaman pertama

  @override
  SecondPageState createState() => SecondPageState();
}

class SecondPageState extends State<SecondPage> {
 final List<int> numberList = const <int>[1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('list view', style: TextStyle(color: Colors.white),),
        leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            color: Colors.white,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          Text(widget.message, style: const TextStyle(fontSize: 20)), //menampilkan pesan yang dikirim dari halaman pertama
          Expanded(
            child: ListView.separated(
              itemCount: numberList.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  height: 250,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    border: Border.all(color: Colors.black),
                  ),
                  child: Center(
                    child: Text(
                      '${numberList[index]}',
                      style: const TextStyle(fontSize: 50),
                    ),
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const Divider();
              },
            ),
          ),
        ],
      ),
    );
  }
}