import 'data.dart';

class Login {
  bool _auth;
  Data _data;
  int _status;

  Login({bool auth, Data data, int status}) {
    this._auth = auth;
    this._data = data;
    this._status = status;
  }

  bool get auth => _auth;
  set auth(bool auth) => _auth = auth;
  Data get data => _data;
  set data(Data data) => _data = data;
  int get status => _status;
  set status(int status) => _status = status;

  Login.fromJson(Map<String, dynamic> json) {
    _auth = json['auth'];
    _data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    _status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['auth'] = this._auth;
    if (this._data != null) {
      data['data'] = this._data.toJson();
    }
    data['status'] = this._status;
    return data;
  }
}
