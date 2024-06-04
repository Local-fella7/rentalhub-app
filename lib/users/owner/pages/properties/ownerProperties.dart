import 'package:flutter/material.dart';
import 'package:rentalhub/users/owner/pages/properties/ownerViewProperty.dart';

import '../../../../pages/profile_page.dart';

class Property {
  final String description;
  final String price;
  final String location;
  final bool isRented;
  final String imagePath;

  Property({
    required this.description,
    required this.price,
    required this.location,
    required this.isRented,
    required this.imagePath,
  });
}

List<Property> sampleProperties = [
  Property(
    description: "Beautiful 3-bedroom apartment with sea view",
    price: "\$1500/month",
    location: "Downtown",
    isRented: true,
    imagePath: 'assets/images/house01.jpg',
  ),
  Property(
    description: "Cozy 2-bedroom house with garden",
    price: "\$1200/month",
    location: "Suburbs",
    isRented: false,
    imagePath: 'assets/images/house03.jpg',
  ),
  // Add more properties here
];

class OwnerProperties extends StatefulWidget {
  const OwnerProperties({super.key});

  @override
  State<OwnerProperties> createState() => _OwnerPropertiesState();
}

class _OwnerPropertiesState extends State<OwnerProperties> {
  final String ownerName = "Paschal Ephraim";
  final String email = "paschalephraim@gmail.com";
  final String location = "Arusha";
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
        title: const Text('Properties'),
        centerTitle: true,
        backgroundColor: Colors.lightBlue,
      ),
      body: ListView.builder(
        itemCount: sampleProperties.length,
        itemBuilder: (context, index) {
          final property = sampleProperties[index];
          return Container(
            margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            padding: const EdgeInsets.all(12.0),
            decoration: BoxDecoration(
              color: Colors.white,
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
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        property.description,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text('Price: ${property.price}'),
                      const SizedBox(height: 5),
                      const SizedBox(height: 5),
                      Text('Location: ${property.location}'),
                      const SizedBox(height: 5),
                      Text('State: ${property.isRented ? "Rented" : "Available"}'),
                    ],
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.arrow_forward, color: Colors.blue),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => OwnerViewProperty(property: property),
                      ),
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Implement property posting functionality
        },
        child: const Icon(Icons.add),
        backgroundColor: Colors.lightBlue,
      ),
      drawer: ProfileDrawer(
        username: ownerName,
        email: email,
        location: location,
        role: "Owner",
        onLogout: () {
          // Implement logout functionality
        },
      ),
    );
  }
}
