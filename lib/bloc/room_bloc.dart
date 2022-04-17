import 'dart:async';
import 'room_model.dart';
import 'package:rxdart/rxdart.dart';

class Room_bloc {
  // static StreamController<Room> _sc = StreamController.broadcast();
  static StreamController<Room> _sc = StreamController.broadcast();

  static PublishSubject<Room> _ps = PublishSubject();
  static BehaviorSubject<Room> _bs = BehaviorSubject();
  static ReplaySubject<Room> _rs = ReplaySubject();

  static Room? _room;
  static Room? _roomASY;
  static Room? _roomPS;
  static Room? _roomBS;
  static Room? _roomRS;

  Room_bloc();

  static Stream<Room> get getRoom => _sc.stream;

  static Stream<Room> getRoomASY() async* {
    print("_roomASY : ${_roomASY}");
    yield _roomASY ?? Room();
  }

  static Stream<Room> get getRoomPS => _ps.stream;
  static Stream<Room> get getRoomBS => _bs.stream;
  static Room? get getRoomBSVal => _bs.valueOrNull;
  static Stream<Room> get getRoomRS => _rs.stream;

  static void addRoom(Room room) {
    _room = room;
    _sc.sink.add(_room ?? Room());
  }

  static void addRoomASY(Room room) {
    _roomASY = room;
  }

  static void addRoomPS(Room room) {
    _roomPS = room;
    _ps.sink.add(_roomPS ?? Room());
  }

  static void addRoomBS(Room room) {
    _roomBS = room;
    _bs.sink.add(_roomBS ?? Room());
  }

  static void addRoomRS(Room room) {
    _roomRS = room;
    _rs.sink.add(_roomRS ?? Room());
  }
}
