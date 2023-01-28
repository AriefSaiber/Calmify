import 'package:flutter/material.dart';
import 'package:Calmify/widgets/albumview.dart';

class AlbumCard extends StatelessWidget {
  final ImageProvider image;
  final String label;
  final int counter;
  final Function? onTap;
  final double size;
  const AlbumCard({
    Key? key,
    required this.image,
    required this.label,
    required this.counter,
    this.onTap,
    this.size = 120,
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
            width: size,
            height: size,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 15),
          Text(
            label,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
