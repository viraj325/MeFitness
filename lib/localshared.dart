import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:me_fitness/object.dart';
import 'package:me_fitness/variables.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalShared {
  static Future<String> read() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    // Try reading data from the 'counter' key. If it doesn't exist, returns null.
    final int? counter = prefs.getInt('counter');
    // Try reading data from the 'repeat' key. If it doesn't exist, returns null.
    final bool? repeat = prefs.getBool('repeat');
    // Try reading data from the 'decimal' key. If it doesn't exist, returns null.
    final double? decimal = prefs.getDouble('decimal');
    // Try reading data from the 'action' key. If it doesn't exist, returns null.
    final String? action = prefs.getString('action');
    // Try reading data from the 'items' key. If it doesn't exist, returns null.
    final List<String>? items = prefs.getStringList('items');

    return "Some string";
  }

  static Future<void> writeWorkoutByDay(Exercise exercise) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    Map<String, dynamic> jsonExercise = {
      'Day': exercise.day,
      'Name': exercise.name,
      'Reps': exercise.reps,
      'Sets': exercise.sets,
      'Description': exercise.description
    };

    bool result = await prefs.setString(exercise.day as String, jsonEncode(jsonExercise));
    if (kDebugMode) {
      print("writeWorkoutByDay: $result");
    }
  }

  static Future<void> updateListOfDays(List<String> listOfDays) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(Variables.daysKey, listOfDays);
  }

  static Future<void> update() async {
    // Obtain shared preferences.
    final SharedPreferences prefs = await SharedPreferences.getInstance();
  }

  static Future<void> delete(String key) async {
    // Obtain shared preferences.
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }

  static Future<void> deleteAll() async {
    // Obtain shared preferences.
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }
}