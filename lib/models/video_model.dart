class VideoModel {
  String status;
  List<Category> category;

  VideoModel({this.status, this.category});

  VideoModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['category'] != null) {
      category = new List<Category>();
      json['category'].forEach((v) {
        category.add(new Category.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.category != null) {
      data['category'] = this.category.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Category {
  int id;
  String name;
  String description;
  String image;
  String videofile;
  Null urlField;
  bool active;
  String created;
  String updated;

  Category(
      {this.id,
      this.name,
      this.description,
      this.image,
      this.videofile,
      this.urlField,
      this.active,
      this.created,
      this.updated});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    image = json['image'];
    videofile = json['videofile'];
    urlField = json['url_field'];
    active = json['active'];
    created = json['created'];
    updated = json['updated'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['image'] = this.image;
    data['videofile'] = this.videofile;
    data['url_field'] = this.urlField;
    data['active'] = this.active;
    data['created'] = this.created;
    data['updated'] = this.updated;
    return data;
  }
}
