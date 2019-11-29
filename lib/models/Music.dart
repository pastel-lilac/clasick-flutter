class Music {
  int id;
  String name;
  String description;
  // other key
  int artistId;
  int albumId;
  Music(this.id, this.name);

  Music.fromJson(Map<String, dynamic> json) {
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