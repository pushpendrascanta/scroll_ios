class ChatMessage {
  String? id;
  String? messageType;
  String? messageText;
  String? sentBy;
  String? selectedChoice;
  bool isSelected = false;
  bool didVideoEnded = false;

  ChatMessage(
      {required this.messageType,
      this.selectedChoice = '',
      required this.messageText,
      this.sentBy = "receiver",
      required this.isSelected,
      required this.didVideoEnded,
      this.id = ''});

  ChatMessage.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    messageText = json['messageText'].toString();
    messageType = json['messageType'].toString();
    sentBy = json['sentBy'].toString();
    selectedChoice = json['selectedChoice'].toString();
    didVideoEnded = json['didVideoEnded'];
    isSelected = json['isSelected'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['messageText'] = messageText;
    data['messageType'] = messageType;
    data['sentBy'] = sentBy;
    data['selectedChoice'] = selectedChoice;
    data['didVideoEnded'] = didVideoEnded;
    data['isSelected'] = isSelected;

    return data;
  }
}
