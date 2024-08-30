import 'package:get/get.dart';
import 'package:medical_audios/views/Cardiology/cardiology_screen.dart';

// Import your screens here
import 'package:medical_audios/views/Onboarding_Screen.dart';
import 'package:medical_audios/views/audio/audio_player_screen.dart';
import 'package:medical_audios/views/auth/Wwlcome_Screen.dart';
import 'package:medical_audios/views/auth/congrats_screen.dart';
import 'package:medical_audios/views/auth/login_screen.dart';
import 'package:medical_audios/views/auth/profession_screen.dart';
import 'package:medical_audios/views/auth/verification_screen.dart';
import 'package:medical_audios/views/dashboard/dashboard_screen.dart';
import 'package:medical_audios/views/dashboard/library_screen.dart';
import 'package:medical_audios/views/dashboard/profile_screen.dart';
import 'package:medical_audios/views/dashboard/search_screen.dart';
import 'package:medical_audios/views/auth/forgot_password.dart';
import 'package:medical_audios/views/auth/reset_password.dart';

import '../views/Cardiology/Cardio_screen.dart';

import '../views/Cardiology/Cardio_screen.dart';
import '../views/Cardiology/cardiology_content.dart';
import '../views/profile/account_ screen.dart';

class AppPages {
  static const String onboarding = '/Onboarding';
  static const String welcome = '/welcome';
  static const String professionalSignup = '/professional_signup';
  static const String login = '/login';
  static const String congrats = '/congrats';
  static const String emailVerification = '/email';
  static const String dashboard = '/dashboard';
  static const String cardio = '/cardio';
  static const String library = '/library';
  static const String profile = '/profile';
  static const String account = '/account';
  static const String cardiology = '/cardiology';
  static const String search = '/search';
  static const String audio = '/audio';
  static const String topics = '/topics';

  static final routes = [
    GetPage(name: onboarding, page: () => OnboardingScreen()),
    GetPage(name: welcome, page: () => WelcomeScreen()),
    GetPage(name: professionalSignup, page: () => ProfessionalSignupScreen()),
    GetPage(name: login, page: () => LoginScreen()),
    GetPage(name: congrats, page: () => CongratulationsScreen()),
    GetPage(name: emailVerification, page: () => EmailVerificationScreen()),
    GetPage(name: dashboard, page: () => DashboardPage()),
    GetPage(name: cardio, page: () => CardioScreen()),
    GetPage(name: library, page: () => LibraryScreen()),
    GetPage(name: profile, page: () => ProfileScreen()),
    GetPage(name: account, page: () => AccountScreen()),
    GetPage(name: cardiology, page: () => CardiologyPage()),
    GetPage(name: search, page: () => SearchScreen()),
    GetPage(name: topics, page: () => CardiologyContentScreen()),
    GetPage(name: audio, page: () => AudioPlayerScreen()),
  ];
}
