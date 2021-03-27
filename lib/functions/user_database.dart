import 'package:firebase_database/firebase_database.dart';
import 'package:fintech_folio/constants.dart';

class UserDatabase {
  DatabaseReference _userRef;
  String _id;

  UserDatabase(String id) {
    this._id = id;
    this._userRef = FirebaseDatabase.instance.reference().child('users').child(this._id);
  }

  Future<String> getName() async {
    String name = (await _userRef.child("name").once()).value;
    return name;
  }

  //If name already there, then just do an update
  Future<void> setName (String name) async {
    String nameInDatabase = await this.getName();

    //then set the name
    if (nameInDatabase == null) {
      _userRef.set({
        'name': name
      });
    } else {
      //just update the name
      _userRef.update({
        'name': name
      });
    }
  }

  Future<int> getAge() async {
    int age = (await _userRef.child("age").once()).value;
    return age;
  }

  //If age already there, then just do an update
  Future<void> setAge (int age) async {
    int ageInDatabase = await this.getAge();

    //then set the name
    if (ageInDatabase == null) {
      _userRef.set({
        "age": age
      });
    } else {
      //just update the name
      _userRef.update({
        'age': age
      });
    }
  }

  //For now the duration is in months lah hah
  void setGoal (String title, String category, int duration, int money) {
    if (!kSupportedCategory.contains(category)) {
      throw Exception("Goal Category not supported");
    }

    _userRef.child("goals").child(category).child(title).set({
      "title": title,
      "duration": duration,
      "money": money
    });
  }

  Future<Map> getGoal() async {
    return (await _userRef.child("goals").once()).value;
  }

  void setExpenditure (String title, String category, int money) {
    if (!kSupportedCategory.contains(category)) {
      throw Exception("Expenditure Category not supported");
    }

    _userRef.child("expenditures").child(category).child(title).set({
      "title": title,
      "money": money
    });
  }

  Future<Map> getExpenditure() async {
      return (await _userRef.child("expenditures").once()).value;
  }
}