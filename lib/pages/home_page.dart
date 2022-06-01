import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:mantech/news_list.dart';
import '../services/api.dart';
import 'detail_page.dart';

class Home extends StatefulWidget {
  Home({Key? key,int? index}) : i=index, super(key: key);
  int? i=0;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late int index;
  @override
  void initState()
  {

    index=widget.i!;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(index);
    return
      FutureBuilder(
        future: API().getData(index),
    builder: (context, snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
    return Container(
    color: Colors.white,
    child: Scaffold(
    body: Center(
      child: CircularProgressIndicator(
      backgroundColor: Colors.black,
      ),
    ),
    ),
    );
    } else {
    if (snapshot.hasError) {
    print(snapshot.error);
    return Container(

    color: Colors.white,
    child: Center(
    child: Text(
    'Something went wrong, try again.',
    style: Theme
        .of(context)
        .textTheme
        .headline6,
    ),
    ),
    );
    } else {

    return Container(
      child:ListView(
        children:[

          Container(
              height: 50,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  for(var i = 1; i <= SECTIONS.length; i++)
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: (i == index) ? Colors.grey : Colors
                            .white,
                      ),


                      onPressed: () {

                        index = i;

                        setState(() {


                        });
                      },
                      child: Text("${SECTIONS[i - 1]}",
                          style: TextStyle(color: Colors.black)),

                    ),

                ],

              )
          ),
          SizedBox(height: 10),
          ((snapshot.data as List).length !=0)?GestureDetector(
            onTap: () {
              print(index);
              Map m= {};
              m["index1"]=index;
              m["data"]=(snapshot.data as List);
              m["index2"]=0;
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => Details(
                      map: m),
                ),
              );
            },
            child: Container(
              //height: MediaQuery.of(context).size.height/2.5,
                child: Column(
                    children: [

                      Container(
                          height: MediaQuery
                              .of(context)
                              .size
                              .height / 4,
                          child: Image.network(
                              (snapshot.data as List)[0]["image"])),
                      ListTile(
                        title: Text(
                            "${(snapshot.data as List)[0]["title"]}"),
                        subtitle: Html(
                            data: "${(snapshot.data as List)[0]["excerpt"]}"),

                      ),
                      Row(
                          children: [
                            IconButton(
                              icon: Icon(Icons.bookmark_outline),
                              onPressed: () {},
                            ),
                            IconButton(
                              icon: Icon(Icons.share),
                              onPressed: () {},
                            ),

                          ]
                      ),
                      Divider(
                        height: 10,
                        thickness: 2,
                        color: Colors.black,
                      )
                    ]
                )
            ),
          ):Text("No data"),
          for(int i = 2; i <= (snapshot.data as List).length; i++)
            Column(
              children: [
                GestureDetector(
                  onTap: () {
                    print(index);
                    Map m= {};
                    m["index1"]=index;
                    m["data"]=(snapshot.data as List);
                    m["index2"]=i-1;
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => Details(
                            map: m),
                      ),
                    );
                  },
                  child:
                  Row(
                      children: [
                        Container(
                            margin: EdgeInsets.all(5),
                            width: 120,
                            child: Image.network(
                                (snapshot.data as List)[i-1]["image"])),
                        SizedBox(width: 10),
                        Flexible(
                          child: Text("${(snapshot.data as List)[i-1]["title"]}", style: TextStyle(
                              fontWeight: FontWeight.w400)),
                        ),

                      ]
                  ),
                ),
                Divider(
                  height: 10,
                  thickness: 2,
                  color: Colors.black,
                )
              ],

            )
        ]
      )
    );}}}
    );

  }
}
