class Album {
  int id;
  String name;
  String coverPath;
  String description;
  // other key
  int artistId;
  Album({this.id, this.name});

  Album.fromJson(Map<String, dynamic> json) {
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