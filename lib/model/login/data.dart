class Data {
  String idUsers;
  String name;
  String username;
  String phone;
  String address;
  String image;
  String password;
  String type;
  String delete;

  

 

  Data.fromJson(Map<String, dynamic> json) {
    idUsers = json['id_users'];
    name = json['name'];
    username = json['username'];
    phone = json['phone'];
    address = json['address'];
    image = json['image'];
    password = json['password'];
    type = json['type'];
    delete = json['delete'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_users'] = this.idUsers;
    data['name'] = this.name;
    data['username'] = this.username;
    data['phone'] = this.phone;
    data['address'] = this.address;
    data['image'] = this.image;
    data['password'] = this.password;
    data['type'] = this.type;
    data['delete'] = this.delete;
    return data;
  }
}