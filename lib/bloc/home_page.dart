import 'dart:math';
import 'package:flutter/material.dart';
import 'counter_bloc.dart';
import 'room_model.dart';
import 'room_bloc.dart';
import 'settings_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _counter = 0;
  late CounterBloc counterBloc;
  List<int> numbers = [1, 2, 3, 4, 5];

  @override
  void initState() {
    print("widget init");
    counterBloc = CounterBloc(counter: 3);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    print("widget didChangeDependencies");
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    print(".....................widget dispose");
    counterBloc.dispose();
    super.dispose();
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    print("widget build");

    return Scaffold(
      appBar: AppBar(
        title: Text("bloc StatefulWidget"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => SettingsPage()));
              },
              icon: Icon(Icons.menu)),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            SizedBox(
              height: 100,
            ),
            Divider(),
            StreamBuilder(
              stream: Room_bloc.getRoom,
              builder: (context, data) {
                // if (!data.hasData) return CircularProgressIndicator();
                if (data.data == null) return Text("getRoom data null");
                Room room = data.data as Room;
                // print("getRoom : id : ${event.id}, name : ${event.name}");
                return Text("getRoom id : ${room.id}, name : ${room.name}");
              },
            ),
            Divider(),
            StreamBuilder(
              stream: Room_bloc.getRoomASY(),
              builder: (context, data) {
                // if (!data.hasData) return CircularProgressIndicator();
                print("data : ${data.data}");
                if (data.data == null) return Text("getRoomASY data null");
                Room room = data.data as Room;
                print("getRoom : id : ${room.id}, name : ${room.name}");
                return Text("getRoomASY id : ${room.id}, name : ${room.name}");
              },
            ),
            Divider(),
            StreamBuilder(
              stream: Room_bloc.getRoomPS,
              builder: (context, data) {
                if (data.data == null) return Text("getRoomPS data null");
                Room room = data.data as Room;
                if (room == null) return CircularProgressIndicator();
                // print("getRoom : id : ${event.id}, name : ${event.name}");
                return Text("getRoomPS id : ${room.id}, name : ${room.name}");
              },
            ),
            Divider(),
            () {
              Room? room = Room_bloc.getRoomBSVal;
              if (room == null) return Text("getRoomBSVal data null");
              // print("getRoom : id : ${event.id}, name : ${event.name}");
              return Text("getRoomBSVal id : ${room.id}, name : ${room.name}");
            }(),
            Divider(),
            StreamBuilder(
              stream: Room_bloc.getRoomBS,
              builder: (context, data) {
                // if (!data.hasData) return CircularProgressIndicator();
                if (data.data == null) return Text("getRoomBS data null");
                Room room = data.data as Room;
                // print("getRoom : id : ${event.id}, name : ${event.name}");
                return Text("getRoomBS id : ${room.id}, name : ${room.name}");
              },
            ),
            Divider(),
            StreamBuilder(
              stream: Room_bloc.getRoomRS,
              builder: (context, data) {
                // if (!data.hasData) return CircularProgressIndicator();
                if (data.data == null) return Text("getRoomRS data null");
                Room room = data.data as Room;
                // print("getRoom : id : ${event.id}, name : ${event.name}");
                return Text("getRoomRS id : ${room.id}, name : ${room.name}");
              },
            ),
            () {
              return ElevatedButton(
                  onPressed: () {
                    int num = Random().nextInt(9);
                    Room room =
                        Room(id: num.toString(), name: num.toString() + "st");
                    Room_bloc.addRoom(room);
                  },
                  child: Text("addRoom"));
            }(),
            () {
              return ElevatedButton(
                  onPressed: () {
                    int num = Random().nextInt(9);
                    Room room =
                        Room(id: num.toString(), name: num.toString() + "st");
                    Room_bloc.addRoomASY(room);
                  },
                  child: Text("getRoomASY"));
            }(),
            () {
              return ElevatedButton(
                  onPressed: () {
                    int num = Random().nextInt(9);
                    Room room =
                        Room(id: num.toString(), name: num.toString() + "st");
                    Room_bloc.addRoomPS(room);
                  },
                  child: Text("addRoomPS"));
            }(),
            () {
              return ElevatedButton(
                  onPressed: () {
                    int num = Random().nextInt(9);
                    Room room =
                        Room(id: num.toString(), name: num.toString() + "st");
                    Room_bloc.addRoomBS(room);
                  },
                  child: Text("addRoomBS"));
            }(),
            () {
              return ElevatedButton(
                  onPressed: () {
                    int num = Random().nextInt(9);
                    Room room =
                        Room(id: num.toString(), name: num.toString() + "st");
                    Room_bloc.addRoomRS(room);
                  },
                  child: Text("addRoomRS"));
            }(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
