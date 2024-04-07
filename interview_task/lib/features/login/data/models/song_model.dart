class SongModel {
  String? name;
  String? time;

  SongModel({this.name, this.time});

  SongModel.fromJson(Map<String, dynamic> parsedJSON)
      : name = parsedJSON['name'],
        time = parsedJSON['time'];
}
