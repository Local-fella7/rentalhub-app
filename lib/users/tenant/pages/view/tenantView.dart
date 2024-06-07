import 'package:flutter/material.dart';
import 'package:rentalhub/users/owner/pages/properties/ownerProperties.dart';  // Updated import
import 'package:rentalhub/users/tenant/pages/view/tenantViewProperty.dart';

class TenantView extends StatefulWidget {
  const TenantView({super.key});

  @override
  State<TenantView> createState() => _TenantViewState();
}

class _TenantViewState extends State<TenantView> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('City Scape'),
        centerTitle: true,
        backgroundColor: Colors.lightBlue,
      ),
      body: ListView.builder(
        itemCount: _properties.length,
        itemBuilder: (context, index) {
          final property = _properties[index];
          return Container(
            margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            padding: const EdgeInsets.all(12.0),
            decoration: BoxDecoration(
              color: Colors.lightBlueAccent,
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
                          builder: (context) => TenantViewProperty(
                            property: property,
                            tenantName: null,  
                            tenantPhone: null,
                            rentDuration: null, 
                          ),
                        ),
                      );
                    },
                    child: const Text('View'),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
