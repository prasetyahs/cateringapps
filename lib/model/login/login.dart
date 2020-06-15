import 'data.dart';

class Login {
  bool auth;
  Data data;
  int status;

  Login({bool auth, Data data, int status}) {
    this.auth = auth;
    this.data = data;
    this.status = status;
  }

  
  Login.fromJson(Map<String, dynamic> json) {
    auth = json['auth'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['auth'] = this.auth;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    data['status'] = this.status;
    return data;
  }
}
