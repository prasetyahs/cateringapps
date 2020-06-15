class PostResponse {
  bool response;
  int status;
  String message;

  PostResponse({bool response, int status}) {
    this.response = response;
    this.status = status;
  }


  PostResponse.fromJson(Map<String, dynamic> json) {
    response = json['response'];
    status = json['status'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['response'] = this.response;
    data['status'] = this.status;
    data['message'] = this.message;
    return data;
  }
}
