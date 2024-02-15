class WebtoonEpisodes {
  String id, title, rating, date;

  WebtoonEpisodes.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        id = json['id'],
        rating = json['rating'],
        date = json['date'];
}
