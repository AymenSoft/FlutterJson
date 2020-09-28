
class UserModel{

  int index;
  String about;
  String name;
  String picture;
  String company;
  String email;

  UserModel({this.index, this.about, this.name, this.picture, this.company, this.email});

  factory UserModel.fromMap(Map<String, dynamic>map){
    UserModel user = UserModel(
      index: map["index"],
      about: map["about"],
      name: map["name"],
      picture: map["picture"],
      company: map["company"],
      email: map["email"]
    );
    return user;
  }


}