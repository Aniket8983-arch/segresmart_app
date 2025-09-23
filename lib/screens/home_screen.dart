import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/waste_provider.dart';
import '../widgets/waste_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<WasteProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("SegreSmart Dashboard"),
        centerTitle: true,
      ),
      body: prov.bins.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    "Welcome to SegreSmart 👋\nTrack and manage waste bins in real-time.",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                ),

                // Dashboard summary
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Card(
                    elevation: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              const Icon(Icons.delete, color: Colors.green),
                              const SizedBox(height: 6),
                              Text("Bins: ${prov.bins.length}"),
                            ],
                          ),
                          Column(
                            children: [
                              const Icon(Icons.warning, color: Colors.orange),
                              const SizedBox(height: 6),
                              Text("Alerts: ${prov.alerts.length}"),
                            ],
                          ),
                          Column(
                            children: [
                              const Icon(Icons.star, color: Colors.blue),
                              const SizedBox(height: 6),
                              Text("Points: ${prov.points}"),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  child: Text(
                    "Nearby Waste Bins",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 8),

                // Bin list
                Expanded(
                  child: ListView(
                    children: prov.bins.map((bin) {
                      return WasteCard(
                        bin: bin,
                        onAddWaste: () => prov.simulateAddWaste(bin.id, 10),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
    );
  }
}
