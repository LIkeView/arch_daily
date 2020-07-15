// To parse this JSON data, do
//
//     final listEvent = listEventFromJson(jsonString);

import 'dart:convert';

ListEvent listEventFromJson(String str) => ListEvent.fromJson(json.decode(str));

String listEventToJson(ListEvent data) => json.encode(data.toJson());

class ListEvent {
  ListEvent({
    this.resCode,
    this.resMessage,
    this.resData,
  });

  int resCode;
  String resMessage;
  ResData resData;

  factory ListEvent.fromJson(Map<String, dynamic> json) => ListEvent(
    resCode: json["res_code"],
    resMessage: json["res_message"],
    resData: ResData.fromJson(json["res_data"]),
  );

  Map<String, dynamic> toJson() => {
    "res_code": resCode,
    "res_message": resMessage,
    "res_data": resData.toJson(),
  };
}

class ResData {
  ResData({
    this.listEvent,
  });

  List<ListEventElement> listEvent;

  factory ResData.fromJson(Map<String, dynamic> json) => ResData(
    listEvent: List<ListEventElement>.from(json["list_event"].map((x) => ListEventElement.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "list_event": List<dynamic>.from(listEvent.map((x) => x.toJson())),
  };
}

class ListEventElement {
  ListEventElement({
    this.eventId,
    this.eventName,
    this.mainBanner,
    this.mainBannerPath,
    this.description,
    this.startDate,
    this.endDate,
    this.fees,
    this.maxContestant,
    this.winningPrize,
    this.status,
    this.createdDate,
    this.updatedDate,
  });

  String eventId;
  String eventName;
  String mainBanner;
  String mainBannerPath;
  String description;
  DateTime startDate;
  DateTime endDate;
  String fees;
  String maxContestant;
  WinningPrize winningPrize;
  Status status;
  DateTime createdDate;
  DateTime updatedDate;

  factory ListEventElement.fromJson(Map<String, dynamic> json) => ListEventElement(
    eventId: json["event_id"],
    eventName: json["event_name"],
    mainBanner: json["main_banner"],
    mainBannerPath: json["main_banner_path"],
    description: json["description"],
    startDate: DateTime.parse(json["start_date"]),
    endDate: DateTime.parse(json["end_date"]),
    fees: json["fees"],
    maxContestant: json["max_contestant"],
    winningPrize: winningPrizeValues.map[json["winning_prize"]],
    status: statusValues.map[json["status"]],
    createdDate: DateTime.parse(json["created_date"]),
    updatedDate: DateTime.parse(json["updated_Date"]),
  );

  Map<String, dynamic> toJson() => {
    "event_id": eventId,
    "event_name": eventName,
    "main_banner": mainBanner,
    "main_banner_path": mainBannerPath,
    "description": description,
    "start_date": startDate.toIso8601String(),
    "end_date": endDate.toIso8601String(),
    "fees": fees,
    "max_contestant": maxContestant,
    "winning_prize": winningPrizeValues.reverse[winningPrize],
    "status": statusValues.reverse[status],
    "created_date": createdDate.toIso8601String(),
    "updated_Date": updatedDate.toIso8601String(),
  };
}

enum Status { PREPARING, OPEN, CLOSE }

final statusValues = EnumValues({
  "Close": Status.CLOSE,
  "Open": Status.OPEN,
  "Preparing": Status.PREPARING
});

enum WinningPrize { CHAMPIONSHIP_BELT, EMPTY }

final winningPrizeValues = EnumValues({
  "championship belt": WinningPrize.CHAMPIONSHIP_BELT,
  "": WinningPrize.EMPTY
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
