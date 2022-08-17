class LoginController {
  Future<bool> login(String user, String pass) async {
    return user == 'adm' && pass == '123';
  }
}
