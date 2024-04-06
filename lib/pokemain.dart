import 'package:flutter/material.dart';
import 'package:project/pokelist.dart';

class PokemainPage extends StatelessWidget {
  const PokemainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bg.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            children: [
              Container(
                height: 400,
                width: 800,
                padding: EdgeInsets.all(10.0),               
                child: Image.asset(
                  'assets/images/logo.webp',
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(height: 120.0),
              Container(                
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PokeListPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.transparent,
                    shadowColor: Colors.transparent,
                    padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  ),
                  child: Stack(
                    children: [
                      Text(
                        'Press Start',
                        style: TextStyle(
                          fontFamily: 'PressStart2P',
                          fontSize: 75.0,
                          foreground: Paint()
                            ..style = PaintingStyle.stroke
                            ..strokeWidth = 20
                            ..color = Colors.black,
                        ),
                      ),
                      // Main Text
                      Text(
                        'Press Start',
                        style: TextStyle(
                          fontFamily: 'PressStart2P',
                          color: Colors.white,
                          fontSize: 75.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
