import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:html/parser.dart' as htmlparser;
import 'package:html/dom.dart' as dom;
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
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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

  String htmlData="";
  String db="db"; //Enter your database name here
  String pwd="Adith"; //Enter your password here
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("News"),
      ),
       body: ListView(
         children: [
           Html(
             data:"""<strong>नई दिल्ली</strong>
पीएम नरेंद्र मोदी ने रविवार को कहा कि वह भारत को दुनिया का सबसे अच्छा निवेश ठिकाना बनाने में कोई कसर नहीं छोड़ेंगे। उन्होंने कहा कि भारत बिजनस के लिए एक बेहतर जगह होगी और लोगों में जोश भरने के साथ-साथ पूरे प्राइवेट सेक्टर में तेजी लाने के लिए वह हर संभव कोशिश करेंगे। पीएम मोदी ने विदेशी निवेश, निर्यात, ऑटोमोबाइल सेक्टर के रिवाइवल, डेटा प्रोटेक्शन और जम्मू-कश्मीर में आर्टिकल 370 हटाने के बाद वहां बन रहे अवसरों के बारे पर हमारे सहयोगी इकनॉमिक टाइम्स से बातचीत की।
<strong>सिद्ध उद्यमी जम्मू-कश्मीर में करना चाहते हैं निवेश</strong>
पीएम मोदी ने कहा, ‘सिर्फ देश के लोगों को भारत से उम्मीद नहीं है, वैश्विक ग्रोथ और विकास के संदर्भ में भी हमसे काफी आशाएं हैं।’ दुनिया को भारत से जो उम्मीद है, मोदी उसे पूरा करेंगे। प्रधानमंत्री यह सुनिश्चित करेंगे कि विकास की जो क्षमता भारत में है, वह हासिल हो। मोदी ने कहा कि अनुच्छेद 370 पर लिए गए हालिया फैसले के बाद जाने-माने उद्यमियों ने जम्मू-कश्मीर में निवेश करने में रुचि दिखाई है। उन्होंने कहा कि ‘क्लोज्ड एनवायरमेंट’ में आर्थिक विकास संभव नहीं है और इंटीग्रेशन से निवेश, इनोवेशन और आमदनी बढ़ेगी। भारत ने पिछले हफ्ते जम्मू-कश्मीर को विशेष दर्जा देने वाले अनुच्छेद 370 को वापस लेने के साथ उसे दो केंद्र शासित प्रदेशों में बांटने का फैसला लिया था।
<strong>बड़े पैमाने पर रोजगार के मौके बनाना चाहती है सरकार</strong>
मोदी ने कहा, ‘कश्मीर में पर्यटन, कृषि, आईटी, स्वास्थ्य सेवाओं जैसे कई क्षेत्रों में निवेश की अपार संभावनाएं हैं। इससे ऐसा माहौल बनेगा, जिसमें क्षेत्र के लोगों को हुनर, कड़ी मेहनत का इनाम और सामान की सही कीमत मिलेगी।’"""
           ),
           ElevatedButton(
               onPressed: () async
           {
             try {
               final conn = await MySqlConnection.connect(ConnectionSettings(
                   host: 'localhost',
                   port: 3306,
                   user: 'root',
                   db: db,
                   password: pwd));
               print("Connected");
               await conn.query("CREATE TABLE table_1");

             }
             catch(e)
             {
               print(e.toString());
             }
           }, child: Text("Connect"))
         ],
       )
    );
  }
}
