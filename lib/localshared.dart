import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:me_fitness/object.dart';
import 'package:me_fitness/variables.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalShared {
  static Future<Exercise> readByDay(String day) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? jsonExercise = prefs.getString(day);
    Map<String, dynamic> userMap = jsonDecode(jsonExercise ?? "") as Map<String, dynamic>;
    Exercise exercise = Exercise(userMap['Day'], userMap['Name'], userMap['Reps'], userMap['Sets'], userMap['Description']);
    return exercise;
  }

  static Future<List<Exercise>> readAll() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<String>? listOfDays = prefs.getStringList(Variables.daysKey);
    List<Exercise> listOfExercises = [];
    for (String day in listOfDays ?? [""]) {
      if (day.isNotEmpty) {
        listOfExercises.add(readByDay(day) as Exercise);
      }
    }
    return listOfExercises;
  }

  static Future<List<String>?> readListOfExercisesForWeights() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(Variables.weightStatsKey);
  }

  static Future<List<String>?> readWeightHistoryForExercise() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(Variables.weightStatsKey);
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

  static Future<void> updateListOfExercisesForWeights(String exerciseName) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> listOfExercises = readListOfExercisesForWeights() as List<String>;
    if (!listOfExercises.contains(exerciseName)) {
      listOfExercises.add(exerciseName);
      await prefs.setStringList(Variables.weightStatsKey, listOfExercises);
    }
  }

  static Future<void> updateWeightHistoryForExercise(String exerciseName, String updatedWeight) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> listOfExercises = readListOfExercisesForWeights() as List<String>;
    if (!listOfExercises.contains(exerciseName)) {
      listOfExercises.add(exerciseName);
      await prefs.setStringList(Variables.weightStatsKey, listOfExercises);
    }
  }

  static Future<void> delete(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }

  static Future<void> deleteAll() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }
}