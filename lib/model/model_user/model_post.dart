class ModelPost
{
  String? name;
  String? text;
  String? uid;
  String? profileimage;
  String? postimage;
  String? date;
  ModelPost(
      this.uid,
      this.profileimage,
      this.text,
      this.name,
      this.date,
      this.postimage
      );
  ModelPost.fromJson( Map<String,dynamic> json)
  {
    name = json["name"];
    text = json["text"];
    uid = json["uid"];
    profileimage = json["profileimage"];
    date = json["date"];
    postimage = json["postimage"];
  }
  Map<String,dynamic> toMap()
  {
    return
      {
        "name":name,
        "text":text,
        "uid":uid,
        "profileimage":profileimage,
        "date":date,
        "postimage":postimage
      };
  }
}