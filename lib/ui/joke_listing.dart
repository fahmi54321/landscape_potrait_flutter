import 'package:flutter/material.dart';
import 'package:landscape_potrait_flutter/model/joke_model.dart';

class JokeListing extends StatelessWidget {
  final ValueChanged<JokeModel> jokeSelectedCallback;
  final JokeModel jokeSelected;

  JokeListing({
    Key? key,
    required this.jokeSelectedCallback,
    required this.jokeSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: jokesList.map((joke) {
        return Container(
          child: ListTile(
            title: Text(joke.setup),
            onTap: ()=> jokeSelectedCallback(joke),
            selected: jokeSelected == joke,
          ),
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(4.5),
          ),
        );
      }).toList(),
    );
  }
}
