import 'package:flutter/material.dart';
import 'ownerViewProperty.dart';
import 'ownerAddProperty.dart';
import 'package:rentalhub/pages/profile_page.dart';

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

class OwnerProperties extends StatefulWidget {
  const OwnerProperties({super.key});

  @override
  State<OwnerProperties> createState() => _OwnerPropertiesState();
}

class _OwnerPropertiesState extends State<OwnerProperties> {
  final List<Property> _properties = [
    Property(
      description: "Beautiful 3-bedroom apartment with a car parking and garden",
      price: "Tshs 2,250,000/month",
      location: "Njiro-Arusha",
      isRented: true,
      imagePath: "assets/images/house_02.webp",
    ),
    Property(
      description: "A simple 2-bedroom house with garden",
      price: "Tshs 2,000,000/month",
      location: "Sakina-Arusha",
      isRented: false,
      imagePath: "assets/images/house05.jpg",
    ),
  ];

  final String ownerName = "Paschal Ephraim";
  final String email = "paschalephraim@gmail.com";
  final String location = "Arusha";

  void _addProperty(Property property) {
    setState(() {
      _properties.add(property);
    });
  }

  void _deleteProperty(int index) {
    setState(() {
      _properties.removeAt(index);
    });
  }

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
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () async {
              final newProperty = await Navigator.push<Property>(
                context,
                MaterialPageRoute(
                  builder: (context) => const OwnerAddProperty(),
                ),
              );
              if (newProperty != null) {
                _addProperty(newProperty);
              }
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: _properties.length,
        itemBuilder: (context, index) {
          final property = _properties[index];
          return Dismissible(
            key: Key(property.description),
            direction: DismissDirection.endToStart,
            onDismissed: (direction) {
              _deleteProperty(index);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('${property.description} dismissed')),
              );
            },
            background: Container(
              color: Colors.red,
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: const Icon(
                Icons.delete,
                color: Colors.white,
              ),
            ),
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              padding: const EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                color: Colors.lightBlue,
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
                  const SizedBox(height: 10),
                  Text(
                    property.description,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'Price: ${property.price}',
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'Location: ${property.location}',
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'State: ${property.isRented ? "Rented" : "Available"}',
                    style: const TextStyle(fontSize: 16),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => OwnerViewProperty(
                              property: property,
                              tenantName: property.isRented ? 'Ernest Ephraim' : null,
                              tenantPhone: property.isRented ? '0766399247' : null,
                              rentDuration: property.isRented ? '6 months' : null,
                            ),
                          ),
                        );
                      },
                      child: const Text('View'),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
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
