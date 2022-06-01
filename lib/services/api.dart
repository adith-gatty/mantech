
import 'dart:convert';
import 'package:http/http.dart';
import 'package:mantech/news_list.dart';
class API
{
  Future<List> getData(int index) async
  {
    try {
      // var request = Request('GET', Uri.parse('http://chambalsandesh.com/cs/wp-json/wp/v2/posts/'));
       Response response=await get(Uri.parse('http://chambalsandesh.com/cs/wp-json/wp/v2/posts/'));





      if (response.statusCode == 200) {
        List l=[];
        List data=jsonDecode(response.body);
        for(int i=0;i<data.length;i++)
          {
            if(index==1 || S1[SECTIONS[index-1]]==data[i]["categories"][0]) {
              Map m = {};
              m["id"] = data[i]["id"];
              m["title"] = data[i]["title"]["rendered"];
              m["categories"] = data[i]["categories"];
              m["content"] = data[i]["content"]["rendered"];
              if(data[i]["yoast_head_json"]["og_image"][0]["url"]!=null)
              m['image']=data[i]["yoast_head_json"]["og_image"][0]["url"];
              else
                m["image"]="https://www.industrialempathy.com/img/remote/ZiClJf-1920w.jpg";
              if(data[i]["excerpt"]["rendered"]!=null)
              m['excerpt']=data[i]["excerpt"]["rendered"];
              else
                m["excerpt"]="";
              l.add(m);
            }
          }
        print(l);

        return l;
      }
      else {
        print(response.reasonPhrase);
      }

    }
    catch(e)
    {
      print(e);
    }
    return([]);
  }
}