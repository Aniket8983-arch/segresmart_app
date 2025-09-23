import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/waste_provider.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<WasteProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Alerts"),
        centerTitle: true,
      ),
      body: prov.alerts.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.inbox, size: 80, color: Colors.grey),
                  SizedBox(height: 12),
                  Text(
                    "No alerts yet",
                    style: TextStyle(fontSize: 18, color: Colors.grey),
                  ),
                  SizedBox(height: 6),
                  Text(
                    "Your bins are in good condition 👍",
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            )
          : ListView(
              padding: const EdgeInsets.all(16),
              children: prov.alerts
                  .map((a) => Card(
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        child: ListTile(
                          leading: const Icon(Icons.warning, color: Colors.red),
                          title: Text(a),
                          subtitle: const Text(
                            "Generated automatically by SegreSmart system",
                            style: TextStyle(fontSize: 12, color: Colors.grey),
                          ),
                        ),
                      ))
                  .toList(),
            ),
    );
  }
}
