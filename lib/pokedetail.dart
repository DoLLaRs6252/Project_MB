import 'package:flutter/material.dart';

class PokemonDetailScreen extends StatefulWidget {
  final Map<String, dynamic> pokemon;

  PokemonDetailScreen({required this.pokemon});

  @override
  _PokemonDetailScreenState createState() => _PokemonDetailScreenState();
}

class _PokemonDetailScreenState extends State<PokemonDetailScreen> {
  bool _showFrontImage = true;

  String getDisplayedImageUrl() {
    return _showFrontImage
        ? widget.pokemon['frontimageUrl']
        : widget.pokemon['front_shinyimageUrl'];
  }

  void toggleImage() {
    setState(() {
      _showFrontImage = !_showFrontImage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          ' ${widget.pokemon['name'].replaceFirst(widget.pokemon['name'][0], widget.pokemon['name'][0].toUpperCase())}',
        ),
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
                          ' ${widget.pokemon['name'].replaceFirst(widget.pokemon['name'][0], widget.pokemon['name'][0].toUpperCase())}',
                          style: TextStyle(
                              fontSize: 40, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        child: Text(
                          ' id:#${widget.pokemon['id']}',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 220, 215, 215),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      height: 450,
                      width: 425,
                      child: Image.network(
                        getDisplayedImageUrl(),
                        fit: BoxFit.fill,
                      ),
                    ),
                    SizedBox(width: 40),
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
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  color: const Color.fromARGB(
                                                      255, 255, 255, 255),
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              '${widget.pokemon['height']}',
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
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  color: const Color.fromARGB(
                                                      255, 255, 255, 255),
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              '${widget.pokemon['weight']}',
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
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  color: const Color.fromARGB(
                                                      255, 255, 255, 255),
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              '${widget.pokemon['abilities']}',
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
                                  color: getTypeColor(widget.pokemon['type1']),
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Text(
                                  '${widget.pokemon['type1']}',
                                  style: TextStyle(fontSize: 18,color: Colors.white,),
                                ),
                              ),
                              if (widget.pokemon['type2'].isNotEmpty)
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 48.0, vertical: 4.0),
                                  decoration: BoxDecoration(
                                    color: getTypeColor(widget.pokemon['type2']),
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  child: Text(
                                    '${widget.pokemon['type2']}',
                                    style: TextStyle(fontSize: 18,color: Colors.white,),
                                  ),
                                ),
                            ],
                          ),
                        ),
                        SizedBox(height:40 ,),
                        ElevatedButton(
                          onPressed: toggleImage,
                          style: ElevatedButton.styleFrom(
                            primary: Colors.blue, // Background color
                            onPrimary: Colors.white, // Text color
                            padding: EdgeInsets.symmetric(
                                vertical: 16.0,
                                horizontal: 24.0), // Button padding
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  10.0), // Button border radius
                            ),
                            textStyle: TextStyle(
                              fontSize: 18.0, // Text size
                              fontWeight: FontWeight.bold, // Text weight
                            ),
                          ),
                          child: Text(_showFrontImage
                              ? 'Show Shiny Version'
                              : 'Show Regular Version'),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 40),
                Container(
                    padding: EdgeInsets.all(48),
                    height: 240,
                    width: 900,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      color: Color(0xFFD2D2D2),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Stats",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'HP: ${widget.pokemon['hp']}',
                              style: TextStyle(fontSize: 18),
                            ),
                            Text(
                              'Attack: ${widget.pokemon['attack']}',
                              style: TextStyle(fontSize: 18),
                            ),
                            Text(
                              'Defense: ${widget.pokemon['defense']}',
                              style: TextStyle(fontSize: 18),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Special Attack: ${widget.pokemon['specialAttack']}',
                              style: TextStyle(fontSize: 18),
                            ),
                            Text(
                              'Special Defense: ${widget.pokemon['specialDefense']}',
                              style: TextStyle(fontSize: 18),
                            ),
                            Text(
                              'Speed: ${widget.pokemon['speed']}',
                              style: TextStyle(fontSize: 18),
                            ),
                          ],
                        )
                      ],
                    )),
                SizedBox(height: 20),
              ],
            ),
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
