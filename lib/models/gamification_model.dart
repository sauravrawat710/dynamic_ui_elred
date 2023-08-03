import 'dart:convert';

GamificationModel gamificationFromMap(String str) =>
    GamificationModel.fromMap(json.decode(str));

String gamificationToMap(GamificationModel data) => json.encode(data.toMap());

class GamificationModel {
  final List<Screen> screens;

  GamificationModel({required this.screens});

  GamificationModel copyWith({List<Screen>? screens}) => GamificationModel(
        screens: screens ?? this.screens,
      );

  factory GamificationModel.fromMap(Map<String, dynamic> json) =>
      GamificationModel(
        screens:
            List<Screen>.from(json["screens"].map((x) => Screen.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "screens": List<dynamic>.from(screens.map((x) => x.toMap())),
      };
}

class ChildScreen {
  final List<Screen> frontend;
  final List<Screen> backend;
  final List<Screen> designer;

  ChildScreen({
    required this.frontend,
    required this.backend,
    required this.designer,
  });

  ChildScreen copyWith({
    List<Screen>? frontend,
    List<Screen>? backend,
    List<Screen>? designer,
  }) =>
      ChildScreen(
        frontend: frontend ?? this.frontend,
        backend: backend ?? this.backend,
        designer: designer ?? this.designer,
      );

  factory ChildScreen.fromMap(Map<String, dynamic> json) => ChildScreen(
        frontend:
            List<Screen>.from(json["frontend"].map((x) => Screen.fromMap(x))),
        backend:
            List<Screen>.from(json["backend"].map((x) => Screen.fromMap(x))),
        designer:
            List<Screen>.from(json["designer"].map((x) => Screen.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "frontend": List<dynamic>.from(frontend.map((x) => x.toMap())),
        "backend": List<dynamic>.from(backend.map((x) => x.toMap())),
        "designer": List<dynamic>.from(designer.map((x) => x.toMap())),
      };
}

class Screen {
  String screenName;
  String heading;
  String question;
  String? hintText;
  List<String> fields;
  List<Option>? options;
  String? ans;
  ChildScreen? childScreen;

  Screen({
    required this.screenName,
    required this.heading,
    required this.question,
    this.hintText,
    required this.fields,
    this.options,
    this.ans,
    this.childScreen,
  });

  Screen copyWith({
    String? screenName,
    String? heading,
    String? question,
    String? hintText,
    List<String>? fields,
    List<Option>? options,
    String? ans,
    ChildScreen? childScreen,
  }) =>
      Screen(
        screenName: screenName ?? this.screenName,
        heading: heading ?? this.heading,
        question: question ?? this.question,
        hintText: hintText ?? this.hintText,
        fields: fields ?? this.fields,
        options: options ?? this.options,
        ans: ans ?? this.ans,
        childScreen: childScreen ?? this.childScreen,
      );

  factory Screen.fromMap(Map<String, dynamic> json) => Screen(
        screenName: json["screen_name"],
        heading: json["heading"],
        question: json["question"],
        hintText: json["hint_text"],
        fields: List<String>.from(json["fields"].map((x) => x)),
        options: json["options"] == null
            ? null
            : List<Option>.from(json["options"]?.map((x) => Option.fromMap(x))),
        ans: json["ans"],
        childScreen: json['child_screen'] == null
            ? null
            : ChildScreen.fromMap(json["child_screen"]),
      );

  Map<String, dynamic> toMap() => {
        "screen_name": screenName,
        "heading": heading,
        "question": question,
        "hint_text": hintText,
        "fields": List<dynamic>.from(fields.map((x) => x)),
        "options": options != null
            ? List<dynamic>.from(options!.map((x) => x.toMap()))
            : null,
        "ans": ans,
        "child_screen": childScreen?.toMap(),
      };
}

class Option {
  final String text;
  final String value;
  final String? key;

  Option({
    required this.text,
    required this.value,
    this.key,
  });

  Option copyWith({
    String? text,
    String? value,
    String? key,
  }) =>
      Option(
        text: text ?? this.text,
        value: value ?? this.value,
        key: key ?? this.key,
      );

  factory Option.fromMap(Map<String, dynamic> json) => Option(
        text: json["text"],
        value: json["value"],
        key: json["key"],
      );

  Map<String, dynamic> toMap() => {
        "text": text,
        "value": value,
        "key": key,
      };
}
