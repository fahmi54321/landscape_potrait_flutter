import 'package:flutter/material.dart';
import 'package:landscape_potrait_flutter/model/joke_model.dart';

class JokeDetails extends StatelessWidget {
  final bool isInTableLayout;
  final JokeModel joke;

  const JokeDetails({
    Key? key,
    required this.joke,
    required this.isInTableLayout,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final Widget content = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.all(8),
          child: Text(
            joke?.setup ?? 'No Joke Selected',
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            joke?.punchline ?? 'Please select a joke on the left',
          ),
        ),
      ],
    );

    if(isInTableLayout){
      return content;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(joke?.type??'No Jokes'),
      ),
      backgroundColor: Colors.deepPurpleAccent,
      body: Center(child: content),
    );
  }
}
