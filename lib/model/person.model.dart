class Person {
  String? name;
  int? age;
  String? email;
  // Person(this.name, this.email, this.age);
  Person(this.name, this.age, this.email);
  String getName() {
    return name!;
  }

  String getemail() {
    return email!;
  }

  int getage() {
    return age!;
  }

  void setName(String name) {
    this.name = name;
  }

  void setemail(String email) {
    this.email = email;
  }

  void setage(int age) {
    this.age = age;
  }
}
