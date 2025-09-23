import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/waste_provider.dart';

class RewardsScreen extends StatelessWidget {
  const RewardsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<WasteProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Rewards"),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Your Points: ${prov.points}",
                style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              const Text(
                "Keep segregating waste to earn more 🌱",
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 24),
              LinearProgressIndicator(
                value: (prov.points / 500).clamp(0.0, 1.0),
                color: Colors.green,
                backgroundColor: Colors.grey[300],
                minHeight: 10,
              ),
              const SizedBox(height: 8),
              const Text("Goal: 500 points for your next eco-reward"),
              const SizedBox(height: 24),
              const Text(
                "Tip: Every correct disposal event earns points. Keep at it!",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
