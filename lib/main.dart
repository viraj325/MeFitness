import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Me Fitness Tracker',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFFFD700)),
        useMaterial3: false,
      ),
      home: const MyHomePage(title: 'Me Fitness Tracker'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0xFFFFD700),
                    blurRadius: 30.0, // soften the shadow
                    spreadRadius: 0.0, //extend the shadow
                    offset: Offset(
                      0.0, // Move to right 10  horizontally
                      0.0, // Move to bottom 10 Vertically
                    ),
                  ),
                ],
              ),
              child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              // elevation: 15,
              // shadowColor: const Color(0xFFFFD700),
              color: Colors.black,
              child: SizedBox(
                width: 300,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ), //SizedBox
                      Text(
                        'Upcoming',
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.green[900],
                          fontWeight: FontWeight.w500,
                        ), //Textstyle
                      ), //Text
                      const SizedBox(
                        height: 10,
                      ), //SizedBox
                      const Text(
                        'GeeksforGeeks is a computer science portal for geeks at geeksforgeeks.org. It contains well written, well thought and well explained computer science and programming articles, quizzes, projects, interview experiences and much more!!',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.green,
                        ), //Textstyle
                      ), //Text
                      const SizedBox(
                        height: 10,
                      ), //SizedBox
                      SizedBox(
                        width: 100,
                        child: ElevatedButton(
                          onPressed: () => 'Null',
                          style: ButtonStyle(
                              backgroundColor:
                              MaterialStateProperty.all(Colors.green)),
                          child: const Padding(
                            padding: EdgeInsets.all(4),
                            child: Row(
                              children: [
                                Icon(Icons.touch_app),
                                Text('Visit')
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ), //Column
                ), //Padding
              ), //SizedBox
            ),
            ),
          ],
        ),
      ),
      floatingActionButton: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          boxShadow: const [
            BoxShadow(
              color: Color(0xFFFFD700),
              blurRadius: 15.0, // soften the shadow
              spreadRadius: 0.0, //extend the shadow
              offset: Offset(
                0.0, // Move to right 10  horizontally
                0.0, // Move to bottom 10 Vertically
              ),
            ),
          ],
        ),
        child: FloatingActionButton.extended(
          onPressed: _incrementCounter,
          tooltip: 'Edit Workout',
          backgroundColor: const Color(0xFFFFD700),
          foregroundColor: Colors.black,
          label: const Text("Edit"),
          icon: const Icon(Icons.edit),
        ), // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}
