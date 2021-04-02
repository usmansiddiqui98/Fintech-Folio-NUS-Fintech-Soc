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

  //This one is just for testing purposes
  test() async {
    //Pass in the unique id, "2" is the id for this user for testing
    UserDatabase userdb = new UserDatabase("3");
    //set name and age, if name and age not there yet, will add in, if not
    //if will update name and age
    userdb.setName("Cuong");
    userdb.setAge(21);
    //get back name and age, this will return Future type, so needa know how to
    //work with future type.
    //print(await userdb.getName());
    //print(await userdb.getAge());

    //This is used to add goal and expenditure,
    //the list of supportet category is under lib/constants.dart file
    //if the category is not supported, exception will be thrown
    userdb.setGoal("NUS Tuition Fee", "Education", 10, 10000);
    userdb.setGoal("Tembusu Fee", "Education", 20, 800);
    userdb.setGoal("BMW", "Transportation", 15, 1400);

    userdb.setExpenditure("Monthly MRT", "Transportation", 800);
    userdb.setExpenditure("Vietnam Trip", "Travel", 300);
    userdb.setExpenditure("Ipad", "Technology", 250);
    userdb.setExpenditure("Xbox", "Technology", 200);
    userdb.setExpenditure("Guitar", "Hobbies", 500);

    //Get goal and expediture will return Future<Map>
    //print(await userdb.getGoal());
    print(await userdb.getExpenditure());
  }
}