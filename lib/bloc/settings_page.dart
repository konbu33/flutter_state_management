import 'package:flutter/material.dart';
import 'room_model.dart';
import 'room_bloc.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("bloc StatelessWidget"),
      ),
      body: Column(
        children: [
          StreamBuilder(
            stream: Room_bloc.getRoom,
            builder: (BuildContext context, AsyncSnapshot<Room> data) {
              if (data.data == null) return Text("data is null");
              Room room = data.data as Room;
              return Text("getRoom : ${room.id}, name : ${room.name}");
            },
          ),
          Divider(),
          StreamBuilder(
            stream: Room_bloc.getRoomASY(),
            builder: (BuildContext context, AsyncSnapshot<Room> data) {
              if (data.data == null) return Text("data is null");
              Room room = data.data as Room;
              return Text("getRoomASY : ${room.id}, name : ${room.name}");
            },
          ),
          Divider(),
          StreamBuilder(
            stream: Room_bloc.getRoomPS,
            builder: (BuildContext context, AsyncSnapshot<Room> data) {
              if (data.data == null) return Text("data is null");
              Room room = data.data as Room;
              return Text("getRoomPS: ${room.id}, name : ${room.name}");
            },
          ),
          Divider(),
          StreamBuilder(
            stream: Room_bloc.getRoomBS,
            builder: (BuildContext context, AsyncSnapshot<Room> data) {
              if (data.data == null) return Text("data is null");
              Room room = data.data as Room;
              return Text("getRoomBS : ${room.id}, name : ${room.name}");
            },
          ),
          Divider(),
          StreamBuilder(
            stream: Room_bloc.getRoomRS,
            builder: (BuildContext context, AsyncSnapshot<Room> data) {
              if (data.data == null) return Text("data is null");
              Room room = data.data as Room;
              return Text("getRoomRS : ${room.id}, name : ${room.name}");
            },
          ),
        ],
      ),
    );
  }
}
