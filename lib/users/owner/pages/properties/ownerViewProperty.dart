import 'package:flutter/material.dart';
import 'package:rentalhub/users/owner/pages/properties/ownerProperties.dart';

class OwnerViewProperty extends StatefulWidget {
  final Property property;

  const OwnerViewProperty({super.key, required this.property});

  @override
  State<OwnerViewProperty> createState() => _OwnerViewPropertyState();
}

class _OwnerViewPropertyState extends State<OwnerViewProperty> {
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
            Image.asset(
              widget.property.imagePath,
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 20),
            Text(
              widget.property.description,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text('Price: ${widget.property.price}'),
            const SizedBox(height: 10),
            const SizedBox(height: 10),
            Text('Location: ${widget.property.location}'),
            const SizedBox(height: 10),
            Text('State: ${widget.property.isRented ? "Rented" : "Available"}'),
          ],
        ),
      ),
    );
  }
}
