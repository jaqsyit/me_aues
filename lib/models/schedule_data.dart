// To parse this JSON data, do
//
//     final scheduleData = scheduleDataFromJson(jsonString);

import 'dart:convert';

ScheduleData scheduleDataFromJson(String str) => ScheduleData.fromJson(json.decode(str));

String scheduleDataToJson(ScheduleData data) => json.encode(data.toJson());

class ScheduleData {
    int selectedTerm;
    int selectedStudyYear;
    int selectedWeek;
    int activeTermNumber;
    int activeWeekNumber;
    DateTime startSemesterPeriod;
    DateTime finishSemesterPeriod;
    StudyYearTermMap studyYearTermMap;
    List<int> weekList;
    List<StudyYearListElement> termList;
    List<StudyYearListElement> studyYearList;
    List<int> days;
    List<LessonHour> lessonHours;
    bool isStudent;
    Timetable timetable;
    int studentId;
    bool parent;
    List<dynamic> childrenList;
    bool hasExamLicense;
    int defaultSelectedTerm;
    int defaultSelectedWeek;

    ScheduleData({
        required this.selectedTerm,
        required this.selectedStudyYear,
        required this.selectedWeek,
        required this.activeTermNumber,
        required this.activeWeekNumber,
        required this.startSemesterPeriod,
        required this.finishSemesterPeriod,
        required this.studyYearTermMap,
        required this.weekList,
        required this.termList,
        required this.studyYearList,
        required this.days,
        required this.lessonHours,
        required this.isStudent,
        required this.timetable,
        required this.studentId,
        required this.parent,
        required this.childrenList,
        required this.hasExamLicense,
        required this.defaultSelectedTerm,
        required this.defaultSelectedWeek,
    });

    factory ScheduleData.fromJson(Map<String, dynamic> json) => ScheduleData(
        selectedTerm: json["selectedTerm"],
        selectedStudyYear: json["selectedStudyYear"],
        selectedWeek: json["selectedWeek"],
        activeTermNumber: json["activeTermNumber"],
        activeWeekNumber: json["activeWeekNumber"],
        startSemesterPeriod: DateTime.parse(json["startSemesterPeriod"]),
        finishSemesterPeriod: DateTime.parse(json["finishSemesterPeriod"]),
        studyYearTermMap: StudyYearTermMap.fromJson(json["studyYearTermMap"]),
        weekList: List<int>.from(json["weekList"].map((x) => x)),
        termList: List<StudyYearListElement>.from(json["termList"].map((x) => StudyYearListElement.fromJson(x))),
        studyYearList: List<StudyYearListElement>.from(json["studyYearList"].map((x) => StudyYearListElement.fromJson(x))),
        days: List<int>.from(json["days"].map((x) => x)),
        lessonHours: List<LessonHour>.from(json["lessonHours"].map((x) => LessonHour.fromJson(x))),
        isStudent: json["isStudent"],
        timetable: Timetable.fromJson(json["timetable"]),
        studentId: json["studentID"],
        parent: json["parent"],
        childrenList: List<dynamic>.from(json["childrenList"].map((x) => x)),
        hasExamLicense: json["hasExamLicense"],
        defaultSelectedTerm: json["defaultSelectedTerm"],
        defaultSelectedWeek: json["defaultSelectedWeek"],
    );

    Map<String, dynamic> toJson() => {
        "selectedTerm": selectedTerm,
        "selectedStudyYear": selectedStudyYear,
        "selectedWeek": selectedWeek,
        "activeTermNumber": activeTermNumber,
        "activeWeekNumber": activeWeekNumber,
        "startSemesterPeriod": "${startSemesterPeriod.year.toString().padLeft(4, '0')}-${startSemesterPeriod.month.toString().padLeft(2, '0')}-${startSemesterPeriod.day.toString().padLeft(2, '0')}",
        "finishSemesterPeriod": "${finishSemesterPeriod.year.toString().padLeft(4, '0')}-${finishSemesterPeriod.month.toString().padLeft(2, '0')}-${finishSemesterPeriod.day.toString().padLeft(2, '0')}",
        "studyYearTermMap": studyYearTermMap.toJson(),
        "weekList": List<dynamic>.from(weekList.map((x) => x)),
        "termList": List<dynamic>.from(termList.map((x) => x.toJson())),
        "studyYearList": List<dynamic>.from(studyYearList.map((x) => x.toJson())),
        "days": List<dynamic>.from(days.map((x) => x)),
        "lessonHours": List<dynamic>.from(lessonHours.map((x) => x.toJson())),
        "isStudent": isStudent,
        "timetable": timetable.toJson(),
        "studentID": studentId,
        "parent": parent,
        "childrenList": List<dynamic>.from(childrenList.map((x) => x)),
        "hasExamLicense": hasExamLicense,
        "defaultSelectedTerm": defaultSelectedTerm,
        "defaultSelectedWeek": defaultSelectedWeek,
    };
}

class LessonHour {
    int number;
    String start;
    String finish;
    int shiftNumber;
    int displayNumber;
    int duration;

    LessonHour({
        required this.number,
        required this.start,
        required this.finish,
        required this.shiftNumber,
        required this.displayNumber,
        required this.duration,
    });

    factory LessonHour.fromJson(Map<String, dynamic> json) => LessonHour(
        number: json["number"],
        start: json["start"],
        finish: json["finish"],
        shiftNumber: json["shiftNumber"],
        displayNumber: json["displayNumber"],
        duration: json["duration"],
    );

    Map<String, dynamic> toJson() => {
        "number": number,
        "start": start,
        "finish": finish,
        "shiftNumber": shiftNumber,
        "displayNumber": displayNumber,
        "duration": duration,
    };
}

class StudyYearListElement {
    bool disabled;
    String label;
    int value;
    bool escape;
    bool noSelectionOption;

    StudyYearListElement({
        required this.disabled,
        required this.label,
        required this.value,
        required this.escape,
        required this.noSelectionOption,
    });

    factory StudyYearListElement.fromJson(Map<String, dynamic> json) => StudyYearListElement(
        disabled: json["disabled"],
        label: json["label"],
        value: json["value"],
        escape: json["escape"],
        noSelectionOption: json["noSelectionOption"],
    );

    Map<String, dynamic> toJson() => {
        "disabled": disabled,
        "label": label,
        "value": value,
        "escape": escape,
        "noSelectionOption": noSelectionOption,
    };
}

class StudyYearTermMap {
    List<int> the2023;

    StudyYearTermMap({
        required this.the2023,
    });

    factory StudyYearTermMap.fromJson(Map<String, dynamic> json) => StudyYearTermMap(
        the2023: List<int>.from(json["2023"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "2023": List<dynamic>.from(the2023.map((x) => x)),
    };
}

class Timetable {
    int maxPairsCount;
    Map<String, Day> days;

    Timetable({
        required this.maxPairsCount,
        required this.days,
    });

    factory Timetable.fromJson(Map<String, dynamic> json) => Timetable(
        maxPairsCount: json["maxPairsCount"],
        days: Map.from(json["days"]).map((k, v) => MapEntry<String, Day>(k, Day.fromJson(v))),
    );

    Map<String, dynamic> toJson() => {
        "maxPairsCount": maxPairsCount,
        "days": Map.from(days).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
    };
}

class Day {
    Map<String, LessonValue> lessons;
    LessonsMobile lessonsMobile;

    Day({
        required this.lessons,
        required this.lessonsMobile,
    });

    factory Day.fromJson(Map<String, dynamic> json) => Day(
        lessons: Map.from(json["lessons"]).map((k, v) => MapEntry<String, LessonValue>(k, LessonValue.fromJson(v))),
        lessonsMobile: LessonsMobile.fromJson(json["lessonsMobile"]),
    );

    Map<String, dynamic> toJson() => {
        "lessons": Map.from(lessons).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
        "lessonsMobile": lessonsMobile.toJson(),
    };
}

class LessonValue {
    List<LessonElement> lessons;
    int weekDay;
    bool showWebinarLink;
    String linkStyle;
    List<dynamic> links;

    LessonValue({
        required this.lessons,
        required this.weekDay,
        required this.showWebinarLink,
        required this.linkStyle,
        required this.links,
    });

    factory LessonValue.fromJson(Map<String, dynamic> json) => LessonValue(
        lessons: List<LessonElement>.from(json["lessons"].map((x) => LessonElement.fromJson(x))),
        weekDay: json["weekDay"],
        showWebinarLink: json["showWebinarLink"],
        linkStyle: json["linkStyle"],
        links: List<dynamic>.from(json["links"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "lessons": List<dynamic>.from(lessons.map((x) => x.toJson())),
        "weekDay": weekDay,
        "showWebinarLink": showWebinarLink,
        "linkStyle": linkStyle,
        "links": List<dynamic>.from(links.map((x) => x)),
    };
}

class LessonElement {
    int number;
    int subNumber;
    int studyGroupId;
    String studyGroupName;
    String tutorName;
    String auditory;
    String building;
    int lessonId;
    PublicationDate publicationDate;
    String groupTypeShortName;
    String groupTypeFullName;
    String studygroupShortName;
    String tutorShortName;
    String subjectName;
    bool onlineClass;
    int webinarId;
    int platformId;
    bool expelledOrRetire;
    bool empty;
    List<dynamic> links;

    LessonElement({
        required this.number,
        required this.subNumber,
        required this.studyGroupId,
        required this.studyGroupName,
        required this.tutorName,
        required this.auditory,
        required this.building,
        required this.lessonId,
        required this.publicationDate,
        required this.groupTypeShortName,
        required this.groupTypeFullName,
        required this.studygroupShortName,
        required this.tutorShortName,
        required this.subjectName,
        required this.onlineClass,
        required this.webinarId,
        required this.platformId,
        required this.expelledOrRetire,
        required this.empty,
        required this.links,
    });

    factory LessonElement.fromJson(Map<String, dynamic> json) => LessonElement(
        number: json["number"],
        subNumber: json["subNumber"],
        studyGroupId: json["studyGroupID"],
        studyGroupName: json["studyGroupName"],
        tutorName: json["tutorName"],
        auditory: json["auditory"],
        building: json["building"],
        lessonId: json["lessonID"],
        publicationDate: PublicationDate.fromJson(json["publicationDate"]),
        groupTypeShortName: json["groupTypeShortName"],
        groupTypeFullName: json["groupTypeFullName"],
        studygroupShortName: json["studygroupShortName"],
        tutorShortName: json["tutorShortName"],
        subjectName: json["subjectName"],
        onlineClass: json["onlineClass"],
        webinarId: json["webinarID"],
        platformId: json["platformID"],
        expelledOrRetire: json["expelledOrRetire"],
        empty: json["empty"],
        links: List<dynamic>.from(json["links"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "number": number,
        "subNumber": subNumber,
        "studyGroupID": studyGroupId,
        "studyGroupName": studyGroupName,
        "tutorName": tutorName,
        "auditory": auditory,
        "building": building,
        "lessonID": lessonId,
        "publicationDate": publicationDate.toJson(),
        "groupTypeShortName": groupTypeShortName,
        "groupTypeFullName": groupTypeFullName,
        "studygroupShortName": studygroupShortName,
        "tutorShortName": tutorShortName,
        "subjectName": subjectName,
        "onlineClass": onlineClass,
        "webinarID": webinarId,
        "platformID": platformId,
        "expelledOrRetire": expelledOrRetire,
        "empty": empty,
        "links": List<dynamic>.from(links.map((x) => x)),
    };
}

class PublicationDate {
    int year;
    int month;
    int day;
    int hour;
    int minute;
    String displayedValue;
    String time;
    DateTime timestamp;
    int calendar;
    int currentMonthDaysCount;
    DateTime currentMothStart;
    DateTime currentMonthFinish;
    int timeInMinutes;
    int dayfWeekNumber;
    int weekOfYear;
    String inputValueLastMonth;
    String inputValue;
    String date2;
    int weekDay;
    int javaDate;
    String dateDayMonthYear;

    PublicationDate({
        required this.year,
        required this.month,
        required this.day,
        required this.hour,
        required this.minute,
        required this.displayedValue,
        required this.time,
        required this.timestamp,
        required this.calendar,
        required this.currentMonthDaysCount,
        required this.currentMothStart,
        required this.currentMonthFinish,
        required this.timeInMinutes,
        required this.dayfWeekNumber,
        required this.weekOfYear,
        required this.inputValueLastMonth,
        required this.inputValue,
        required this.date2,
        required this.weekDay,
        required this.javaDate,
        required this.dateDayMonthYear,
    });

    factory PublicationDate.fromJson(Map<String, dynamic> json) => PublicationDate(
        year: json["year"],
        month: json["month"],
        day: json["day"],
        hour: json["hour"],
        minute: json["minute"],
        displayedValue: json["displayedValue"],
        time: json["time"],
        timestamp: DateTime.parse(json["timestamp"]),
        calendar: json["calendar"],
        currentMonthDaysCount: json["currentMonthDaysCount"],
        currentMothStart: DateTime.parse(json["currentMothStart"]),
        currentMonthFinish: DateTime.parse(json["currentMonthFinish"]),
        timeInMinutes: json["timeInMinutes"],
        dayfWeekNumber: json["dayfWeekNumber"],
        weekOfYear: json["weekOfYear"],
        inputValueLastMonth: json["inputValueLastMonth"],
        inputValue: json["inputValue"],
        date2: json["date2"],
        weekDay: json["weekDay"],
        javaDate: json["javaDate"],
        dateDayMonthYear: json["dateDayMonthYear"],
    );

    Map<String, dynamic> toJson() => {
        "year": year,
        "month": month,
        "day": day,
        "hour": hour,
        "minute": minute,
        "displayedValue": displayedValue,
        "time": time,
        "timestamp": timestamp.toIso8601String(),
        "calendar": calendar,
        "currentMonthDaysCount": currentMonthDaysCount,
        "currentMothStart": "${currentMothStart.year.toString().padLeft(4, '0')}-${currentMothStart.month.toString().padLeft(2, '0')}-${currentMothStart.day.toString().padLeft(2, '0')}",
        "currentMonthFinish": "${currentMonthFinish.year.toString().padLeft(4, '0')}-${currentMonthFinish.month.toString().padLeft(2, '0')}-${currentMonthFinish.day.toString().padLeft(2, '0')}",
        "timeInMinutes": timeInMinutes,
        "dayfWeekNumber": dayfWeekNumber,
        "weekOfYear": weekOfYear,
        "inputValueLastMonth": inputValueLastMonth,
        "inputValue": inputValue,
        "date2": date2,
        "weekDay": weekDay,
        "javaDate": javaDate,
        "dateDayMonthYear": dateDayMonthYear,
    };
}

class LessonsMobile {
    LessonsMobile();

    factory LessonsMobile.fromJson(Map<String, dynamic> json) => LessonsMobile(
    );

    Map<String, dynamic> toJson() => {
    };
}
