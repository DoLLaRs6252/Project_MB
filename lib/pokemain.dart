import 'package:flutter/material.dart';
import 'package:project/pokelist.dart';

class PokemainPage extends StatefulWidget {
  const PokemainPage({Key? key}) : super(key: key);

  @override
  _PokemainPageState createState() => _PokemainPageState();
}

class _PokemainPageState extends State<PokemainPage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(milliseconds: 1000),
      vsync: this,
    )..repeat(reverse: true);
    _animation = Tween<double>(begin: -10.0, end: 10.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

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
              AnimatedBuilder(
                animation: _animation,
                builder: (context, child) {
                  return Transform.translate(
                    offset: Offset(0.0, _animation.value),
                    child: child,
                  );
                },
                child: Container(
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
