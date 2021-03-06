import 'package:floor/floor.dart';

@entity
class Response {
  @primaryKey
  String id;
  String title;
  String url;
  String imageUrl;
  String newsSite;
  String summary;
  String publishedAt;
  String updatedAt;
  bool featured;

  Response(
      {this.id,
      this.title,
      this.url,
      this.imageUrl,
      this.newsSite,
      this.summary,
      this.publishedAt,
      this.updatedAt,
      this.featured});

  Response.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    url = json['url'];
    imageUrl = json['imageUrl'];
    newsSite = json['newsSite'];
    summary = json['summary'];
    publishedAt = json['publishedAt'];
    updatedAt = json['updatedAt'];
    featured = json['featured'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['url'] = this.url;
    data['imageUrl'] = this.imageUrl;
    data['newsSite'] = this.newsSite;
    data['summary'] = this.summary;
    data['publishedAt'] = this.publishedAt;
    data['updatedAt'] = this.updatedAt;
    data['featured'] = this.featured;

    return data;
  }
}

class Launches {
  String id;
  String provider;

  Launches({this.id, this.provider});

  Launches.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    provider = json['provider'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['provider'] = this.provider;
    return data;
  }
}
