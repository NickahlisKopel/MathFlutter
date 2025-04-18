import 'package:crystal_navigation_bar/crystal_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:math_game_flutter_rebuild/src/game/game_widget.dart';
import 'package:math_game_flutter_rebuild/src/game/intro_screen.dart';
import 'package:math_game_flutter_rebuild/src/home_widget.dart';

import 'package:math_game_flutter_rebuild/src/profile/user_widget.dart';
import 'package:math_game_flutter_rebuild/src/providers/user_provider.dart';

import 'package:math_game_flutter_rebuild/src/settings/settings_controller.dart';
import 'package:math_game_flutter_rebuild/src/settings/settings_service.dart';
import 'package:provider/provider.dart';



enum _SelectedTab { home, game, profile }
SettingsController settingsController = SettingsController(_settingsService);
SettingsService _settingsService = SettingsService();




class MyApp extends StatelessWidget {
  const MyApp({super.key, required SettingsController settingsController});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var userProvider = Provider.of<UserProvider>(context);
    var user = userProvider.user;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Crystal Bottom Bar Example',
      theme: ThemeData.dark(),
      home: HomePage(),
    );
  }
}

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {

  var _selectedTab = _SelectedTab.profile;

  void _handleIndexChanged(int i) {
    var userProvider = Provider.of<UserProvider>(context);
    var user = userProvider.user;
    
    setState(() {
      if (user != null ){
         _selectedTab = _SelectedTab.values[i];
      }else{
        _selectedTab = _SelectedTab.values[2];
      }
     
    });
  }
  @override
  Widget build(BuildContext context) {
     var userProvider = Provider.of<UserProvider>(context);
    var user = userProvider.user;
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.blue,
      body: UserWidget(),
      bottomNavigationBar: CrystalNavigationBar(
        currentIndex: _SelectedTab.values.indexOf(_selectedTab),
        height: 5,
        // indicatorColor: Colors.blue,
        unselectedItemColor: Colors.white70,
        backgroundColor: Colors.black.withValues(),
        // boxShadow: [
        //   BoxShadow(
        //     color: Colors.black.withOpacity(0.1),
        //     blurRadius: 4,
        //     spreadRadius: 4,
        //     offset: Offset(0, 10),
        //   ),
        // ],
        onTap: _handleIndexChanged,
        items: [
          /// Home
          CrystalNavigationBarItem(
            icon: IconlyBold.home,
            unselectedIcon: IconlyLight.home,
            selectedColor: Colors.white,
          ),
          

          /// Add
          user != null ?
          CrystalNavigationBarItem(
            icon: IconlyBold.plus,
            unselectedIcon: IconlyLight.plus,
            selectedColor: Colors.white,
          
          ): CrystalNavigationBarItem(
            icon: IconlyBold.plus,
            unselectedIcon: IconlyLight.plus,
            selectedColor: Colors.red,
          
          ),


          /// Profile
          CrystalNavigationBarItem(
            icon: IconlyBold.user_2,
            unselectedIcon: IconlyLight.user,
            selectedColor: Colors.white,
          ),
        ],
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _selectedTab = _SelectedTab.home;

  void _handleIndexChanged(int i) {
    setState(() {
      _selectedTab = _SelectedTab.values[i];
    });
  }
  // This could be null if no user is logged in
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final double screenWidth = screenSize.width;
    final double screenHeight = screenSize.height;
    Widget body;
    switch (_selectedTab) {
      case _SelectedTab.home:
        body = HomeScreenWidget();
        break;
      case _SelectedTab.game:
        body = GameWidget(); // Change this to your game screen
        break;
      case _SelectedTab.profile:
        body = UserWidget(); // This will now show the UserWidget!
        break;
    }

    return Scaffold(
      extendBodyBehindAppBar: false,
      backgroundColor: Colors.blue,
      body: body, // Now dynamically changes based on _selectedTab
      bottomNavigationBar: CrystalNavigationBar(
        currentIndex: _SelectedTab.values.indexOf(_selectedTab),
        height: 60, // Increased height for better visibility
        unselectedItemColor: Colors.white70,
        backgroundColor: Colors.black.withOpacity(0.1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            spreadRadius: 4,
            offset: Offset(0, 10),
          ),
        ],
        onTap: _handleIndexChanged,
        items: [
          CrystalNavigationBarItem(
            icon: IconlyBold.home,
            unselectedIcon: IconlyLight.home,
            selectedColor: Colors.white,
          ),
          CrystalNavigationBarItem(
            icon: IconlyBold.plus,
            unselectedIcon: IconlyLight.plus,
            selectedColor: Colors.white,
          ),
          CrystalNavigationBarItem(
            icon: IconlyBold.user_2,
            unselectedIcon: IconlyLight.user,
            selectedColor: Colors.white,
          ),
        ],
      ),
    );
  }
}
class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {

  var _selectedTab = _SelectedTab.profile;

  void _handleIndexChanged(int i) {
    setState(() {
      _selectedTab = _SelectedTab.values[i];
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.blue,
      body: GameWidget(),
      bottomNavigationBar: CrystalNavigationBar(
        currentIndex: _SelectedTab.values.indexOf(_selectedTab),
        height: 5,
        // indicatorColor: Colors.blue,
        unselectedItemColor: Colors.white70,
        backgroundColor: Colors.black.withValues(),
        // boxShadow: [
        //   BoxShadow(
        //     color: Colors.black.withOpacity(0.1),
        //     blurRadius: 4,
        //     spreadRadius: 4,
        //     offset: Offset(0, 10),
        //   ),
        // ],
        onTap: _handleIndexChanged,
        items: [
          /// Home
          CrystalNavigationBarItem(
            icon: IconlyBold.home,
            unselectedIcon: IconlyLight.home,
            selectedColor: Colors.white,
          ),
          

          /// Add
          CrystalNavigationBarItem(
            icon: IconlyBold.plus,
            unselectedIcon: IconlyLight.plus,
            selectedColor: Colors.white,
          ),


          /// Profile
          CrystalNavigationBarItem(
            icon: IconlyBold.user_2,
            unselectedIcon: IconlyLight.user,
            selectedColor: Colors.white,
          ),
        ],
      ),
    );
  }
}


