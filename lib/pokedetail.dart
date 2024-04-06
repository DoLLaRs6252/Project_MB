import 'package:flutter/material.dart';

class PokemonDetailScreen extends StatelessWidget {
  final Map<String, dynamic> pokemon;

  PokemonDetailScreen({required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pokemon['name']),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Name: ${pokemon['name']}',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 10),
            Text(
              'Type 1: ${pokemon['type1']}',
              style: TextStyle(fontSize: 18),
            ),
            if (pokemon['type2'].isNotEmpty)
              Text(
                'Type 2: ${pokemon['type2']}',
                style: TextStyle(fontSize: 18),
              ),
            SizedBox(height: 10),
            Text(
              'HP: ${pokemon['hp']}',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'Attack: ${pokemon['attack']}',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'Defense: ${pokemon['defense']}',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'Special Attack: ${pokemon['specialAttack']}',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'Special Defense: ${pokemon['specialDefense']}',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'Speed: ${pokemon['speed']}',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
