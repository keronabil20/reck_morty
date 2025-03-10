
class Character {
  late int character_Id;
  late String name;
  late String status;
  late String image;
  late List<dynamic> episodes;
  late String gender;
  late String species;

  Character.fromJson(Map<String, dynamic> json) {
    character_Id = json["id"];
    name = json["name"];
    status = json["status"];
    image = json["image"];
    episodes = json["episode"];
    gender = json["gender"];
    species = json["species"];
  }
}
