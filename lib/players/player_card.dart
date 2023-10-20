import 'package:flutter/material.dart';
import 'package:easy_rummy_score/players/player_model.dart';

class PlayerCard extends StatelessWidget {
  PlayerCard({
    required this.player,
    required this.onPlayerSelect,
    required this.onPlayerDelete,
  }) : super(key: ObjectKey(player));

  final Player player;
  final void Function(Player player) onPlayerSelect;
  final void Function(Player player) onPlayerDelete;

  TextStyle? _getTextStyle(bool checked) {
    if (!checked) return null;

    return const TextStyle(
      color: Colors.black54,
      //fontWeight: FontWeight.bold,
      decoration: TextDecoration.underline,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        //onPlayerSelect(player);
      },
      leading: Checkbox(
        checkColor: Colors.greenAccent,
        activeColor: Colors.red,
        value: player.inGame,
        onChanged: (value) {
          onPlayerSelect(player);
        },
      ),
      title: Row(children: <Widget>[
        Expanded(
          child: Text(player.playerName, style: _getTextStyle(player.inGame)),
        ),
        IconButton(
          iconSize: 30,
          icon: Icon(
            Icons.delete,
          ),
          alignment: Alignment.centerRight,
          onPressed: () {
            onPlayerDelete(player);
          },
        ),
      ]),
    );
  }
}
