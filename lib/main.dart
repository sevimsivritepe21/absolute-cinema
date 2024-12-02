// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import

import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'news_tab.dart';
import 'login_try.dart';
import 'register_try.dart';
import 'holder_sidebar.dart';


import 'movie_list.dart';
import 'homepage.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized(); // Bu satır, framework'ün başlatılmasını garanti eder
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Absolute Cinema',
      home: MyHomePage(title: 'Absolute Cinema'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}



class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {
  late TabController _tabController; // null olamaz, sonradan başlatılacak

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this); // TabController burada başlatılıyor
  }

  @override
  void dispose() {
    _tabController.dispose(); // bellek sızıntılarını önler
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 56, 41, 33),
        iconTheme: IconThemeData( 
           color: Color.fromARGB(255, 218, 212, 181),),
       

        title: Text(
          'ABSOLUTE CINEMA',
          style: GoogleFonts.silkscreen(fontSize: 19, fontWeight: FontWeight.bold, textStyle: TextStyle(color: Color.fromARGB(255, 218, 212, 181))),
      
        ),
        centerTitle: true,

        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: Icon(Icons.menu, size: 30,),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
      

        actions: <Widget> [ IconButton(
          icon: Icon(Icons.search, size: 30,),
          onPressed: () {
            // search butonuna tıklandığında yapılacak işlemler
          },
        ),
        ],

        bottom: TabBar(
          controller: _tabController, // TabController burada kullanılıyor
          tabs: [

            Tab(
              child: Text(
                "Home",
                style: GoogleFonts.silkscreen(
                  textStyle: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 218, 212, 181)),
                ),
              ),
            ),

            Tab(
              child: Text(
                "Lists",
                style: GoogleFonts.silkscreen(
                  textStyle: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 218, 212, 181)),
                ),
              ),
            ),

            Tab(
              child: Text(
                "News",
                style: GoogleFonts.silkscreen(
                  textStyle: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 218, 212, 181)),
                ),
              ),
            ),
          ],

          indicator: BoxDecoration(
            border: Border(
              bottom: BorderSide(color: Color.fromARGB(255, 218, 212, 181), width: 3), // Çizgi rengi ve kalınlığı
            ),
          ),
        ),
      ),



//    YAN MENUUUUU START, farklı dosyaya taşınacak
//    YAN MENUUUUU
drawer: Drawer(
  backgroundColor: Color.fromRGBO(25, 23, 23, 0.95),
  child: Builder( // Burada Builder kullanarak context oluşturuyoruz
    builder: (context) => ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[

        DrawerHeader(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/for_menu1.gif'),
              fit: BoxFit.cover, 
            ),
          ),
          child: Center( // Yazıyı ortalamak için Center widget'ı kullandık
            child: Text(
              ' ',
              style: GoogleFonts.oswald(
                textStyle: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 218, 212, 181),
                ),
              ),
            ),
          ),
        ),

        ListTile(
          contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 80.0), // Dikey ve yatayda boşluk
          leading: Icon(Icons.co_present_sharp, color: Color.fromARGB(255, 218, 212, 181), size: 17),
          title: Center( // Yazıyı yatayda ortalamak için Center widget'ı
            child: Text(
              'Sign In',
              style: GoogleFonts.silkscreen(
                textStyle: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 218, 212, 181)),
              ),
            ),
          ),



              onTap: () {
                Navigator.pop(context); // Drawer'ı kapatmak için
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => loginPage()),
                );
              },



        ),

        ListTile(
          contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 80.0), // Dikey ve yatayda boşluk
          leading: Icon(Icons.group_add_sharp, color: Color.fromARGB(255, 218, 212, 181), size: 17),
          title: Center( // Yazıyı yatayda ortalamak için Center widget'ı
            child: Text(
              'Register',
              style: GoogleFonts.silkscreen(
                textStyle: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 218, 212, 181)),
              ),
            ),
          ),



              onTap: () {
                Navigator.pop(context); // Drawer'ı kapatmak için
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => registerPage()),
                );
              },

          
        ),




        ListTile(
          contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 80.0), // Dikey ve yatayda boşluk
          leading: Icon(Icons.web_stories_rounded, color: Color.fromARGB(255, 218, 212, 181), size: 17),
          title: Center( // Yazıyı yatayda ortalamak için Center widget'ı
            child: Text(
              'Lists',
              style: GoogleFonts.silkscreen(
                textStyle: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 218, 212, 181)),
              ),
            ),
          ),


              onTap: () {
                Navigator.pop(context); // Drawer'ı kapatmak için
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MovieList()),
                );
              },


        ),
      ],
    ),
  ),
),



//  TAB İÇERİKLERİ BURAYA YAZILACAAAKK!!!!!
body: TabBarView(
  controller: _tabController,
  children: [
    main_Homepage(),
    MovieList(),
    MovieNewsPage(),
  ],
),


    );
  }
} 

