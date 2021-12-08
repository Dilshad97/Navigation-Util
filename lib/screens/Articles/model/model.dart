class Articles {
  String id;

  String name;
  String author;
  String title;
  String description;
  String url;

  Articles(
      this.id,
      this.name,
      this.author,
      this.title,
      this.description,
      this.url);

  Articles.fromJson(Map<String, dynamic> map) {
    id = map['source']['id'];
    name = map['source']['name'];
    author = map['author'];
    title = map['title'];
    description = map['description'];
    url = map['url'];
  }
}
