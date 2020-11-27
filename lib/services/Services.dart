import 'package:http/http.dart' as http;
import '../models/newsApi.dart';
class Services {

  static Future<News> getdata(String url) async {
    await Future.delayed(Duration(seconds: 0));
    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        //print("Everything is ok");

        News mydata = newsFromJson(response.body);
        return mydata;
      } else {
        print("1st");
        return News(status: "free Limit Exceeded");
      }
    } catch (e) {
      if (e.runtimeType.toString() == "SocketException") {
        print("2nd");
        return News(status: "No Internet");
      }
      return News();
    }
  }
}
