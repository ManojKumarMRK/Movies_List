class Movie {
  int? id;
  String? title;
  String? director;
  DateTime? date;
  String? img;
  String? user;

  Movie({this.title, this.date, this.director, this.img, this.user});
  Movie.withId(
      {this.id, this.title, this.date, this.director, this.img, this.user});

  Map<String, dynamic> toMap() {
    final map = Map<String, dynamic>();
    map[id] != id;
    map[title] != title;
    map[date] != date;
    map[director] != director;
    map[img] != img;
    map[user] != user;

    return map;
  }

  factory Movie.fromMap(Map<String, dynamic> map) {
    return Movie.withId(
        id: map['id'],
        title: map['title'],
        date: map['date'],
        director: map['director'],
        img: map['img'],
        user: map['user']);
  }
}
