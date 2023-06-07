import 'package:flutter/material.dart';
import 'package:me_fitness/chart.dart';

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
  void _navigateToEditPage() {
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(left: 30.0, top: 50.0, bottom: 25.0),
              alignment: Alignment.centerLeft,
              child: const Text(
                'Upcoming',
                style: TextStyle(
                  fontSize: 30,
                  color: Color(0xFFFFD700),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Center(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: const [
                    BoxShadow(
                      color: Color.fromRGBO(100, 100, 100, 1.0),
                      blurRadius: 30.0, // soften the shadow
                      spreadRadius: -5.0, //extend the shadow
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
                          ),
                          const Text(
                            'Upcoming',
                            style: TextStyle(
                              fontSize: 30,
                              color: Color.fromRGBO(100, 100, 100, 1.0),
                              fontWeight: FontWeight.w500,
                            ),
                          ), //Text
                          const SizedBox(
                            height: 10,
                          ), //SizedBox
                          const Text(
                            'Workout',
                            style: TextStyle(
                              fontSize: 15,
                              color: Color.fromRGBO(150, 150, 150, 1.0),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            width: 100,
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                shadowColor: const Color(0xFFFFD700),
                                backgroundColor: const Color(0xFFFFD700),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                elevation: 15.0,
                              ),
                              child: const Padding(
                                padding: EdgeInsets.all(4),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.sports,
                                      color: Colors.black,
                                    ),
                                    Text(
                                      'Start',
                                      style: TextStyle(color: Colors.black),
                                    )
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
            ),
            Container(
              padding: const EdgeInsets.only(left: 30.0, top: 50.0, bottom: 25.0),
              alignment: Alignment.centerLeft,
              child: const Text(
                'Stats',
                style: TextStyle(
                  fontSize: 30,
                  color: Color(0xFFFFD700),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Container(
              width: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromRGBO(100, 100, 100, 1.0),
                    blurRadius: 15.0, // soften the shadow
                    spreadRadius: -5.0, //extend the shadow
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
                child: const LineChartSample2(),
              )
            ),
            Container(
              padding: const EdgeInsets.only(left: 30.0, top: 50.0, bottom: 25.0),
              alignment: Alignment.centerLeft,
              child: const Text(
                'History',
                style: TextStyle(
                  fontSize: 30,
                  color: Color(0xFFFFD700),
                  fontWeight: FontWeight.w500,
                ),
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
          onPressed: _navigateToEditPage,
          tooltip: 'Edit Workout',
          backgroundColor: const Color(0xFFFFD700),
          foregroundColor: Colors.black,
          label: const Text("Edit Workout"),
          icon: const Icon(Icons.edit),
        ),
      ),
    );
  }
}
