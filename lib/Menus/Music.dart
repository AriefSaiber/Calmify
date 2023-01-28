import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:Calmify/widgets/albumview.dart';

class MusicPage extends StatefulWidget {
  final VoidCallback showHomePage;
  const MusicPage({
    Key? key,
    required this.showHomePage,
  }) : super(key: key);

  @override
  State<MusicPage> createState() => _MusicPageState();
}

class _MusicPageState extends State<MusicPage> {
  @override
  Widget build(BuildContext context) {
    int counter = 1;

    return Scaffold(
      //toolbar
      //backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Music',
        ),
        centerTitle: true,
      ),

      body: Stack(
        alignment: Alignment.topLeft,
        children: [
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.blue,
                Color.fromARGB(255, 174, 219, 255),
              ],
            )),
          ),
          SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: SafeArea(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 30,
                  ),

                  //first song column
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                    child: Text(
                      "Classical Music",
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ),
                  //classical music
                  //Beethoven - Fur Elise
                  //Beethoven - Moonlight Sonata
                  //Beethoven – Sonata No.17
                  //Tchaikovsky - Swan Lake Theme
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    physics: BouncingScrollPhysics(),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    child: Row(children: [
                      AlbumCard(
                        label: "Fur Elise",
                        image: AssetImage("assets/album1.jpg"),
                        counter: counter,
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      AlbumCard(
                        label: "Moonlight Sonata",
                        image: AssetImage("assets/album2.jpg"),
                        counter: counter + 1,
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      AlbumCard(
                        label: "Sonata No.17 ",
                        image: AssetImage("assets/album3.jpg"),
                        counter: counter + 2,
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      AlbumCard(
                        label: "Swan Lake",
                        image: AssetImage("assets/album4.jpg"),
                        counter: counter + 3,
                      ),
                      SizedBox(
                        width: 16,
                      ),
                    ]),
                  ),

                  //Soul Songs
                  // Make it real - wildson
                  // Still missing U - Katnip
                  //This Love of Mine - L.M Styles
                  //Better Place - Spring Gang
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                    child: Text(
                      "Soul Songs",
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    physics: BouncingScrollPhysics(),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    child: Row(children: [
                      AlbumCard(
                        label: "Make it real",
                        image: AssetImage("assets/album5.jpg"),
                        counter: counter + 4,
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      AlbumCard(
                        label: "Still missing U",
                        image: AssetImage("assets/album6.jpg"),
                        counter: counter + 5,
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      AlbumCard(
                        label: "Better Place",
                        image: AssetImage("assets/album7.jpg"),
                        counter: counter + 6,
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      AlbumCard(
                        label: "This Love of Mine",
                        image: AssetImage("assets/album8.jpg"),
                        counter: counter + 7,
                      ),
                    ]),
                  ),

                  //thrid song column
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                    child: Text(
                      "Al-Quran",
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ),

                  // Mishary bin Rashid Alafasy - Al-Maun
                  // Mishary bin Rashid Alafasy - Almulk
                  // Mishary bin Rashid Alafasy - Alfatihah
                  // Mishary bin Rashid Alafasy - Alkafirun
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    physics: BouncingScrollPhysics(),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    child: Row(children: [
                      AlbumCard(
                        label: "Al-Ma'un",
                        image: AssetImage("assets/Quran.jpg"),
                        counter: counter + 8,
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      AlbumCard(
                        label: "Al-Mulk",
                        image: AssetImage("assets/Quran.jpg"),
                        counter: counter + 9,
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      AlbumCard(
                        label: "Al-Fatihah",
                        image: AssetImage("assets/Quran.jpg"),
                        counter: counter + 10,
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      AlbumCard(
                        label: "Al-Kafirun",
                        image: AssetImage("assets/Quran.jpg"),
                        key: null,
                        counter: counter + 11,
                      ),
                    ]),
                  )
                ],
              )))
        ],
      ),
    );
  }
}

class AlbumCard extends StatelessWidget {
  final ImageProvider image;
  final String label;
  final int counter;

  const AlbumCard({
    Key? key,
    required this.image,
    required this.label,
    required this.counter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AlbumView(
              image: image,
              counter: counter,
            ),
          ),
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image(
            image: image,
            width: 100,
            height: 100,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 10),
          Text(label),
        ],
      ),
    );
  }
}
