import 'package:custom_bloc_state_management/models/BaseModel.dart';
import 'package:custom_bloc_state_management/utils/TimeUtils.dart';
import 'package:json_annotation/json_annotation.dart';

part 'SessionModel.g.dart';

@JsonSerializable(explicitToJson: true)
class SessionModel implements BaseModel {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "email")
  final String? mail;
  @JsonKey(name: "image_url")
  final String? pic;
  @JsonKey(name: "token")
  final String? token;
  @JsonKey(name: "name")
  final String? display;
  final bool mailValidationDone;

  final bool newUser;

  const SessionModel({
    required this.mail,
    required this.display,
    required this.pic,
    required this.token,
    this.newUser = false,
    this.mailValidationDone = true,
    this.id,
  });

  factory SessionModel.requiresMailValidation() => const SessionModel(
        mailValidationDone: false,
        display: null,
        mail: null,
        pic: null,
        token: null,
      );

  const SessionModel.empty()
      : id = -1,
        display = null,
        mail = null,
        pic = null,
        token = null,
        newUser = false,
        mailValidationDone = true;

  factory SessionModel.fromJson(Map<String, dynamic> json) =>
      _$SessionModelFromJson(json);

  bool get isValidWithUserId => validate() && id != null;

  Map<String, dynamic> toJson() => _$SessionModelToJson(this);

  bool hasMail() => _hasString(mail!);

  bool hasDisplay() => _hasString(display!);

  bool hasPic() => _hasString(pic!);

  bool hasToken() => _hasString(token);

  bool isNewUser() => newUser;

  bool _hasString(String? str) => str != null && str.isNotEmpty;

  bool validate() => hasToken() && hasMail();

  @override
  String toString() {
    return 'SessionModel{mail: $mail, display: $display, pic: $pic, validated: $mailValidationDone}';
  }

  SessionModel copyWith({
    int? id,
    String? mail,
    String? display,
    String? pic,
    bool? mailValidationDone,
    String? token,
    bool? newUser,
  }) {
    return SessionModel(
      id: id ?? this.id,
      mail: mail ?? this.mail,
      display: display ?? this.display,
      pic: pic ?? this.pic,
      mailValidationDone: mailValidationDone ?? this.mailValidationDone,
      token: token ?? this.token,
      newUser: newUser ?? this.newUser,
    );
  }

  factory SessionModel.fromDatabaseJson(Map<String, dynamic> data) =>
      SessionModel(
        display: data['display'],
        id: data['server_id'],
        mail: data['mail'],
        pic: data['pic'],
        token: data['token'],
        mailValidationDone: data['mailValidationDone'] == 0 ? false : true,
      );

  Map<String, dynamic> toDatabaseJson() => {
        "id": 1,
        "server_id": id,
        "mail": mail,
        "display": display,
        "pic": pic,
        "mailValidationDone": mailValidationDone == false ? 0 : 1,
        "token": token,
        "timestamp": TimeUtils().millisNow()
      };
}
