import 'package:flutter/material.dart';
import 'package:scaffold/fourth_page.dart';
import 'package:scaffold/third_page.dart';
import 'package:scaffold/second_page.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Oswald',
        primarySwatch: Colors.blue,
      ),
      home: const FirstScreen(),
    );
  }
}

// Mengubah dari StatelessWidget menjadi StatefulWidget
class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  FirstScreenState createState() => FirstScreenState();
}

class FirstScreenState extends State<FirstScreen> {
  String? bahasa; // Variabel untuk menyimpan pilihan dropdown
  String _name = '';
  final TextEditingController _controller = TextEditingController();
  bool lightOn = false;
  String? language;
  bool agree = false;
  final String message = 'Hello form FistScreen';

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold( // return class scaffold (scaffold merupakan tampilan material design flutter)
      appBar: AppBar( // appbar merupakan header aplikasi (biasanya diisi judul atau actionButton)
        title: Container( // contoh implementasi container (container biasanya untuk styling)
          decoration: BoxDecoration(
            color: Colors.red,
            border: Border.all(color: Colors.white, width: 3),
            borderRadius: BorderRadius.circular(10),
          ),
          width: 100,
          child: const Text(
            "Header",
            style: TextStyle(color: Colors.white),
            textAlign: TextAlign.center,
          ),
        ),
        backgroundColor: Colors.blue, // warna background, Colors harus menggunakan 0xFF untuk warna tidak transparan, lalu dilanjut kodenya.
        actions: <Widget>[ // actions menampung <1 widget
          IconButton(
            icon: const Icon( // icon search dengan warna putih
              Icons.search,
              color: Colors.white,
            ),
            onPressed: () {}, // jika ditekan maka ...
          ),
        ],
        leading: IconButton( // leading menampung satu widget
          // iconButton harus ada fungsi onPressed
          icon: const Icon(
            Icons.menu,
            color: Colors.white,
          ),
          onPressed: () {}, // jika ditekan maka ...
        ),
      ),
      // untuk isi/body
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                TextField(
                  decoration: const InputDecoration(
                    hintText: 'Tulis namamu',
                    labelText: "Namamu",
                  ),
                  onSubmitted: (String value) {
                    setState(() {
                      _name = value;
                    });
                  },
                ),
                TextField(
                  controller: _controller,
                  decoration: const InputDecoration(
                    hintText: 'Your Hobby',
                    labelText: 'Hobby',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Image.asset(
                    'images/download.jpg',
                    height: 200,
                    fit: BoxFit.contain,
                  ),
                ),
                ListTile(
                  leading: Checkbox(
                    value: agree,
                    onChanged: (bool? value) {
                      setState(() {
                        agree = value!;
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(agree ? 'setuju' : 'tidak setuju'),
                            duration: const Duration(seconds: 1),
                          ),
                        );
                      });
                    },
                  ),
                  title: const Text('Agree / Disagree'),
                ),
                ListTile(
                  leading: Radio<String>(value: 'Dart', groupValue: language, onChanged: (String? value) {
                    setState(() {
                      language = value;
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Dart selected'),
                          duration: Duration(seconds: 1),
                        ),
                      );
                    });
                  },
                  ),
                  title: const Text('Dart'),
                ),
                ListTile(
                  leading: Radio<String>(
                    value: 'Kotlin',
                    groupValue: language,
                    onChanged: (String? value) {
                      setState(() {
                        language = value;
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Kotlin selected'),
                            duration: Duration(seconds: 1),
                          ),
                        );
                      });
                    },
                  ),
                  title: const Text('Kotlin'),
                ),
                ListTile(
                  leading: Radio<String>(
                    value: 'Swift',
                    groupValue: language,
                    onChanged: (String? value) {
                      setState(() {
                        language = value;
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Swift selected'),
                            duration: Duration(seconds: 1),
                          ),
                        );
                      });
                    },
                  ),
                  title: const Text('Swift'),
                ),
                ElevatedButton(
                  child: const Text("Submit"),
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            content: Text("hello, $_name!"),
                          );
                        });
                  },
                ),
                Switch(
                  value: lightOn,
                  onChanged: (bool value) {
                    setState(() {
                      lightOn = value;
                    });

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(lightOn ? 'Light On' : 'Light Off'),
                        duration: const Duration(seconds: 1),
                      ),
                    );
                  },
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Icon(Icons.share),
                    Icon(Icons.thumb_up),
                    Icon(Icons.thumb_down),
                  ],
                ),
                Center(
                  child: Container( // contoh penerapan container
                    decoration: const BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                    ),
                    padding: const EdgeInsets.all(10),
                    child: const Text(
                      "hallo ariya duta :V",
                      style: TextStyle(color: Colors.white, fontSize: 20, fontFamily: 'Oswald'),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                DropdownButton<String>(
                  items: const <DropdownMenuItem<String>>[
                    DropdownMenuItem<String>(
                      value: "JavaScript",
                      child: Text("Java Script"),
                    ),
                    DropdownMenuItem<String>(
                      value: "C++",
                      child: Text("C++"),
                    ),
                    DropdownMenuItem<String>(
                      value: "Python",
                      child: Text("Python"),
                    ),
                  ],
                  value: bahasa, // Nilai yang dipilih
                  hint: const Text("Pilih Bahasa Pemrograman"),
                  onChanged: (String? value) {
                    setState(() {
                      bahasa = value; // Update nilai dropdown
                    });
                  },
                ),
                ElevatedButton(
                  child: const Text("second page"),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SecondPage(message)), //mengirim pesan ke halaman kedua
                    );
                  },
                ),
                ElevatedButton(
                  child: const Text("third page"),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const ThirdPage()),
                    );
                  },
                ),
                ElevatedButton(
                  child: const Text("fourth page"),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const ExpandedFlexiblePage()),
                    );
                  },
                )
              ],
            ),
          ],
        ),
      ),
      // untuk button di kanan bawah
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(), // agar action button lingkaran
        backgroundColor: Colors.blue,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () {},
      ),
    );
  }
}
