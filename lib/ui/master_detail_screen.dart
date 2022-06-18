import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:landscape_potrait_flutter/model/joke_model.dart';
import 'package:landscape_potrait_flutter/ui/joke_details.dart';
import 'package:landscape_potrait_flutter/ui/joke_listing.dart';

class MasterDetailScreen extends StatefulWidget {
  const MasterDetailScreen({Key? key}) : super(key: key);

  @override
  State<MasterDetailScreen> createState() => _MasterDetailScreenState();
}

class _MasterDetailScreenState extends State<MasterDetailScreen> {
  static const int tableBreakpoint = 600;
  JokeModel _selectedJoke = JokeModel(
    id: 0,
    type: '',
    setup: '',
    punchline: '',
  );

  Widget _buildMobileLayout() {
    return JokeListing(
        jokeSelectedCallback: (jokeSelected) {
          Navigator.push(context,
              MaterialPageRoute(builder: (BuildContext context) {
            return JokeDetails(
              joke: jokeSelected,
              isInTableLayout: false,
            );
          }));
        },
        jokeSelected: _selectedJoke);
  }

  Widget _buildTabletLayout() {
    return Row(
      children: [
        Flexible(
          flex: 1,
          child: Material(
            elevation: 13,
            child: JokeListing(
              jokeSelectedCallback: (joke) {
                setState(() {
                  _selectedJoke = joke;
                });
              },
              jokeSelected: _selectedJoke,
            ),
          ),
        ),
        Flexible(
          flex: 3,
          child: JokeDetails(
            joke: _selectedJoke,
            isInTableLayout: true,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {


    Widget content = _buildMobileLayout();
    var shortestSide = MediaQuery.of(context).size.shortestSide;
    var orientation = MediaQuery.of(context).orientation;

    if(orientation == Orientation.portrait && shortestSide < tableBreakpoint){
      //mobile
      content = _buildMobileLayout();
    }else{
      //tablet
      content = _buildTabletLayout();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Jokes'),
      ),
      body: content,
    );
  }
}
