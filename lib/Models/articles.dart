class articles{
  dynamic author;
  dynamic title;
  dynamic description;
  dynamic url;
  dynamic urlToImage;
  dynamic publishedAt;

  articles({
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'author': this.author,
      'title': this.title,
      'description': this.description,
      'url': this.url,
      'urlToImage': this.urlToImage,
      'publishedAt': this.publishedAt,
    };
  }

  factory articles.fromMap(Map<String, dynamic> map) {
    return articles(
      author: map['author'] ,
      title: map['title'] ,
      description: map['description'] ,
      url: map['url'],
      urlToImage: map['urlToImage'] ,
      publishedAt: map['publishedAt'] ,
    );
  }
}