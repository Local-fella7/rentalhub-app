import 'package:flutter/material.dart';
import 'package:rentalhub/users/owner/pages/properties/ownerProperties.dart';  // Updated import

class TenantViewProperty extends StatelessWidget {
  final Property property;
  final String? tenantName;
  final String? tenantPhone;
  final String? rentDuration;

  const TenantViewProperty({
    super.key,
    required this.property,
    this.tenantName,
    this.tenantPhone,
    this.rentDuration,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('View Property'),
        centerTitle: true,
        backgroundColor: Colors.lightBlue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Text(
              property.description,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Image.asset(
              property.imagePath,
              height: 300,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 10),
            Text(
              'Price: ${property.price}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 10),
            Text(
              'Location: ${property.location}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 10),
            Text(
              'State: ${property.isRented ? "Rented" : "Available"}',
              style: const TextStyle(fontSize: 16),
            ),
            if (property.isRented && tenantName != null) ...[
              const SizedBox(height: 20),
              const Text(
                'Tenant Information:',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Name: $tenantName',
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 5),
              Text(
                'Phone: $tenantPhone',
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 5),
              Text(
                'Rent Duration: $rentDuration',
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
