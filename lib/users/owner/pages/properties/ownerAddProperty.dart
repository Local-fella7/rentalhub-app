import 'package:flutter/material.dart';
import 'ownerProperties.dart';

class OwnerAddProperty extends StatefulWidget {
  const OwnerAddProperty({super.key});

  @override
  State<OwnerAddProperty> createState() => _OwnerAddPropertyState();
}

class _OwnerAddPropertyState extends State<OwnerAddProperty> {
  final _formKey = GlobalKey<FormState>();

  // Form fields
  String description = '';
  String price = '';
  String location = '';
  bool isRented = false;
  String imagePath = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
              centerTitle: true,
              title: const Text('Add Property'),
        backgroundColor: Colors.lightBlue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'Description'),
                onSaved: (value) {
                  description = value!;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Price'),
                onSaved: (value) {
                  price = value!;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Location'),
                onSaved: (value) {
                  location = value!;
                },
              ),
              SwitchListTile(
                title: const Text('Is Rented?'),
                value: isRented,
                onChanged: (value) {
                  setState(() {
                    isRented = value;
                  });
                },
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Image Path'),
                onSaved: (value) {
                  imagePath = value!;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    final newProperty = Property(
                      description: description,
                      price: price,
                      location: location,
                      isRented: isRented,
                      imagePath: imagePath,
                    );
                    Navigator.pop(context, newProperty);
                  }
                },
                child: const Text('Add Property'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
