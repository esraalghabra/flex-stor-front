class MainCategoryModel {
  int? id;
  String? name;
  String? details;
  String? photo;
  int? active;

  MainCategoryModel({this.id, this.name, this.details, this.photo, this.active});

  MainCategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    details = json['details'];
    photo = json['photo'];
    active = json['active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['details'] = details;
    data['photo'] = photo;
    data['active'] = active;
    return data;
  }
}