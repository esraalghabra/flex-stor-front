class ProductModel {
  int? id;
  String? name;
  String? details;
  int? price;
  int? discounts;
  int? amount;
  String? photo;
  int? active;
  int? mainCategoryId;
  int? subCategoryId;

  ProductModel(
      {this.id,
        this.name,
        this.details,
        this.price,
        this.discounts,
        this.amount,
        this.photo,
        this.active,
        this.mainCategoryId,
        this.subCategoryId});

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    details = json['details'];
    price = json['price'];
    discounts = json['discounts'];
    amount = json['amount'];
    photo = json['photo'];
    active = json['active'];
    mainCategoryId = json['main_category_id'];
    subCategoryId = json['sub_category_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['details'] = details;
    data['price'] = price;
    data['discounts'] = discounts;
    data['amount'] = amount;
    data['photo'] = photo;
    data['active'] = active;
    data['main_category_id'] = mainCategoryId;
    data['sub_category_id'] = subCategoryId;
    return data;
  }
}
