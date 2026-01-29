part of '../flutter_background_geolocation.dart';

class PermissionRationale {
  String? title;

  String? message;

  String? positiveAction;

  String? negativeAction;

  PermissionRationale(
      {this.title, this.message, this.positiveAction, this.negativeAction});

  static PermissionRationale fromMap(Map<String, Object?> map) {
    return PermissionRationale(
      title: map['title'] as String?,
      message: map['message'] as String?,
      positiveAction: map['positiveAction'] as String?,
      negativeAction: map['negativeAction'] as String?,
    );
  }

  Map<String, String?> toMap() {
    return {
      'title': title,
      'message': message,
      'positiveAction': positiveAction,
      'negativeAction': negativeAction,
    };
  }
}
