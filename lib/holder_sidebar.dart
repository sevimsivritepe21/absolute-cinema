// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class holderPape extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      body: Center(
        child: Text(
          'placeHolder!',
          style: GoogleFonts.silkscreen(fontSize: 40, color: const Color.fromARGB(255, 92, 111, 219), fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
