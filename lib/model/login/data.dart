class Data {
  String idUsers;
  String name;
  String username;
  String phone;
  String address;
  String image;
  String password;
  String type;
  String email;
  String delete;
  Data(
      [this.idUsers,
      this.name,
      this.username,
      this.phone,
      this.address,
      this.image,
      this.email,
     ]);

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
    email = json['email'];
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
    data['email'] = this.email;
    return data;
  }
}
