import 'package:flutter/material.dart';

class OwnerTenantList extends StatefulWidget {
  const OwnerTenantList({Key? key}) : super(key: key);

  @override
  State<OwnerTenantList> createState() => _OwnerTenantListState();
}

class _OwnerTenantListState extends State<OwnerTenantList> {
  final List<Tenant> _tenants = [
    Tenant(
      name: "Ernest Ephraim",
      location: "Arusha",
      phone: "0663399247",
      rented: true,
      duration: "6 months",
    ),
    Tenant(
      name: "Mpangaji",
      location: "Sakina",
      phone: "0745456734",
      rented: false,
      duration: "",
    ),
    // Add more tenants as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Tenants'),
        centerTitle: true,
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: ListView.builder(
        itemCount: _tenants.length,
        itemBuilder: (context, index) {
          final tenant = _tenants[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 4,
              child: ListTile(
                title: Text(tenant.name),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        const Icon(Icons.location_on),
                        const SizedBox(width: 5),
                        Text('Location: ${tenant.location}'),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        const Icon(Icons.phone),
                        const SizedBox(width: 5),
                        Text('Phone: ${tenant.phone}'),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        const Icon(Icons.info),
                        const SizedBox(width: 5),
                        Text('Status: ${tenant.rented ? "Rented" : "Negotiating"}'),
                      ],
                    ),
                    if (tenant.rented)
                      Row(
                        children: [
                          const Icon(Icons.access_time),
                          const SizedBox(width: 5),
                          Text('Duration: ${tenant.duration}'),
                        ],
                      ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class Tenant {
  final String name;
  final String location;
  final String phone;
  final bool rented;
  final String duration;

  Tenant({
    required this.name,
    required this.location,
    required this.phone,
    required this.rented,
    required this.duration,
  });
}
