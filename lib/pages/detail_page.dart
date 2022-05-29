import 'package:flutter/material.dart';

import '../news_list.dart';

class Details extends StatefulWidget {
  Details({Key? key,Map? map}) : data= map,super(key: key);
  Map? data={};

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  late Map data;
  void initState()
  {
    data=widget.data!;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed:(){},icon: Icon(Icons.bookmark_outline)),
          IconButton(onPressed:(){},icon: Icon(Icons.share)),

        ],
          iconTheme: IconThemeData( color:Colors.black),
          actionsIconTheme: IconThemeData( color:Colors.black),
          backgroundColor: Colors.white,
        title: Text("Section ${data["index1"]}",style:TextStyle(color: Colors.black))

      ),
      body: Padding(

        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children:[
            Container(
                height: MediaQuery.of(context).size.height/3,
                child: Image.network(DATA[data["index1"]-1]["data"][data["index2"]-1]["image"])),
            Center(
            child:Text("${DATA[data["index1"]-1]["data"][data["index2"]-1]["title"]}",
            style:TextStyle(fontSize: 20,fontWeight: FontWeight.bold))
          ),
          Text("${DATA[data["index1"]-1]["data"][data["index2"]-1]["content"]}"),
          SizedBox(width: 5),
          Container(
            height: 50,
            color:Colors.grey,
            child:Center(child: Text("NEXT ARTICLE"))

          ),
            SizedBox(height: 2),
            (data["index2"]<DATA[data["index1"]-1]["data"].length)?GestureDetector(
              onTap:() {

                Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => Details(map: {"index1":data["index1"],"index2": data["index2"]+1}),
                ),
              );},
              child: Center(
                  child:Text("${DATA[data["index1"]-1]["data"][data["index2"]]["title"]}",
                      style:TextStyle(fontSize: 20,fontWeight: FontWeight.bold))
              ),
            ):GestureDetector(
              onTap:() {Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => Details(map: {"index1":data["index1"],"index2": 1}),
                ),
              );},
              child: Center(
                  child:Text("${DATA[data["index1"]-1]["data"][0]["title"]}",
                      style:TextStyle(fontSize: 20,fontWeight: FontWeight.bold))
              ),
            ),
            Divider(
              color:Colors.black,
              height: 5,
              thickness: 2,
            )
          ]
        ),
      )
    );
  }
}
