// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class registerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 42, 31, 26),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [


                // stack olmalı öbür türlü appbar eklenmek durumunda
                Stack(
                  children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 0),
                      child: ShaderMask(
                        shaderCallback: (bounds) {
                          return LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.white, // Üst kısım tamamen opak
                              Colors.transparent, // Alt kısım tamamen transparan
                            ],
                            stops: [0.45, 1.0], // Degrade aralığı
                          ).createShader(bounds);
                        },
                        blendMode: BlendMode.dstIn, // Görüntüyü degrade ile birleştir
                        child: Image.asset(
                          'assets/aa.jpg',
                          width: 450,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                  
                    // Geri Dönme İkonu
                    Positioned(
                      top: 30,
                      left: 10,
                      child: IconButton(
                        icon: Icon(Icons.arrow_back, color: Color.fromARGB(255, 232, 208, 179)),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ],
                ),


                
                SizedBox(height: 10),


                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextField(
                    cursorColor: Color.fromARGB(255, 85, 60, 47),
                    decoration: InputDecoration(
                      labelText: 'Email Address',
                      labelStyle: TextStyle(color: Color.fromARGB(255, 232, 208, 179)),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 232, 208, 179),
                          width: 1.5,
                        ),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color.fromARGB(255, 85, 60, 47), width: 3),
                      ),
                      isDense: true,
                      contentPadding: EdgeInsets.symmetric(horizontal: 10),
                    ),
                    style: TextStyle(color: Colors.white),
                  ),
                ),


                SizedBox(height: 25),
                
                

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextField(
                    cursorColor: Color.fromARGB(255, 85, 60, 47),
                    decoration: InputDecoration(
                      labelText: 'Username',
                      labelStyle: TextStyle(color: Color.fromARGB(255, 232, 208, 179)),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 232, 208, 179),
                          width: 1.5,
                        ),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color.fromARGB(255, 85, 60, 47), width: 3),
                      ),
                      isDense: true,
                      contentPadding: EdgeInsets.symmetric(horizontal: 10),
                    ),
                    style: TextStyle(color: Colors.white),
                  ),
                ),


                SizedBox(height: 25),
                
                

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextField(
                    cursorColor: const Color.fromARGB(255, 85, 60, 47),
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      labelStyle: TextStyle(color: Color.fromARGB(255, 232, 208, 179)),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 232, 208, 179),
                          width: 1.5,
                        ),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: const Color.fromARGB(255, 85, 60, 47), width: 2),
                      ),
                      isDense: true,
                      contentPadding: EdgeInsets.symmetric(horizontal: 10),
                    ),
                    style: TextStyle(color: Colors.white),
                  ),
                ),


                SizedBox(height: 35),
                
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [


                    ElevatedButton(
                      onPressed: () {
                        // registerPage'e yönlendirecek
                      },
                      child: Text(
                        "Login",
                        style: GoogleFonts.silkscreen(fontSize: 12, fontWeight: FontWeight.bold),
                      ),
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Color.fromARGB(255, 232, 208, 179),
                        backgroundColor: Color.fromARGB(255, 85, 60, 47),

                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                    ),


                    ElevatedButton(
                      onPressed: () {
                        // main'e gidecek
                      },
                      child: Text(
                        "Let's Start!!",
                        style: GoogleFonts.silkscreen(fontSize: 12, fontWeight: FontWeight.bold),
                      ),
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Color.fromARGB(255, 232, 208, 179),
                        backgroundColor: Color.fromARGB(255, 85, 60, 47),
                         // Buton kenar rengi ve genişliği
                         //side: BorderSide(
                         // width: 2.1,
                         // color: Color.fromARGB(255, 146, 81, 77),
                         //),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6), 
                        ),
                      ),
                    ),
                  ],

                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
