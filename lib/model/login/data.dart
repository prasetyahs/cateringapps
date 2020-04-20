
class Data {
  String _idUsers;
  String _name;
  String _username;
  String _phone;
  String _address;
  String _image;
  String _password;
  String _type;
  String _delete;

  Data(
      {String idUsers,
      String name,
      String username,
      String phone,
      String address,
      String image,
      String password,
      String type,
      String delete}) {
    this._idUsers = idUsers;
    this._name = name;
    this._username = username;
    this._phone = phone;
    this._address = address;
    this._image = image;
    this._password = password;
    this._type = type;
    this._delete = delete;
  }

  String get idUsers => _idUsers;
  set idUsers(String idUsers) => _idUsers = idUsers;
  String get name => _name;
  set name(String name) => _name = name;
  String get username => _username;
  set username(String username) => _username = username;
  String get phone => _phone;
  set phone(String phone) => _phone = phone;
  String get address => _address;
  set address(String address) => _address = address;
  String get image => _image;
  set image(String image) => _image = image;
  String get password => _password;
  set password(String password) => _password = password;
  String get type => _type;
  set type(String type) => _type = type;
  String get delete => _delete;
  set delete(String delete) => _delete = delete;

  Data.fromJson(Map<String, dynamic> json) {
    _idUsers = json['id_users'];
    _name = json['name'];
    _username = json['username'];
    _phone = json['phone'];
    _address = json['address'];
    _image = json['image'];
    _password = json['password'];
    _type = json['type'];
    _delete = json['delete'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_users'] = this._idUsers;
    data['name'] = this._name;
    data['username'] = this._username;
    data['phone'] = this._phone;
    data['address'] = this._address;
    data['image'] = this._image;
    data['password'] = this._password;
    data['type'] = this._type;
    data['delete'] = this._delete;
    return data;
  }
}