class AppConstants {
  // API Configuration
  static const String baseUrl = 'https://api.example.com';
  static const String apiTimeout = '30';

  // Firebase Configuration
  static const String firebaseProjectId = 'your-project-id';

  // Validation Constants
  static const int minPasswordLength = 8;
  static const int maxPasswordLength = 20;
  static const int minNameLength = 2;
  static const int maxNameLength = 50;

  // Regex Patterns
  static const String emailPattern =
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
  static const String phonePattern = r'^[0-9]{10,15}$';
  static const String passwordPattern =
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';

  // SharedPreferences Keys
  static const String userTokenKey = 'user_token';
  static const String userDataKey = 'user_data';
  static const String isLoggedInKey = 'is_logged_in';
  static const String rememberMeKey = 'remember_me';

  // Error Messages
  static const String invalidEmail = 'Please enter a valid email address';
  static const String invalidPassword =
      'Password must be at least 8 characters, contain uppercase, lowercase, number and special character';
  static const String passwordMismatch = 'Passwords do not match';
  static const String networkError = 'Network error. Please try again.';
  static const String unknownError = 'An unknown error occurred';
  static const String sessionExpired = 'Your session has expired. Please login again.';

  // Success Messages
  static const String loginSuccess = 'Login successful!';
  static const String registerSuccess = 'Account created successfully!';
  static const String passwordUpdateSuccess = 'Password updated successfully!';
  static const String profileUpdateSuccess = 'Profile updated successfully!';
  static const String logoutSuccess = 'Logged out successfully!';
}
