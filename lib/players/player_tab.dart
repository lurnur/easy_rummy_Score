import 'package:easy_rummy_score/players/player_card.dart';
import 'package:flutter/material.dart';
import 'package:easy_rummy_score/players/player_model.dart';

class PlayersTab extends StatefulWidget {
  PlayersTab({super.key, required this.players});

  List<Player> players;

  @override
  _PlayersTabState createState() => _PlayersTabState();
}

class _PlayersTabState extends State<PlayersTab> {
  final TextEditingController _playerNameController = TextEditingController();

  void _addPlayerItem(String name) {
    setState(() {
      widget.players.add(Player(playerName: name, inGame: false));
    });
    _playerNameController.clear();
  }

  void _handlePlayerSelect(Player player) {
    setState(() {
      player.inGame = !player.inGame;
    });
  }

  void _handlePlayerDelete(Player player) {
    setState(() {
      widget.players.removeWhere((element) => 
        element.playerName == player.playerName);
    });
  }

  Future<void> _displayDialog() async{
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add a Player'),
          content: TextField(
            controller: _playerNameController,
            decoration: const InputDecoration(hintText: 'Type Player Name'),
            autofocus: true,
          ),
          actions: <Widget>[
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
                _addPlayerItem(_playerNameController.text);
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return  Container(
      color: Colors.greenAccent,
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,

        children: <Widget>[
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              children: widget.players.map((Player player) {
                return PlayerCard(
                  player: player,
                  onPlayerSelect: _handlePlayerSelect,
                  onPlayerDelete: _handlePlayerDelete,
                );
              }).toList(),
            ),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
              //primary: Colors.blueGrey,
            ),
            onPressed: () => _displayDialog(),
            child: const Text('Add Player'),
          ),
          const SizedBox(height: 10),
        ],
      ),
      
    );
  }
}