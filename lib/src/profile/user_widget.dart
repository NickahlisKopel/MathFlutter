import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:math_game_flutter_rebuild/src/providers/user_provider.dart';
import 'package:math_game_flutter_rebuild/src/profile/user.dart';

class UserWidget extends StatelessWidget {
  const UserWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var userProvider = Provider.of<UserProvider>(context);
    var user = userProvider.user;

    return Center(
      child: user != null
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Welcome, ${user.name}!"),
                Text("Email: ${user.email}"),
                ElevatedButton(
                  onPressed: () {
                    userProvider.logout();
                  },
                  child: Text("Logout"),
                ),
              ],
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Please sign up!"),
                ElevatedButton(
                  onPressed: () {
                    // Simulating user signup
                    userProvider.login(User(
                      id: "123",
                      name: "John Doe",
                      email: "john.doe@example.com",
                    ));
                  },
                  child: Text("Sign Up"),
                ),
              ],
            ),
    );
  }
}
