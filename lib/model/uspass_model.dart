import 'package:get/get_rx/get_rx.dart';

class UspassModel {
  String? user;
  String? password;
  String? icon;
  String? name;
  RxBool? showPass;

  UspassModel({
    required this.user,
    required this.password,
    this.icon,
    required this.name,
    required this.showPass,
  });

  Map<String, dynamic> tomap() => {
    'user': user,
    'password': password,
    'icon': icon,
    'name': name,
    'showPass': showPass!.value,
  };

  factory UspassModel.fromMap(Map<String, dynamic> map) {
    return UspassModel(
      user: map['user'] ?? '',
      password: map['password'] ?? '',
      name: map['name'] ?? "",
      showPass: RxBool(map['showPass'] ?? false),
      icon: map['icon'] ?? '',
    );
  }
}
