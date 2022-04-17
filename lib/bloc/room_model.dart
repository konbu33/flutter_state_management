class Room {
  String? id;
  String? name;

  Room({this.id, this.name});

  // fromMap
  // toMap

  Room copyWith({id, name}) {
    return Room(id: id, name: name);
  }

  // updateWith

}
