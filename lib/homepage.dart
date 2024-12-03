// ignore_for_file: prefer_const_constructors, unused_import

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'in_movie_list.dart';

class main_Homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context){
      return Center(
        child: Container(
          color: Color.fromARGB(255, 18, 17, 17), 

          padding: EdgeInsets.only(top: 70.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,

            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  
                  Image(image: AssetImage("assets/saw.webp"),
                        height: 170,
                        width: 170,),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 25, right: 8),
                    child: IconButton(
                      icon: Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                        size: 25,
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context)=>MoviesListPage(listId: 8461376, title: "boo! spoookky!!!"),),
                        );
                      },
                    ),
                  ),
                ],

              ),


            
              Container(
                margin: EdgeInsets.only(top: 5),
                height: 150,

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly, 
                  children: [
                    
                    // the shining
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white, width: 0.3), 
                      ),
                      child: Image.network(
                        'https://www.tallengestore.com/cdn/shop/products/TheShining-JackNicholson-StanleyKubrickClassicHorrorMovie-FanArtPoster-HollywoodEnglishMovieArtPoster_205fc2f3-fc8c-4db3-8dc1-5051e8bffdf5.jpg?v=1634645699',
                        width: 90,
                        height: 130,
                      ),
                    ),

                      // jacob's ladder
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white, width: 0.3),
                        ),
                        child: Image.network(
                          'https://cdn11.bigcommerce.com/s-yzgoj/images/stencil/1280x1280/products/2905793/5947222/MOVCJ9676__06653.1679592701.jpg?c=2',
                          width: 90,
                          height: 130,
                        ),
                      ),

                      // the house that jack built
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white, width: 0.3),
                        ),
                        child: Image.network(
                          'https://image.tmdb.org/t/p/original/nGFlm65qjpIi2l3ltFhO4sH7dW5.jpg',
                          width: 86,
                          height: 130,
                        ),
                      ),

                      // the babadook
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white, width: 0.3),
                        ),
                        child: Image.network(
                          'https://m.media-amazon.com/images/M/MV5BMTk0NzMzODc2NF5BMl5BanBnXkFtZTgwOTYzNTM1MzE@._V1_.jpg',
                          width: 88,
                          height: 130,
                        ),
                      ),
                    ],
                    
                    
                ),

                
              )

            ],    
            
          ),
        ),
        
      );
  }
}
