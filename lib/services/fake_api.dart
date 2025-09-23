import 'dart:async';
import '../models/waste_bin.dart';

class FakeApi {
  static Future<List<WasteBin>> fetchBins() async {
    // simulate a delay like calling a server
    await Future.delayed(const Duration(milliseconds: 500));

    return [
      WasteBin(id: 'b1', name: 'Organic Bin', type: 'Organic', level: 65),
      WasteBin(id: 'b2', name: 'Recyclables Bin', type: 'Recyclable', level: 32),
      WasteBin(id: 'b3', name: 'Hazardous Bin', type: 'Hazardous', level: 10),
    ];
  }
}
