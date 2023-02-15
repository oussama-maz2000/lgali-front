class UserModel {
String? _firstName;
String? _lastName;
String? _email;
String? _phone;

UserModel();

String getPhone(){
  return _phone!;
}

  setPhone(String phone) {
    _phone = phone;
  }

  String getEmail(){
    return _email!;
  }

  setEmail(String email) {
    _email = email;
  }

  String getLastName () { return _lastName!;}

  setLastName(String lastName) {
    _lastName = lastName;
  }

  String getFirstName (){ return _firstName!;}

  setFirstName(String firstName) {
    _firstName = firstName;
  }
}
