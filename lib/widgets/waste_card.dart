import 'package:flutter/material.dart';
import '../models/waste_bin.dart';

class WasteCard extends StatelessWidget {
  final WasteBin bin;
  final VoidCallback onAddWaste;

  const WasteCard({super.key, required this.bin, required this.onAddWaste});

  Color _colorForType(String type) {
    switch (type) {
      case 'Organic':
        return Colors.brown;
      case 'Recyclable':
        return Colors.blue;
      case 'Hazardous':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    final color = _colorForType(bin.type);

    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title row
            Row(
              children: [
                Icon(Icons.delete, color: color, size: 40),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    bin.name,
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                Text(
                  "${bin.level}%",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: color),
                ),
              ],
            ),
            const SizedBox(height: 12),

            // Progress bar
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: LinearProgressIndicator(
                value: bin.level / 100,
                color: color,
                backgroundColor: Colors.grey[300],
                minHeight: 10,
              ),
            ),
            const SizedBox(height: 12),

            // Last updated + action
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Last updated: ${bin.updatedAt.hour.toString().padLeft(2, '0')}:${bin.updatedAt.minute.toString().padLeft(2, '0')}",
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
                ElevatedButton.icon(
                  onPressed: onAddWaste,
                  icon: const Icon(Icons.add),
                  label: const Text("Add Waste"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: color,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
