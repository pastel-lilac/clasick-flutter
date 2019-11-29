class Playlist {
  int id;
  String name;
  String description;
  String iconPath;
  // other key
  int artistId;
  int albumId;

  // TODO: implement mapping data
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

  Playlist(this.id, this.name, this.description, this.iconPath, this.artistId,
      this.albumId);
}