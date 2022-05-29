
import 'dart:convert';
import 'package:http/http.dart';
class API
{
  Future<Map> getData() async
  {
    try {
      var headers = {
        'Cookie': 'caf_ipaddr=106.51.25.229; city="Bengaluru"; country=IN; system=PW; traffic_target=gd'
      };
      var request = Request('GET', Uri.parse('http://mantechstudio.in/CSWebAPI/wp_posts'));

      request.headers.addAll(headers);

      StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        print(await response.stream.bytesToString());
      }
      else {
        print(response.reasonPhrase);
      }

    }
    catch(e)
    {
      print(e);
    }
    return({});
  }
}