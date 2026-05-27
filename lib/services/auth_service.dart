import 'dart:convert';
import 'package:flutter_auth/models/user_model.dart';
import 'package:flutter_auth/models/auth_response.dart';
import 'package:flutter_auth/utils/storage_helper.dart';
import 'package:flutter_auth/constants/app_constants.dart';
import 'package:http/http.dart' as http;

class AuthService {
  // For REST API implementation, uncomment and use http client
  // late http.Client _httpClient;

  // For Firebase implementation
  // late FirebaseAuth _firebaseAuth;

  UserModel? _currentUser;

  UserModel? get currentUser => _currentUser;

  AuthService() {
    // _httpClient = http.Client();
    // _firebaseAuth = FirebaseAuth.instance;
  }

  /// Register new user
  Future<AuthResponse> register({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
    required String phoneNumber,
  }) async {
    try {
      // TODO: Implement actual registration with your backend
      // For now, we'll simulate the response
      
      final UserModel newUser = UserModel(
        id: 'user_${DateTime.now().millisecondsSinceEpoch}',
        email: email,
        firstName: firstName,
        lastName: lastName,
        phoneNumber: phoneNumber,
        profileImageUrl: '',
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      _currentUser = newUser;
      await StorageHelper.saveUserData(jsonEncode(newUser.toJson()));
      await StorageHelper.setLoggedIn(true);

      return AuthResponse(
        success: true,
        message: AppConstants.registerSuccess,
        data: newUser.toJson(),
      );
    } catch (e) {
      return AuthResponse(
        success: false,
        message: e.toString(),
        errorCode: 'REGISTER_ERROR',
      );
    }
  }

  /// Login user
  Future<AuthResponse> login({
    required String email,
    required String password,
  }) async {
    try {
      // TODO: Implement actual login with your backend
      // For now, we'll simulate the response

      final UserModel loginUser = UserModel(
        id: 'user_123',
        email: email,
        firstName: 'John',
        lastName: 'Doe',
        phoneNumber: '+1234567890',
        profileImageUrl: '',
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      _currentUser = loginUser;
      await StorageHelper.saveUserData(jsonEncode(loginUser.toJson()));
      await StorageHelper.setLoggedIn(true);

      return AuthResponse(
        success: true,
        message: AppConstants.loginSuccess,
        data: loginUser.toJson(),
      );
    } catch (e) {
      return AuthResponse(
        success: false,
        message: e.toString(),
        errorCode: 'LOGIN_ERROR',
      );
    }
  }

  /// Update password
  Future<AuthResponse> updatePassword({
    required String currentPassword,
    required String newPassword,
  }) async {
    try {
      if (_currentUser == null) {
        return AuthResponse(
          success: false,
          message: 'User not logged in',
          errorCode: 'NOT_LOGGED_IN',
        );
      }

      // TODO: Implement actual password update with your backend

      return AuthResponse(
        success: true,
        message: AppConstants.passwordUpdateSuccess,
      );
    } catch (e) {
      return AuthResponse(
        success: false,
        message: e.toString(),
        errorCode: 'PASSWORD_UPDATE_ERROR',
      );
    }
  }

  /// Update user profile
  Future<AuthResponse> updateProfile({
    required String firstName,
    required String lastName,
    required String phoneNumber,
    String? profileImagePath,
  }) async {
    try {
      if (_currentUser == null) {
        return AuthResponse(
          success: false,
          message: 'User not logged in',
          errorCode: 'NOT_LOGGED_IN',
        );
      }

      String profileImageUrl = _currentUser!.profileImageUrl;

      // TODO: Upload profile image if provided
      if (profileImagePath != null && profileImagePath.isNotEmpty) {
        // profileImageUrl = await _uploadProfileImage(profileImagePath);
      }

      final updatedUser = _currentUser!.copyWith(
        firstName: firstName,
        lastName: lastName,
        phoneNumber: phoneNumber,
        profileImageUrl: profileImageUrl,
        updatedAt: DateTime.now(),
      );

      _currentUser = updatedUser;
      await StorageHelper.saveUserData(jsonEncode(updatedUser.toJson()));

      return AuthResponse(
        success: true,
        message: AppConstants.profileUpdateSuccess,
        data: updatedUser.toJson(),
      );
    } catch (e) {
      return AuthResponse(
        success: false,
        message: e.toString(),
        errorCode: 'PROFILE_UPDATE_ERROR',
      );
    }
  }

  /// Logout user
  Future<AuthResponse> logout() async {
    try {
      _currentUser = null;
      await StorageHelper.clearAll();

      return AuthResponse(
        success: true,
        message: AppConstants.logoutSuccess,
      );
    } catch (e) {
      return AuthResponse(
        success: false,
        message: e.toString(),
        errorCode: 'LOGOUT_ERROR',
      );
    }
  }

  /// Load user from local storage
  Future<void> loadUserFromStorage() async {
    try {
      final userData = StorageHelper.getUserData();
      if (userData != null) {
        _currentUser = UserModel.fromJson(jsonDecode(userData));
      }
    } catch (e) {
      _currentUser = null;
    }
  }

  /// Check if user is logged in
  bool get isLoggedIn => _currentUser != null && StorageHelper.isLoggedIn();
}
