import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:project/pokedetail.dart';

class PokeListPage extends StatefulWidget {
  @override
  PokeListPageState createState() => PokeListPageState();
}

class PokeListPageState extends State<PokeListPage> {
  List<Map<String, dynamic>> _pokemonList = [];

  @override
  void initState() {
    super.initState();
    fetchAllPokemonData();
  }

  Future<void> fetchAllPokemonData() async {
    for (int i = 1; i <= 300; i++) {
      final response =
          await http.get(Uri.parse('https://pokeapi.co/api/v2/pokemon/$i/'));
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        setState(() {
          _pokemonList.add({
            'name': jsonData['name'],
            'type1': jsonData['types'][0]['type']['name'],
            'type2': jsonData['types'].length > 1
                ? jsonData['types'][1]['type']['name']
                : '',
            'front_shinyimageUrl': jsonData['sprites']['other']['official-artwork']
                ['front_shiny'],
            'frontimageUrl': jsonData['sprites']['other']['official-artwork']
                ['front_default'],
            'id': jsonData['id'],
            'height': (jsonData['height'] * 10).toString() + ' Cm',
            'weight':
                (jsonData['weight'] / 10 * 2.20462).toStringAsFixed(2) + ' lbs',
            'abilities': jsonData['abilities'][0]['ability']['name'],
            'hp': jsonData['stats'][0]['base_stat'],
            'attack': jsonData['stats'][1]['base_stat'],
            'defense': jsonData['stats'][2]['base_stat'],
            'specialAttack': jsonData['stats'][3]['base_stat'],
            'specialDefense': jsonData['stats'][4]['base_stat'],
            'speed': jsonData['stats'][5]['base_stat'],
          });
        });
      } else {
        throw Exception('Failed to load Pokemon data');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PokeDex'),
      ),
      backgroundColor: Color.fromARGB(255, 181, 181, 181),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/BG_pattern.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 100.0),
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: 4.0,
              mainAxisSpacing: 4.0,
            ),
            itemCount: _pokemonList.length,
            itemBuilder: (context, index) {
              final pokemon = _pokemonList[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          PokemonDetailScreen(pokemon: pokemon),
                    ),
                  );
                },
                child: Card(
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  color: Color.fromARGB(255, 255, 255, 255),
                  child: Column(
                    children: [
                      Expanded(
                        child: pokemon['frontimageUrl'].isNotEmpty
                            ? Container(
                                margin: EdgeInsets.fromLTRB(24, 24, 24, 0),
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 210, 210, 210),
                                  borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(8.0),
                                    bottom: Radius.circular(8.0),
                                  ),
                                ),
                                height: 150,
                                width: 300,
                                child: Image.network(
                                  pokemon['frontimageUrl'],
                                  fit: BoxFit.fill,
                                ),
                              )
                            : CircularProgressIndicator(),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16, 0, 8, 16),
                        child: ListTile(
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                ' ${pokemon['name'].replaceFirst(pokemon['name'][0], pokemon['name'][0].toUpperCase())}',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                ' #${pokemon['id']}',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          subtitle: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 12.0, vertical: 4.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16.0),
                                  color: getTypeColor(pokemon['type1']),
                                ),
                                child: Text(
                                  ' ${pokemon['type1']}',
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.white),
                                ),
                              ),
                              if (pokemon['type2'].isNotEmpty)
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: 4.0),
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 12.0,
                                        vertical: 4.0), 
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16.0),
                                      color: getTypeColor(pokemon['type2']),
                                    ),
                                    child: Text(
                                      ' ${pokemon['type2']}',
                                      style: TextStyle(
                                          fontSize: 14, color: Colors.white),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
  Color getTypeColor(String type) {
    switch (type.toLowerCase()) {
      case 'normal':
        return Colors.brown;
      case 'fire':
        return Colors.red;
      case 'water':
        return Colors.blue;
      case 'electric':
        return Colors.amber;
      case 'grass':
        return Colors.green;
      case 'ice':
        return Colors.cyan;
      case 'fighting':
        return Colors.orange;
      case 'poison':
        return Colors.purple;
      case 'ground':
        return Colors.orangeAccent;
      case 'flying':
        return Colors.indigo;
      case 'psychic':
        return Colors.pink;
      case 'bug':
        return Colors.lightGreen;
      case 'rock':
        return Colors.grey;
      case 'ghost':
        return Colors.deepPurple;
      case 'dragon':
        return Colors.indigoAccent;
      case 'dark':
        return Colors.black87;
      case 'steel':
        return Colors.blueGrey;
      case 'fairy':
        return Colors.pinkAccent;
      default:
        return Colors.grey;
    }
  }
}
