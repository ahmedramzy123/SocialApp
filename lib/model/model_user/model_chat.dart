class ModelChat
{
  String? text;
  String? dateTime;
  String? receiverId;
  String? senderId;
  ModelChat(
      this.senderId,
      this.receiverId,
      this.dateTime,
      this.text
      );
  ModelChat.fromJson(Map<String,dynamic> json)
  {
    text = json["text"];
    dateTime = json["dateTime"];
    receiverId = json["receiverId"];
    senderId = json["senderId"];
  }
    Map<String,dynamic> toMap()
    {
      return
        {
          "text":text,
          "dateTime":dateTime,
          "receiverId":receiverId,
          "senderId":senderId,
        };
    }
  }
