import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

// สร้าง Class สำหรับแยก Widget แบบ StatelessWidget
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.red,
          visualDensity: VisualDensity.adaptivePlatformDensity),
      home: MyHomePage(),
    );
  }
}

// สร้าง Class สำหรับแยก Widget แบบ StatefullWidget
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // กำหนด properties
  int _counter = 0;

  // สร้าง method สำหรับการเพิ่มค่าตัวเลข
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  // สร้าง method สำหรับการลดค่าตัวเลข
  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  // สร้าง method สำหรับการรีเซตค่าตัวเลข
  void _resetCounter() {
    setState(() {
      _counter = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.home),
        title: Text('Hello Flutter'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.notifications),
              onPressed: () {
                print('Your press notification');
              })
        ],
      ),
      body: Center(
          child: Stack(
        children: <Widget>[
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'กดปุ่มด้านล่างเพื่อเพิ่มจำนวน',
                  style: TextStyle(fontSize: 24.0, color: Colors.blue),
                ),
                Text(
                  '$_counter',
                  style: TextStyle(fontSize: 100.0),
                )
              ],
            ),
          ),
          Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Align(
                    alignment: Alignment.bottomRight,
                    child: FloatingActionButton(
                      onPressed: _decrementCounter,
                      tooltip: 'กดลดจำนวน',
                      child: Icon(Icons.remove),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: FloatingActionButton(
                      onPressed: _resetCounter,
                      tooltip: 'กดรีเซตจำนวน',
                      child: Icon(Icons.refresh),
                    ),
                  ),
                  Align(
                      alignment: Alignment.bottomRight,
                      child: FloatingActionButton(
                        onPressed: _incrementCounter,
                        tooltip: 'กดเพิ่มจำนวน',
                        child: Icon(Icons.add),
                      )),
                ],
              )),
        ],
      )),
    );
  }
}
