// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'tmdb_service.dart'; // API servis dosyanız
import 'in_movie_list.dart';

class MovieListCopy extends StatefulWidget {
  @override
  
  _MovieListCopyState createState() => _MovieListCopyState();
}

class _MovieListCopyState extends State<MovieListCopy> {
  final TmdbService _tmdbService = TmdbService();
  late Future<Map<String, dynamic>> _popularMoviesFuture;
  late Future<Map<String, dynamic>> _listimdbFuture;
  late Future<Map<String, dynamic>> _listHorrorFuture;
  late Future<Map<String, dynamic>> _listCreatorFuture;
  late Future<Map<String, dynamic>> _listMustWatchFuture;
  late Future<Map<String, dynamic>> _listStopMotionFuture;
  late Future<Map<String, dynamic>> _listSciFiFuture;
  late Future<Map<String, dynamic>> _listRomanceFuture;
  late Future<Map<String, dynamic>> _listFunWatchFuture;
  late Future<Map<String, dynamic>> _listWeirdFuture;
  late Future<Map<String, dynamic>> _listHistoryFuture;
  late Future<Map<String, dynamic>> _listSaddestFuture;
  late Future<Map<String, dynamic>> _listCrimeFuture;
  late Future<Map<String, dynamic>> _listSuperheroFuture;
  late Future<Map<String, dynamic>> _listSeriesFuture;

  late TabController _tabController; // null olamaz, sonradan başlatılacak

  @override
  void dispose() {
    _tabController.dispose(); // bellek sızıntılarını önler
    super.dispose();
  }


  @override
  void initState() {
    super.initState();
    _popularMoviesFuture = _tmdbService.fetchMoviesByCategory('popular');
    _listHorrorFuture = _tmdbService.fetchList(8461376);
    _listimdbFuture = _tmdbService.fetchList(634);
    _listCreatorFuture = _tmdbService.fetchList(8461713);
    _listMustWatchFuture = _tmdbService.fetchList(108687);
    _listStopMotionFuture = _tmdbService.fetchList(7077738); 
    _listSciFiFuture = _tmdbService.fetchList(25653);
    _listRomanceFuture = _tmdbService.fetchList(8461975);
    _listFunWatchFuture = _tmdbService.fetchList(8461978);
    _listWeirdFuture = _tmdbService.fetchList(8462040);
    _listHistoryFuture = _tmdbService.fetchList(8462048);
    _listSaddestFuture = _tmdbService.fetchList(8462157);
    _listCrimeFuture = _tmdbService.fetchList(8462389);
    _listSuperheroFuture = _tmdbService.fetchList(8462490);
    _listSeriesFuture = _tmdbService.fetchList(8462046);

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


      backgroundColor: Color.fromARGB(255, 43, 31, 25),
      body: SingleChildScrollView(
        child: Column(
          children: [

            
            //  POPULAR
            FutureBuilder<Map<String, dynamic>>(
              future: _popularMoviesFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Bir hata oluştu: ${snapshot.error}'));
                } else {
                  final movies = snapshot.data?['results'] as List<dynamic>?;
                  if (movies == null || movies.isEmpty) {
                    return Center(child: Text('Film bulunamadı.'));
                  }
                  return buildCategorySection(" popular this week!!", movies, context, 0);
                }
              },
            ),




            SizedBox(height: 10),




              //    IMDB
            FutureBuilder<Map<String, dynamic>>(
              future: _listimdbFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Bir hata oluştu: ${snapshot.error}'));
                } else {
                  final movies = snapshot.data?['items'] as List<dynamic>?; // 'results' yerine 'items' kullan
                  if (movies == null || movies.isEmpty) {
                    return Center(child: Text('Film bulunamadı.'));
                  }
                  return buildCategorySection(" imdb top 250", movies, context, 634);
                }
              },
            ),




          
            SizedBox(height: 10),




            //  MY FAVORITES
            FutureBuilder<Map<String, dynamic>>(
              future: _listCreatorFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Bir hata oluştu: ${snapshot.error}'));
                } else {
                  final movies = snapshot.data?['items'] as List<dynamic>?; // 'results' yerine 'items' kullan
                  if (movies == null || movies.isEmpty) {
                    return Center(child: Text('Film bulunamadı.'));
                  }
                  return buildCategorySection(" ★ creator's favorites", movies, context, 8461713);
                }
              },
            ),




            SizedBox(height: 10),




              //  HORROR
            FutureBuilder<Map<String, dynamic>>(
              future: _listHorrorFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Bir hata oluştu: ${snapshot.error}'));
                } else {
                  final movies = snapshot.data?['items'] as List<dynamic>?; // 'results' yerine 'items' kullan
                  if (movies == null || movies.isEmpty) {
                    return Center(child: Text('Film bulunamadı.'));
                  }
                  return buildCategorySection("boo! spoookky!!!", movies, context, 8461376);
                }
              },
            ),




            SizedBox(height: 10),



              //  MUST WATCH
            FutureBuilder<Map<String, dynamic>>(
              future: _listMustWatchFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Bir hata oluştu: ${snapshot.error}'));
                } else {
                  final movies = snapshot.data?['items'] as List<dynamic>?; // 'results' yerine 'items' kullan
                  if (movies == null || movies.isEmpty) {
                    return Center(child: Text('Film bulunamadı.'));
                  }
                  return buildCategorySection(" must watch", movies, context, 108687);
                }
              },
            ),




            SizedBox(height: 10),



              //  STOP MOTION
            FutureBuilder<Map<String, dynamic>>(
              future: _listStopMotionFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Bir hata oluştu: ${snapshot.error}'));
                } else {
                  final movies = snapshot.data?['items'] as List<dynamic>?; // 'results' yerine 'items' kullan
                  if (movies == null || movies.isEmpty) {
                    return Center(child: Text('Film bulunamadı.'));
                  }
                  return buildCategorySection(" stop motion animation", movies, context, 7077738);
                }
              },
            ),



            
            SizedBox(height: 10),




              //  SCI-FI
            FutureBuilder<Map<String, dynamic>>(
              future: _listSciFiFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Bir hata oluştu: ${snapshot.error}'));
                } else {
                  final movies = snapshot.data?['items'] as List<dynamic>?; // 'results' yerine 'items' kullan
                  if (movies == null || movies.isEmpty) {
                    return Center(child: Text('Film bulunamadı.'));
                  }
                  return buildCategorySection(" glimpse of future", movies, context, 25653);
                }
              },
            ),
            



            SizedBox(height: 10),



            //  ROMANCE
            FutureBuilder<Map<String, dynamic>>(
              future: _listRomanceFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Bir hata oluştu: ${snapshot.error}'));
                } else {
                  final movies = snapshot.data?['items'] as List<dynamic>?; // 'results' yerine 'items' kullan
                  if (movies == null || movies.isEmpty) {
                    return Center(child: Text('Film bulunamadı.'));
                  }
                  return buildCategorySection(" mon amour", movies, context, 8461975);
                }
              },
            ),



            SizedBox(height: 10),



            //  WEIRD
            FutureBuilder<Map<String, dynamic>>(
              future: _listWeirdFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Bir hata oluştu: ${snapshot.error}'));
                } else {
                  final movies = snapshot.data?['items'] as List<dynamic>?; // 'results' yerine 'items' kullan
                  if (movies == null || movies.isEmpty) {
                    return Center(child: Text('Film bulunamadı.'));
                  }
                  return buildCategorySection(" weird and tough", movies, context, 8462040);
                }
              },
            ),



            SizedBox(height: 10),



            //  FUN
            FutureBuilder<Map<String, dynamic>>(
              future: _listFunWatchFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Bir hata oluştu: ${snapshot.error}'));
                } else {
                  final movies = snapshot.data?['items'] as List<dynamic>?; // 'results' yerine 'items' kullan
                  if (movies == null || movies.isEmpty) {
                    return Center(child: Text('Film bulunamadı.'));
                  }
                  return buildCategorySection(" fun watch", movies, context, 8461978);
                }
              },
            ),




            SizedBox(height: 10),



            //  HISTORY
            FutureBuilder<Map<String, dynamic>>(
              future: _listHistoryFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Bir hata oluştu: ${snapshot.error}'));
                } else {
                  final movies = snapshot.data?['items'] as List<dynamic>?; // 'results' yerine 'items' kullan
                  if (movies == null || movies.isEmpty) {
                    return Center(child: Text('Film bulunamadı.'));
                  }
                  return buildCategorySection(" history was made", movies, context, 8462048);
                }
              },
            ),




            SizedBox(height: 10),



            //  SADDEST
            FutureBuilder<Map<String, dynamic>>(
              future: _listSaddestFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Bir hata oluştu: ${snapshot.error}'));
                } else {
                  final movies = snapshot.data?['items'] as List<dynamic>?; // 'results' yerine 'items' kullan
                  if (movies == null || movies.isEmpty) {
                    return Center(child: Text('Film bulunamadı.'));
                  }
                  return buildCategorySection(" for a good cry", movies, context, 8462157);
                }
              },
            ),



            SizedBox(height: 10),



            //  CRIME
            FutureBuilder<Map<String, dynamic>>(
              future: _listCrimeFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Bir hata oluştu: ${snapshot.error}'));
                } else {
                  final movies = snapshot.data?['items'] as List<dynamic>?; // 'results' yerine 'items' kullan
                  if (movies == null || movies.isEmpty) {
                    return Center(child: Text('Film bulunamadı.'));
                  }
                  return buildCategorySection(" crime genre", movies,context, 8462389);
                }
              },
            ),


            
            SizedBox(height: 10),



            //  COMIC
            FutureBuilder<Map<String, dynamic>>(
              future: _listSuperheroFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Bir hata oluştu: ${snapshot.error}'));
                } else {
                  final movies = snapshot.data?['items'] as List<dynamic>?; // 'results' yerine 'items' kullan
                  if (movies == null || movies.isEmpty) {
                    return Center(child: Text('Film bulunamadı.'));
                  }
                  return buildCategorySection(" superhero classics", movies, context, 8462490);
                }
              },
            ),


    
            SizedBox(height: 10),



            //  SERIES
            FutureBuilder<Map<String, dynamic>>(
              future: _listSeriesFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Bir hata oluştu: ${snapshot.error}'));
                } else {
                  final movies = snapshot.data?['items'] as List<dynamic>?; // 'results' yerine 'items' kullan
                  if (movies == null || movies.isEmpty) {
                    return Center(child: Text('Film bulunamadı.'));
                  }
                  return buildCategorySection(" best movie series", movies, context, 8462046);
                }
              },
            ),




          ],
        ),
      ),
    );
  }

Widget buildCategorySection(String title, List<dynamic> movies, BuildContext context, int listId) {
  return Container(
    height: 190,
    width: double.infinity,
    color: Color.fromARGB(255, 232, 208, 179),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(padding: EdgeInsets.only(left: 1)),
            Text(
              title,
              style: GoogleFonts.tiltWarp(
                color: Color.fromARGB(255, 67, 47, 37),
              ),
            ),
            Padding(padding: EdgeInsets.only(left: 10)),
            Icon(
              Icons.arrow_right_rounded,
              size: 27,
              color: Color.fromARGB(255, 67, 47, 37),
            ),
          ],
        ),
        Container(
          padding: EdgeInsets.only(bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(
              4,
              (index) {
                final movie = movies[index];
                final posterPath = movie['poster_path'];
                final imageUrl = posterPath != null
                    ? 'https://image.tmdb.org/t/p/w500$posterPath'
                    : null;

                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MoviesListPage(listId: listId, title: title),
                      ),
                    );
                  },
                  child: imageUrl != null
                      ? Image.network(
                          imageUrl,
                          width: 95,
                          height: 140,
                          fit: BoxFit.cover,
                        )
                      : SizedBox(
                          width: 100,
                          height: 110,
                          child: Icon(Icons.image_not_supported),
                        ),
                );
              },
            ),
          ),
        ),
      ],
    ),
  );
}

}
