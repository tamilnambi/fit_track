# FitTrack
 FitTrack is a streamlined fitness tracking application aimed at providing users with an easy and efficient way to monitor their daily physical activities.

 It is built on Flutter with Firebase authentication, Firestore database, and Flutter's provider state management system.

 # Features Implemented

1. User Account and Authentication
    * User registration, Forgot password, and login functionality.
    * Firebase Authentication for secure user account management.

2. Activity Tracker
    * Tracks daily activity for walking, running, and cycling.
    * Data is stored in Shared Preferences to avoid loss of data when the app is closed.

 3. Goal Setting
    * User can set goals for all three activities and set duration as daily, weekly, or monthly.
    * Circular Progress bar to show the user's daily achievements.
    * Provider for state management to update user goals and achievements in real time.

  # Known Issues

  * While setting a goal, if the text field is out of focus after entering input, input gets erased.
  * While displaying the stored goals, FutureBuilder throws Exception.

 # Screenshots

 

