import 'package:flutter/material.dart';

class Property {
  final String description;
  final String price;
  final String phone;
  final String location;
  final bool isRented;
  final String imagePath;

  Property({
    required this.description,
    required this.price,
    required this.phone,
    required this.location,
    required this.isRented,
    required this.imagePath,
  });
}

List<Property> sampleProperties = [
  Property(
    description: "Beautiful 3-bedroom apartment with sea view",
    price: "\$1500/month",
    phone: "123-456-7890",
    location: "Downtown",
    isRented: true,
    imagePath: "assets/images/house01.jpg",
  ),
  Property(
    description: "Cozy 2-bedroom house with garden",
    price: "\$1200/month",
    phone: "987-654-3210",
    location: "Suburbs",
    isRented: false,
    imagePath: "assets/images/house02.jpg",
  ),
  // Add more properties here
];

class OwnerProperties extends StatefulWidget {
  const OwnerProperties({super.key});

  @override
  State<OwnerProperties> createState() => _OwnerPropertiesState();
}

class _OwnerPropertiesState extends State<OwnerProperties> {
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  property.imagePath,
                  height: 150,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                const SizedBox(height: 10),
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
                Text('Phone: ${property.phone}'),
                const SizedBox(height: 5),
                Text('Location: ${property.location}'),
                const SizedBox(height: 5),
                Text('State: ${property.isRented ? "Rented" : "Available"}'),
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
    );
  }
}
