import 'dart:convert';

import 'package:app/models/webtoon_detail_model.dart';
import 'package:app/models/webtoon_episodes_model.dart';
import 'package:app/models/webtoonmodel.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  static String baseurl = "https://webtoon-crawler.nomadcoders.workers.dev";
  static String today = "today";

  static Future<List<WebtoonModel>> getTodaysToons() async {
    List<WebtoonModel> webtoonInstances = [];
    Uri url = Uri.parse("$baseurl/$today");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final List webtoons = jsonDecode(response.body);
      for (var webtoon in webtoons) {
        webtoonInstances.add(WebtoonModel.fromJson(webtoon));
      }
      return webtoonInstances;
    }
    throw Error();
  }

  static Future<WebtoonDetail> getDetail(String id) async {
    Uri url = Uri.parse("$baseurl/$id");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final webtoondetail = jsonDecode(response.body);
      return WebtoonDetail.fromJson(webtoondetail);
    }
    throw Error();
  }

  static Future<List<WebtoonEpisodes>> getLatestEpisodes(String id) async {
    List<WebtoonEpisodes> webtoonInstances = [];
    Uri url = Uri.parse("$baseurl/$id/episodes");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final List webtoons = jsonDecode(response.body);
      for (var webtoon in webtoons) {
        webtoonInstances.add(WebtoonEpisodes.fromJson(webtoon));
      }
      return webtoonInstances;
    }
    throw Error();
  }
}
