import 'package:flutter/material.dart';

class PokemonDetailScreen extends StatelessWidget {
  final Map<String, dynamic> pokemon;

  PokemonDetailScreen({required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          ' ${pokemon['name'].replaceFirst(pokemon['name'][0], pokemon['name'][0].toUpperCase())}',
        ),
      ),
      backgroundColor: Color.fromARGB(255, 181, 181, 181),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(240, 0, 240, 0),
        child: Container(
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 255, 255, 255),
          ),
          child: Column(
            children: [
              Center(
                child: Column(
                  children: [
                    Container(
                      child: Text(
                        ' ${pokemon['name'].replaceFirst(pokemon['name'][0], pokemon['name'][0].toUpperCase())}',
                        style: TextStyle(
                            fontSize: 40, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      child: Text(
                        ' id:#${pokemon['id']}',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 194, 191, 191),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    height: 450,
                    width: 425,
                    child: Image.network(
                      pokemon['frontimageUrl'],
                      fit: BoxFit.fill,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Color(0xFF30A7D7),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        height: 240,
                        width: 430,
                        child: Padding(
                          padding: const EdgeInsets.all(24.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 24.0),
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Height',
                                            style: TextStyle(fontSize: 18),
                                          ),
                                          Text(
                                            '${pokemon['height']}',
                                            style: TextStyle(fontSize: 18),
                                          )
                                        ],
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Weight',
                                            style: TextStyle(fontSize: 18),
                                          ),
                                          Text(
                                            '${pokemon['weight']}',
                                            style: TextStyle(fontSize: 18),
                                          )
                                        ],
                                      )
                                    ]),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 24.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Abilities',
                                            style: TextStyle(fontSize: 18),
                                          ),
                                          Text(
                                            '${pokemon['abilities']}',
                                            style: TextStyle(fontSize: 18),
                                          ),
                                        ]),
                                    Text(""),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 24),
                      Text("Type"),
                      SizedBox(height: 12),
                      Container(
                        child: Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(right: 12),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 48.0, vertical: 4.0),
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 168, 168, 168),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Text(
                                '${pokemon['type1']}',
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                            if (pokemon['type2'].isNotEmpty)
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 48.0, vertical: 4.0),
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 168, 168, 168),
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Text(
                                  '${pokemon['type2']}',
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 40),
              Container(
                padding: EdgeInsets.all(48),
                  height: 240,
                  width: 860,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    color: Color(0xFFD2D2D2),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Stats"),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
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
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
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
                      )
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
