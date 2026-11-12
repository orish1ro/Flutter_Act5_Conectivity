// DemoAuth is a simple fake login system (no database needed).
// "static" means we can use it anywhere without creating an object,
// for example: DemoAuth.login('admin', 'admin123')
class DemoAuth {
  // These store ONE registered account while the app is running.
  // They become empty again when you restart the app.
  static String? registeredUsername;
  static String? registeredPassword;

  // Returns true if the username/password is correct.
  static bool login(String username, String password) {
    // The built-in admin account always works.
    final isAdmin = username == 'admin' && password == 'admin123';

    // Or it matches the account made on the Register screen.
    final isRegistered = registeredUsername != null &&
        username == registeredUsername &&
        password == registeredPassword;

    return isAdmin || isRegistered;
  }

  // Saves a new account (replaces the previous one).
  static void register(String username, String password) {
    registeredUsername = username;
    registeredPassword = password;
  }
}