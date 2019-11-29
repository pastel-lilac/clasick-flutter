class Playlist {
  int id;
  String name;
  String description;
  // other key
  int artistId;
  int albumId;
  Playlist({this.id, this.name});

  Playlist.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}