import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class HistoryRepository {
  Future<List<Map<String, dynamic>>> getHistory() async {
    // Retrieve userId from SharedPreferences
    // final prefs = await SharedPreferences.getInstance();
    // final userId = prefs.getInt('userId');
    // debugPrint('===HistoryRepository userId: $userId');

    // if (userId == null) {
    //   throw Exception('User ID not found in SharedPreferences');
    // }
    const userId = 1; 

    final url = Uri.parse('https://z94n3sz2-80.asse.devtunnels.ms/history?userid=$userId');
    final response = await http.get(url);
    debugPrint('===HistoryRepository response: ${response.body}');

    if (response.statusCode == 200) {
      final responseBody = jsonDecode(response.body);
      final predictions = List<Map<String, dynamic>>.from(responseBody['predictions']);
      return predictions;
    } else {
      throw Exception('Failed to fetch history: ${response.statusCode} - ${response.reasonPhrase}');
    }
  }
}