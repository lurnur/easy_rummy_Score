import 'package:flutter/material.dart';
import 'package:easy_rummy_score/score/score_card_view.dart';
import 'package:easy_rummy_score/players/player_model.dart';

class ScoreTab extends StatelessWidget {
  ScoreTab({super.key, required this.players});

  List<Player> players;

  @override
  Widget build(BuildContext context) {
    List<Player> inGamePlayers = players.where((p) {
      return p.inGame;
    }).toList();

    return  Container(
      color: const Color.fromARGB(255, 50, 100, 200),
      child: Column(
        children: <Widget> [
          Expanded( //Expanded is needed to wrap the scroll view
            child: Container(
              padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
              child: ListView.builder(
                itemCount: inGamePlayers.length,
                itemBuilder: (context, index) {
                  return 
                   ScoreCardView(playerName: inGamePlayers[index].playerName);
                   
                }
              ),
            ),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
              //primary: Colors.blueGrey,
            ),
            onPressed: () { },
            child: Text('Score'),
          ),
          const SizedBox(height: 10),
        ]
      ),
    );
  }
}