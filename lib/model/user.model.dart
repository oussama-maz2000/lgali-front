class Person {
  String? _personID;
  String? _firstName;
  String? _lastName;
  String? _email;
  String? _phone;

  Person();

  String getID() {
    return _personID!;
  }

  setID(String? id) {
    _personID = id;
  }

  String getPhone() {
    return _phone!;
  }

  setPhone(String? phone) {
    _phone = phone;
  }

  String getEmail() {
    return _email!;
  }

  setEmail(String? email) {
    _email = email;
  }

  String getLastName() {
    return _lastName!;
  }

  setLastName(String? lastName) {
    _lastName = lastName;
  }

  String getFirstName() {
    return _firstName!;
  }

  setFirstName(String? firstName) {
    _firstName = firstName;
  }

  @override
  String toString() {
    return 'Person{_personID: $_personID, _firstName: $_firstName, _lastName: $_lastName, _email: $_email, _phone: $_phone}';
  }
}
