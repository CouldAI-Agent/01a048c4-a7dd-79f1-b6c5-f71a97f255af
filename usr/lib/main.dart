import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/auth_provider.dart';
import 'providers/hr_provider.dart';
import 'providers/employee_provider.dart';

import 'screens/auth/login_screen.dart';
import 'screens/hr/hr_dashboard_screen.dart';
import 'screens/employee/employee_dashboard_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => HrProvider()),
        ChangeNotifierProvider(create: (_) => EmployeeProvider()),
      ],
      child: const MarziMediaHRApp(),
    ),
  );
}

class MarziMediaHRApp extends StatelessWidget {
  const MarziMediaHRApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MARZI MEDIA HR',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF1976D2), // Blue theme
          primary: const Color(0xFF1976D2),
          secondary: const Color(0xFF0D47A1),
          background: const Color(0xFFF5F7FA),
          surface: Colors.white,
        ),
        scaffoldBackgroundColor: const Color(0xFFF5F7FA),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF1976D2),
          foregroundColor: Colors.white,
          elevation: 0,
        ),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const AuthWrapper(),
        '/login': (context) => const LoginScreen(),
        '/hr-dashboard': (context) => const HrDashboardScreen(),
        '/employee-dashboard': (context) => const EmployeeDashboardScreen(),
      },
    );
  }
}

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, auth, _) {
        if (!auth.isAuthenticated) {
          return const LoginScreen();
        }
        if (auth.userRole == UserRole.hr) {
          return const HrDashboardScreen();
        } else {
          return const EmployeeDashboardScreen();
        }
      },
    );
  }
}
