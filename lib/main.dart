import 'package:flutter/material.dart';

void main() => runApp(LNWater());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
            FlatButton(
              child: Text("open new route"),
              textColor: Colors.blue,
              onPressed: () {
                Navigator.push(context,
                    new MaterialPageRoute(builder: (context) {
                  return new NewRoute();
                }));
              },
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class NewRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New route"),
      ),
      body: Center(
        child: Text("This is new route"),
      ),
    );
  }
}

class LNWater extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '连你订水',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHome(),
    );
  }
}


class MyHome extends StatefulWidget {
  @override
  _MyHomeState createState() => new _MyHomeState(this);
}


class _MyHomeState extends State<MyHome> with SingleTickerProviderStateMixin {

  TabController tabController;

 @override
  void initState() {
    tabController = new TabController(vsync: this, length: 4);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        controller: tabController,
        children: <Widget>[
          NewRoute(),
          OneKey(title: '订水',),
          NewRoute(),
          NewRoute()
        ],
      ),
      bottomNavigationBar: Material(
        color: Colors.orangeAccent,
        child: TabBar(
          controller: tabController,
          tabs: <Tab>[
            Tab(
              text: "水票", 
              icon: Text("\uE99a",
                style: TextStyle(
                  fontFamily: "Iconfont",
                  fontSize: 22.0,
                  color:
                      Color(0xFF1EB9EE)),
              ),
            ),
            Tab(
              text: "订水", 
              icon: Text("\uE8d1",
                style: TextStyle(
                  fontFamily: "Iconfont",
                  fontSize: 22.0,
                  color:
                      Color(0xFF1EB9EE)),
              ),
            ),
            Tab(
              text: "订单", 
              icon: Text("\uE8cd",
                style: TextStyle(
                  fontFamily: "Iconfont",
                  fontSize: 22.0,
                  color:
                      Color(0xFF1EB9EE)),
              ),
            ),
            Tab(
              text: "个人", 
              icon: Text("\uE8ea",
                style: TextStyle(
                  fontFamily: "Iconfont",
                  fontSize: 22.0,
                  color:
                      Color(0xFF1EB9EE)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



class OneKey extends StatefulWidget {
   // 构造函数
  OneKey({Key key, this.title}) : super(key: key);

  // 组件内部数据
  final String title;   
  

  @override
  _OneKeyState createState() => _OneKeyState();
}

class _OneKeyState extends State<OneKey> with SingleTickerProviderStateMixin {

  TabController controller;

  @override
  void initState() {
    controller = new TabController(vsync: this, length: 3);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: ConstrainedBox(
          constraints: BoxConstraints.expand(),
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Container(
                color: Color(0xFF1EB9EE),
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: Container(
                        height: 160,
                        child: DecoratedBox(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Color(0xFFFFFFFF),
                            ),
                            child: Column(
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(0, 20, 0, 0),
                                        child: Column(
                                          children: <Widget>[
                                            Row(
                                              children: <Widget>[
                                                Container(
                                                  margin: EdgeInsets.only(
                                                      right: 10),
                                                  child: Text(
                                                    "\uE905",
                                                    style: TextStyle(
                                                        fontFamily: "Iconfont",
                                                        fontSize: 15.0,
                                                        color:
                                                            Color(0xFF1EB9EE)),
                                                  ),
                                                ),
                                                Text(
                                                  "选择配送时间",
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Color(0xFF1EB9EE)),
                                                ),
                                              ],
                                            )
                                          ],
                                        ))
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Container(
                                      margin: EdgeInsets.only(top: 5),
                                      child: Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(12, 0, 12, 0),
                                        child: Container(
                                          // height: 53,
                                          constraints: BoxConstraints.tightFor(
                                              width: 321, height: 53),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                              Container(
                                                margin:
                                                    EdgeInsets.only(right: 10),
                                                child: Center(
                                                  child: Text(
                                                    "地址",
                                                    style: TextStyle(
                                                        fontSize: 17,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                width: 250,
                                                child: TextField(
                                                  decoration: InputDecoration(
                                                    // labelText: "用户名",
                                                    hintText: "收获地址",
                                                    hintStyle: TextStyle(
                                                        fontSize: 14,
                                                        color:
                                                            Color(0xFF9A9A9A)),
                                                    enabledBorder:
                                                        UnderlineInputBorder(
                                                            borderSide: BorderSide(
                                                                color: Color(
                                                                    0xFFFFFFFF))),
                                                    focusedBorder:
                                                        UnderlineInputBorder(
                                                            borderSide: BorderSide(
                                                                color: Color(
                                                                    0xFFFFFFFF))),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                child: Text("\uE95a",
                                                    style: TextStyle(
                                                        fontFamily: "Iconfont",
                                                        fontSize: 10.0,
                                                        color: Colors.black)),
                                              )
                                            ],
                                          ),
                                          decoration: BoxDecoration(
                                            border: Border(
                                              bottom: BorderSide(
                                                  color: Color(0xFFEEEEEE)),
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(12, 0, 12, 0),
                                      child: Container(
                                        // height: 53,
                                        constraints: BoxConstraints.tightFor(
                                            width: 321, height: 53),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            Container(
                                              margin:
                                                  EdgeInsets.only(right: 10),
                                              child: Center(
                                                child: Text(
                                                  "商品",
                                                  style: TextStyle(
                                                      fontSize: 17,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              width: 250,
                                              child: TextField(
                                                decoration: InputDecoration(
                                                  // labelText: "用户名",
                                                  hintText: "选择商品",
                                                  hintStyle: TextStyle(
                                                      fontSize: 14,
                                                      color: Color(0xFF9A9A9A)),
                                                  enabledBorder:
                                                      UnderlineInputBorder(
                                                          borderSide: BorderSide(
                                                              color: Color(
                                                                  0xFFFFFFFF))),
                                                  focusedBorder:
                                                      UnderlineInputBorder(
                                                          borderSide: BorderSide(
                                                              color: Color(
                                                                  0xFFFFFFFF))),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              child: Text("\uE95a",
                                                  style: TextStyle(
                                                      fontFamily: "Iconfont",
                                                      fontSize: 10.0,
                                                      color: Colors.black)),
                                            )
                                          ],
                                        ),
                                        // decoration: BoxDecoration(
                                        //   border: Border(
                                        //        bottom: BorderSide(
                                        //           color: Color(0xFFEEEEEE)
                                        //       )
                                        //     ),
                                        // ),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ))),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
