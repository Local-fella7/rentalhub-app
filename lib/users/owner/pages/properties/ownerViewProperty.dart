import 'package:flutter/material.dart';
import 'package:rentalhub/users/owner/pages/properties/ownerProperties.dart';

class OwnerViewProperty extends StatefulWidget {
  final Property property;
  final String? tenantName;
  final String? tenantPhone;
  final String? rentDuration;

  const OwnerViewProperty({
    super.key,
    required this.property,
    this.tenantName,
    this.tenantPhone,
    this.rentDuration,
  });

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
            const SizedBox(height: 20),
            Text(
              widget.property.description,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Image.asset(
              widget.property.imagePath,
              height: 300,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            
            const SizedBox(height: 10),
            Text('Price:   ${widget.property.price}',
            style: TextStyle(fontSize: 16,)
            ),
            const SizedBox(height: 10),
            Text('Location:   ${widget.property.location}',
            style: TextStyle(fontSize: 16,) 
            ),
            const SizedBox(height: 10),
            Text('State:   ${widget.property.isRented ? "Rented" : "Available"}',
            style: TextStyle(fontSize: 16,)
            ),
            if (widget.property.isRented && widget.tenantName != null) ...[
              const SizedBox(height: 20),
              const Text(
                'Tenant Information:',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Text('Name:   ${widget.tenantName}',
              style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 5),
              Text('Phone:   ${widget.tenantPhone}',
              style: TextStyle(fontSize: 16,)
              ),
              const SizedBox(height: 5),
              Text('Rent Duration:   ${widget.rentDuration}',
              style: TextStyle(fontSize: 16,)
              ),
            ],
          ],
        ),
      ),
    );
  }
}
