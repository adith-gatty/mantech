import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:html/parser.dart' as htmlparser;
import 'package:html/dom.dart' as dom;
import 'package:mantech/news_list.dart';
import 'package:mantech/pages/detail_page.dart';
import 'package:mantech/services/api.dart';
import 'package:mysql1/mysql1.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      theme: ThemeData(

        primarySwatch: Colors.grey,
      ),
      home: const MyHomePage(title: 'News App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  
  int index=1;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        toolbarTextStyle: TextStyle(color: Colors.black),
        iconTheme: IconThemeData( color:Colors.black),
        actionsIconTheme: IconThemeData( color:Colors.black),
        backgroundColor: Colors.white,

        title: Text("Kalwad Times",style:TextStyle(color: Colors.black)),
      ),
       drawer: Drawer(

         child:ListView(
           children: [
             UserAccountsDrawerHeader(


               accountName: Text("Name"),
               accountEmail: Text("Email"),
               currentAccountPicture: CircleAvatar(
                 backgroundColor: Colors.white,
                 child:Text("Image"),
               ),

             ),
             ListTile(title:Text("SETTINGS")),
             TextButton(onPressed: (){},child:Text("Light mode")),
             TextButton(onPressed: (){},child:Text("Notifications")),
             Divider(
               height: 10,
               thickness: 2,
               color:Colors.black,
             ),
             ListTile(title:Text("LATEST FEATURES")),
             TextButton(onPressed: (){},child:Text("Learn more")),
             Divider(
               height: 10,
               thickness: 2,
               color:Colors.black,
             ),
             TextButton(onPressed: (){},child:Text("About us")),
             TextButton(onPressed: (){},child:Text("Disclaimer")),
           ],
         ),
       ),
       body: ListView(
         children: [
           Container(
             height: 50,
             child: ListView(
               scrollDirection: Axis.horizontal,
               children:[
                 for(var i=1;i<10;i++)
                 ElevatedButton(
                   style: ElevatedButton.styleFrom(
                     primary:(i==index)?Colors.grey:Colors.white,
                   ),


                   onPressed: (){
                     index=i;
                     setState(() {

                     });
                   },
                   child: Text("Section $i",style:TextStyle(color: Colors.black)),

                 ),

               ],

             )
           ),
           GestureDetector(
             onTap:() {Navigator.push(
               context,
               MaterialPageRoute(
                 builder: (BuildContext context) => Details(map: {"index1":index,"index2": 1}),
               ),
             );},
             child: Container(
                 //height: MediaQuery.of(context).size.height/2.5,
                 child:Column(
                     children:[
                       Container(
                          height: MediaQuery.of(context).size.height/4,
                           child: Image.network(DATA[index-1]["data"][0]["image"])),
                       ListTile(
                         title: Text("${DATA[index-1]["data"][0]["title"]}"),
                         subtitle: Text("${DATA[index-1]["data"][0]["content"]}"),

                       ),
                       Row(
                         children:[
                           IconButton(
                             icon:Icon(Icons.bookmark_outline),
                             onPressed: (){},
                           ),
                           IconButton(
                             icon:Icon(Icons.share),
                             onPressed: (){},
                           ),

                         ]
                       ),
                       Divider(
                         height: 10,
                         thickness: 2,
                         color:Colors.black,
                       )
                     ]
                 )
             ),
           ),
           for(int i=2;i<=4;i++)
             Column(
               children: [
                 GestureDetector(
                   onTap:() {Navigator.push(
                     context,
                     MaterialPageRoute(
                       builder: (BuildContext context) => Details(map: {"index1":index,"index2": i}),
                     ),
                   );},
                   child: Row(
                     children:[
                       Container(
                         width: 120,
                           child: Image.network(DATA[index-1]["data"][i-1]["image"])),
                       SizedBox(width: 10),
                       Text("${DATA[index-1]["data"][i-1]["title"]}",style:TextStyle(fontWeight: FontWeight.w400)),

                     ]
                   ),
                 ),
                 Divider(
                   height: 10,
                   thickness: 2,
                   color:Colors.black,
                 )
               ],

             )



         ],
       )
    );
  }
}
