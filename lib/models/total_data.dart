// To parse this JSON data, do
//
//     final totalData = totalDataFromJson(jsonString);

import 'dart:convert';

List<TotalData> totalDataFromJson(String str) =>
    List<TotalData>.from(json.decode(str).map((x) => TotalData.fromJson(x)));

String totalDataToJson(List<TotalData> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TotalData {
  String subjectName;
  String tutorList;
  String centerMark;
  String color;
  String totalMark;
  String boxHeight;
  int subjectId;
  int queryId;
  int ticketInfoType;
  List<Exam> exams;

  TotalData({
    required this.subjectName,
    required this.tutorList,
    required this.centerMark,
    required this.color,
    required this.totalMark,
    required this.boxHeight,
    required this.subjectId,
    required this.queryId,
    required this.ticketInfoType,
    required this.exams,
  });

  factory TotalData.fromJson(Map<String, dynamic> json) => TotalData(
        subjectName: json["subjectName"],
        tutorList: json["tutorList"],
        centerMark: json["centerMark"],
        color: json["color"],
        totalMark: json["totalMark"],
        boxHeight: json["box_height"],
        subjectId: json["subjectID"],
        queryId: json["queryID"],
        ticketInfoType: json["ticketInfoType"],
        exams: List<Exam>.from(json["exams"].map((x) => Exam.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "subjectName": subjectName,
        "tutorList": tutorList,
        "centerMark": centerMark,
        "color": color,
        "totalMark": totalMark,
        "box_height": boxHeight,
        "subjectID": subjectId,
        "queryID": queryId,
        "ticketInfoType": ticketInfoType,
        "exams": List<dynamic>.from(exams.map((x) => x.toJson())),
      };
}

class Exam {
  String name;
  String mark;

  Exam({
    required this.name,
    required this.mark,
  });

  factory Exam.fromJson(Map<String, dynamic> json) => Exam(
        name: json["name"],
        mark: json["mark"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "mark": mark,
      };
}
