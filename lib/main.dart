import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:html/parser.dart' as htmlparser;
import 'package:html/dom.dart' as dom;
import 'package:mantech/news_list.dart';
import 'package:mantech/pages/detail_page.dart';
import 'package:mantech/pages/home_page.dart';
import 'package:mantech/services/api.dart';
import 'package:mantech/services/categories_api.dart';
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
      home: const MyHomePage(title: 'Chambal Sandesh'),
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
  double SECTION_HEIGHT=50;


  int index=1;
  Widget func(int i,BuildContext context,double appBar_height)
  {
    print(i);
   return Container(

        height:MediaQuery.of(context).size.height-appBar_height-SECTION_HEIGHT-20,
        child: Home(index: i));
  }
  @override
  Widget build(BuildContext context) {

          AppBar appBar=AppBar(
            toolbarTextStyle: TextStyle(color: Colors.black),
            iconTheme: IconThemeData(color: Colors.black),
            actionsIconTheme: IconThemeData(color: Colors.black),
            backgroundColor: Colors.white,

            title: Text(
                "Chambal Sandesh", style: TextStyle(color: Colors.black)),
          );
          List pages=[
            for(var i = 1; i <= SECTIONS.length; i++)
              Container(

                  height:MediaQuery.of(context).size.height-appBar.preferredSize.height-SECTION_HEIGHT-20,
                  child: Home(index: i))
          ];
          return Scaffold(
              appBar: appBar,
              drawer: Drawer(

                child: ListView(
                  children: [
                    UserAccountsDrawerHeader(


                      accountName: Text("Name"),
                      accountEmail: Text("Email"),


                    ),
                    ListTile(title: Text("SETTINGS")),
                    TextButton(onPressed: () async {

                    }, child: Text("Light mode")),
                    TextButton(onPressed: () {}, child: Text("Notifications")),
                    Divider(
                      height: 10,
                      thickness: 2,
                      color: Colors.black,
                    ),
                    ListTile(title: Text("LATEST FEATURES")),
                    TextButton(onPressed: () {}, child: Text("Learn more")),
                    Divider(
                      height: 10,
                      thickness: 2,
                      color: Colors.black,
                    ),
                    TextButton(onPressed: () {}, child: Text("About us")),
                    TextButton(onPressed: () {}, child: Text("Disclaimer")),
                  ],
                ),
              ),
              body: ListView(
                children: [

                  pages[index-1],
                  //func(index,context,appBar.preferredSize.height),


                ],
              )
          );
        }
      }




