import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'main.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';




class MatchMakingPage extends StatefulWidget {
  @override
  _MatchMakingState createState() => _MatchMakingState();
}

class _MatchMakingState extends State<MatchMakingPage> {
  int _currentIndex = 0;
  List<Player> _matchingPlayers = [
    Player(
      name: 'Alice - 78% Compatibility',
      photoUrl: 'https://randomuser.me/api/portraits/lego/0.jpg',
      bio: 'I am so mean during games! I am also bad.',
    ),
    Player(
      name: 'Bob - 50% Compatibility',
      photoUrl: 'https://randomuser.me/api/portraits/lego/1.jpg',
      bio: 'I hate video games and I am so good at them.',
    ),
    Player(
      name: 'Charlie - 43% Compatibility',
      photoUrl: 'https://randomuser.me/api/portraits/lego/8.jpg',
      bio: 'When playing games it is all about teamwork.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Compatible Players')),
      body: _matchingPlayers.isNotEmpty
          ? _buildCarouselSlider()
          : _buildLoadingIndicator(),
    );
  }

  Widget _buildCarouselSlider() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CarouselSlider(
          key: UniqueKey(),
          options: CarouselOptions(
            height: 400,
            viewportFraction: 0.8,
            initialPage: _currentIndex,
            enableInfiniteScroll: false,
            reverse: false,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
          items: _matchingPlayers.map((player) {
            return Builder(
              builder: (BuildContext context) {
                return Card(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(player.name),
                      Image.network('https://picsum.photos/250?image=9'),
                      Text(player.bio),
                    ],
                  ),
                );
              },
            );
          }).toList(),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                _swipeLeft();
              },
              child: Text('Nope'),
            ),
            SizedBox(width: 16),
            ElevatedButton(
              onPressed: () {
                _swipeRight();
              },
              child: Text('Add'),
            ),
          ],
        ),
      ],
    );
  }

  void _swipeLeft() {
    setState(() {
      if (_currentIndex > 0) {
        _currentIndex--;
      } else {
        // If we're at the first Player, loop around to the last Player
        _currentIndex = _matchingPlayers.length - 1;
      }
    });
  }


  void _swipeRight() {
    setState(() {
      if (_currentIndex < _matchingPlayers.length - 1) {
        _currentIndex++;
      } else {
        // If we're at the last Player, loop around to the first Player
        _currentIndex = 0;
      }
    });
  }

  Widget _buildLoadingIndicator() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}

class Player {
  final String name;
  final String photoUrl;
  final String bio;

  Player({
    required this.name,
    required this.photoUrl,
    required this.bio,
  });
}

