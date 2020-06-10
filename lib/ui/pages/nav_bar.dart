import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
            child: BottomNavigationBar(
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: const Icon(Icons.home, color: Colors.white),
                  title: Text(
                    "Home",
                    style: TextStyle(color: Colors.grey[900]),
                  ),
                ),
                BottomNavigationBarItem(
                  icon: const Icon(Icons.fitness_center, color: Colors.white),
                  title: Text(
                    "Workouts",
                    style: TextStyle(color: Colors.grey[900]),
                  ),
                ),
                BottomNavigationBarItem(
                  icon: const Icon(Icons.fastfood, color: Colors.white),
                  title: Text(
                    "Recipes",
                    style: TextStyle(color: Colors.grey[900]),
                  ),
                ),
                BottomNavigationBarItem(
                  icon: const Icon(Icons.person, color: Colors.white),
                  title: Text(
                    "Profile",
                    style: TextStyle(color: Colors.grey[900]),
                  ),
                )
              ],
              backgroundColor: Colors.grey[900],
              iconSize: 27.5,
              type: BottomNavigationBarType.fixed,
              selectedLabelStyle: TextStyle(color:Color(0xFFe83323)),
              selectedItemColor: Color(0xFFe83323),
              selectedIconTheme: IconThemeData(color: Color(0xFFe83323)),
              showSelectedLabels: true,
            ),
          );
      
    
  }
}