class ModelUser
{
  String? name;
  String? email;
  String? phone;
  String? uid;
  String? image;
  String? coverimage;
  String? bio;
  ModelUser(
      this.uid,
      this.image,
      this.phone,
      this.email,
      this.name,
      this.bio,
      this.coverimage
      );
  ModelUser.fromJson( Map<String,dynamic> json)
  {
    name = json["name"];
    email = json["email"];
    phone = json["phone"];
    uid = json["uid"];
    image = json["image"];
    coverimage = json["coverimage"];
    bio = json["bio"];
  }
  Map<String,dynamic> toMap()
  {
    return
      {
        "name":name,
        "email":email,
        "phone":phone,
        "uid":uid,
        "image":image,
        "coverimage":coverimage,
        "bio":bio
      };
  }
}