class Student {
  int? id;
  String? name;
  String? surname;
  int? mobile;

  Student({this.id, this.name, this.surname, this.mobile});

  Student.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    surname = json['surname'];
    mobile = json['mobile'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['surname'] = this.surname;
    data['mobile'] = this.mobile;
    return data;
  }
}
