import 'package:flutter/material.dart';
import 'package:rentalhub/users/tenant/tenantProfile_page.dart';
import 'package:rentalhub/users/tenant/pages/dashboard/tenantSummary.dart';
import 'package:rentalhub/users/tenant/pages/view/tenantView.dart';
import 'package:rentalhub/users/tenant/pages/message/tenantListMessages.dart';

class TenantDashboard extends StatefulWidget {
  const TenantDashboard({super.key});

  @override
  State<TenantDashboard> createState() => _TenantDashboardState();
}

class _TenantDashboardState extends State<TenantDashboard> {
  final String tenantName = "Ernest Ephraim";
  final String email = "ernestephraim@gmail.com";
  final String location = "Arusha";
  final int unreadMessages = 5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (context) {
            return IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: const Icon(Icons.menu),
            );
          },
        ),
        title: const Text('Rent Now, Smile Always'),
        backgroundColor: Colors.lightBlue,
        actions: [
          Stack(
            children: [
              IconButton(
                iconSize: 30,
                icon: const Icon(Icons.notifications),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TenantListMessages()),
                  );
                },
              ),
              if (unreadMessages > 0)
                Positioned(
                  right: 11,
                  top: 11,
                  child: Container(
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    constraints: const BoxConstraints(
                      minWidth: 14,
                      minHeight: 14,
                    ),
                    child: Text(
                      '$unreadMessages',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 8,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
      drawer: ProfileDrawer(
        username: tenantName,
        email: email,
        location: location,
        role: "Tenant",
        onLogout: () {
          // Implement logout functionality
        },
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.deepPurpleAccent,
                  borderRadius: BorderRadius.circular(8.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Welcome, $tenantName!',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Are you looking for a comfortable, stylish, and conveniently located place to call home? Look no further! We are delighted to offer a beautiful home, rent with us to build your future.',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const TenantView()),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.deepPurpleAccent,
                    borderRadius: BorderRadius.circular(8.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Icon(
                            Icons.view_comfortable,
                            color: Colors.black,
                            size: 50,
                          ),
                          SizedBox(width: 10),
                          Text(
                            'View Houses',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const TenantSummary()),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.deepPurpleAccent,
                    borderRadius: BorderRadius.circular(8.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Icon(
                            Icons.summarize,
                            color: Colors.black,
                            size: 50,
                          ),
                          SizedBox(width: 10),
                          Text(
                            'Short Summary',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Get a quick overview of your rental details, and other information. Stay informed and manage your rental with ease.',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
