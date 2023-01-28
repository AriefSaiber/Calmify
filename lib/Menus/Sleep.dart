import 'package:flutter/material.dart';
import 'package:Calmify/widgets/bedtime_view.dart';

class SleepPage extends StatefulWidget {
  final VoidCallback showHomePage;
  const SleepPage({
    Key? key,
    required this.showHomePage,
  }) : super(key: key);

  @override
  State<SleepPage> createState() => _SleepPageState();
}

class _SleepPageState extends State<SleepPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //toolbar
      //backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Bedtime Story',
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
                      "Latest Hot",
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    physics: BouncingScrollPhysics(),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    child: Row(children: [
                      AlbumCard(
                        label: "Top 50 - Global",
                        image: AssetImage("assets/album1.jpg"),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      AlbumCard(
                        label: "Top 50 - Global",
                        image: AssetImage("assets/album2.jpg"),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      AlbumCard(
                        label: "Top 50 - Global",
                        image: AssetImage("assets/album3.jpg"),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      AlbumCard(
                        label: "Top 50 - Global",
                        image: AssetImage("assets/album4.jpg"),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      AlbumCard(
                        label: "Top 50 - Global",
                        image: AssetImage("assets/album5.jpg"),
                      ),
                    ]),
                  ),

                  //second song column
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                    child: Text(
                      "Latest Hot",
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    physics: BouncingScrollPhysics(),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    child: Row(children: [
                      AlbumCard(
                        label: "Top 50 - Global",
                        image: AssetImage("assets/album1.jpg"),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      AlbumCard(
                        label: "Top 50 - Global",
                        image: AssetImage("assets/album2.jpg"),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      AlbumCard(
                        label: "Top 50 - Global",
                        image: AssetImage("assets/album3.jpg"),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      AlbumCard(
                        label: "Top 50 - Global",
                        image: AssetImage("assets/album4.jpg"),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      AlbumCard(
                        label: "Top 50 - Global",
                        image: AssetImage("assets/album5.jpg"),
                        key: null,
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
                      "Latest Hot",
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    physics: BouncingScrollPhysics(),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    child: Row(children: [
                      AlbumCard(
                        label: "Top 50 - Global",
                        image: AssetImage("assets/album1.jpg"),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      AlbumCard(
                        label: "Top 50 - Global",
                        image: AssetImage("assets/album2.jpg"),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      AlbumCard(
                        label: "Top 50 - Global",
                        image: AssetImage("assets/album3.jpg"),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      AlbumCard(
                        label: "Top 50 - Global",
                        image: AssetImage("assets/album4.jpg"),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      AlbumCard(
                        label: "Top 50 - Global",
                        image: AssetImage("assets/album5.jpg"),
                        key: null,
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

  const AlbumCard({
    Key? key,
    required this.image,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SleepView(
              image: image,
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
