class PostResponse {
  bool _response;
  int _status;
  String _message;

  PostResponse({bool response, int status}) {
    this._response = response;
    this._status = status;
  }

  bool get response => _response;
  set response(bool response) => _response = response;
  int get status => _status;
  set status(int status) => _status = status;

  set message(String message) => _message = message;

  get message => _message;

  PostResponse.fromJson(Map<String, dynamic> json) {
    _response = json['response'];
    _status = json['status'];
    _message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['response'] = this._response;
    data['status'] = this._status;
    data['message'] = this._message;
    return data;
  }
}
