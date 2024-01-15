import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ActivityProvider with ChangeNotifier {
  int _stepCount = 0;
  int _runningCount = 0;
  int _cyclingCount = 0;
  double _walkingDistance = 0.0;
  double _runningDistance = 0.0;
  double _cyclingDistance = 0.0;

  int get stepCount => _stepCount;
  int get runningCount => _runningCount;
  int get cyclingCount => _cyclingCount;
  double get walkingDistance => _walkingDistance;
  double get runningDistance => _runningDistance;
  double get cyclingDistance => _cyclingDistance;

  Duration sensorInterval = SensorInterval.normalInterval;
  StreamSubscription<UserAccelerometerEvent>? _accelerometerSubscription;

  ActivityProvider() {
    // Initialize sensor listeners
    startSensorListening();
    loadActivityData();
  }

  void loadActivityData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _stepCount = prefs.getInt('stepCount') ?? 0;
    _runningCount = prefs.getInt('runningCount') ?? 0;
    _cyclingCount = prefs.getInt('cyclingCount') ?? 0;

    _walkingDistance = prefs.getDouble('walkingDistance') as double ?? 0.0;
    _runningDistance = prefs.getDouble('runningDistance') as double ?? 0.0;
    _cyclingDistance = prefs.getDouble('cyclingDistance') as double ?? 0.0;
    notifyListeners();
  }

  void startSensorListening() {
    userAccelerometerEventStream(samplingPeriod: sensorInterval).listen((UserAccelerometerEvent event) {
          detectActivity(event);
  });
        }

  void detectActivity(UserAccelerometerEvent event) {
    double acceleration = event.x * event.x + event.y * event.y + event.z * event.z;
    double walkingThreshold = 25.0; // Adjust this threshold based on your testing
    double runningThreshold = 50.0; // Adjust this threshold based on your testing
    double cyclingThreshold = 80.0; // Adjust this threshold based on your testing

    if (acceleration > cyclingThreshold) {
      _cyclingCount++;
    } else if (acceleration > runningThreshold) {
      _runningCount++;
    } else if (acceleration > walkingThreshold) {
      _stepCount++;
    }

    _walkingDistance = _stepCount * 0.75 / 1000.0;
    _runningDistance = _runningCount * 0.75 / 1000.0;
    _cyclingDistance = _cyclingCount * 0.75 / 1000.0;

    saveActivityData();
    // Notify listeners when activity data changes
    notifyListeners();
  }

  void saveActivityData() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('stepCount', _stepCount);
    prefs.setInt('runningCount', _runningCount);
    prefs.setInt('cyclingCount', _cyclingCount);

    prefs.setDouble('walkingDistance', _walkingDistance);
    prefs.setDouble('runningDistance', _runningDistance);
    prefs.setDouble('cyclingDistance', _cyclingDistance);
  }

}
