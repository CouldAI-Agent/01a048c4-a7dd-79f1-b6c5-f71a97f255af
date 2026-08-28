enum UserRole { hr, employee }

class AuthProvider extends ChangeNotifier {
  bool _isAuthenticated = false;
  UserRole? _userRole;
  String? _userId;

  bool get isAuthenticated => _isAuthenticated;
  UserRole? get userRole => _userRole;
  String? get userId => _userId;

  Future<bool> login(String email, String password) async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 500));

    if (email == 'hr@marzimedia.com' && password == 'password') {
      _isAuthenticated = true;
      _userRole = UserRole.hr;
      _userId = 'hr_1';
      notifyListeners();
      return true;
    } else if (email == 'employee@marzimedia.com' && password == 'password') {
      _isAuthenticated = true;
      _userRole = UserRole.employee;
      _userId = 'emp_1';
      notifyListeners();
      return true;
    }
    return false;
  }

  void logout() {
    _isAuthenticated = false;
    _userRole = null;
    _userId = null;
    notifyListeners();
  }
}
