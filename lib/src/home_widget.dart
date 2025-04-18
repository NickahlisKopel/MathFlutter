import 'package:flutter/material.dart';
import 'package:math_game_flutter_rebuild/src/app.dart';
import 'package:math_game_flutter_rebuild/src/game/intro_screen.dart';

import 'package:math_game_flutter_rebuild/src/providers/user_provider.dart';
import 'package:provider/provider.dart';

class HomeScreenWidget extends StatefulWidget {
  const HomeScreenWidget({super.key});

  @override
  State<HomeScreenWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeScreenWidget> {
  
  @override
  Widget build(BuildContext context) {
    var userProvider = Provider.of<UserProvider>(context);
    var user = userProvider.user;
    return Provider<UserProvider>(
      create: (_) => UserProvider(),
      builder: (context, child) {
        return Center(child:
        Column(mainAxisAlignment: MainAxisAlignment.center, 
        children: [
          Text("Home of"), 
          Text(user != null ? "${user.name}":"Click on The Profile Icon and Sign Up!"),
          ElevatedButton(onPressed: ()=>{Navigator.push<void>(
    context,
    MaterialPageRoute<void>(
      builder: (BuildContext context) => IntroScreen(),
    ),
  ),},child: Text("tutorial"),),],));
          

      }
    );
  }
}

