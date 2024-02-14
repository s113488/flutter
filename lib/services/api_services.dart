import 'package:http/http.dart' as http;

class ApiServices {
  final String baseurl = "https://webtoon-crawler.nomadcoders.workers.dev";
  final String today = "today";
  void getTodaysToons() async {
    Uri url = Uri.parse("$baseurl/$today");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      print(response.body);
      return;
    }
    throw Error();
  }
}
