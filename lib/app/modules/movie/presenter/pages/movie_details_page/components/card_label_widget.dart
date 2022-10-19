import 'package:flutter/material.dart';

class MovieCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = 140;
    return Card(
      color: Colors.transparent,
      elevation: 0,
      child: Row(
        children: <Widget>[
          Container(
            height: height,
            child: Image.network(
                'https://image.tmdb.org/t/p/w500/yJdeWaVXa2se9agI6B4mQunVYkB.jpg'),
          ),
          Expanded(
            // Add from this line
            child: Container(
              // color: Colors.red,
              height: height,
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: const [
                      Expanded(
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Icon(Icons.check_circle),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: const [
                      Text(
                        'Ip Man 4: The Finale',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Expanded(child: Text('1990 Drama, Fantasy'))
                ],
              ),
            ),
          ) // To this line
        ],
      ),
    );
  }
}
