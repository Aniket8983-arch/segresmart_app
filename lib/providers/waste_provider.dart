import 'dart:async';
import 'package:flutter/foundation.dart';
import '../models/waste_bin.dart';
import '../services/fake_api.dart';

class WasteProvider extends ChangeNotifier {
  List<WasteBin> bins = [];
  int points = 120;
  List<String> alerts = [];

  Timer? _timer;

  // load initial (fake) data
  Future<void> loadInitialData() async {
    bins = await FakeApi.fetchBins();
    notifyListeners();
  }

  // simulate adding waste from UI
  Future<void> simulateAddWaste(String id, int addPercent) async {
    final i = bins.indexWhere((b) => b.id == id);
    if (i == -1) return;

    bins[i].level = (bins[i].level + addPercent).clamp(0, 100);
    bins[i].updatedAt = DateTime.now();

    if (bins[i].level >= 85) {
      final msg = '${bins[i].name} is almost full!';
      if (!alerts.contains(msg)) alerts.add(msg);
    }

    points += 5; // reward for correct segregation
    notifyListeners();
  }

  // auto-refresh to simulate IoT updates (fills bins slowly)
  void autoRefresh() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 10), (_) {
      for (var b in bins) {
        // small random-ish increment (deterministic here)
        b.level = (b.level + 5).clamp(0, 100);
        b.updatedAt = DateTime.now();
        if (b.level >= 85) {
          final msg = '${b.name} is almost full!';
          if (!alerts.contains(msg)) alerts.add(msg);
        }
      }
      // passive point accrual
      points += 1;
      notifyListeners();
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
