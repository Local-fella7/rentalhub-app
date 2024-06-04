import 'package:flutter/material.dart';
import 'package:rentalhub/users/owner/pages/properties/ownerProperties.dart';
import 'package:rentalhub/users/owner/pages/dashboard/ownerDashboard.dart';
import 'package:rentalhub/users/owner/pages/messages/ownerListMessage.dart';

class OwnerHomePage extends StatefulWidget {
  @override
  State<OwnerHomePage> createState() => _OwnerHomePageState();
}

class _OwnerHomePageState extends State<OwnerHomePage> {
  int selectedIndex = 0;

  final List<Widget> pages = [
    OwnerDashboard(),
    OwnerListMessage(),
    OwnerProperties(),
  ];

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: pages[selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.dashboard),
              label: 'Dashboard',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.sms),
              label: 'Messages',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.collections),
              label: 'Properties',
            ),
          ],
          currentIndex: selectedIndex,
          selectedItemColor: Colors.deepPurple,
          unselectedItemColor: Colors.grey,
          onTap: onItemTapped,
        ));
  }
}
