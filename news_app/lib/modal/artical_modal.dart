class ArticalModel {
  String title;
  dynamic author;
  String description;
  String urlToImage;
  DateTime publshedAt;
  dynamic content;
  String url;
  ArticalModel(
      {required this.title,
      required this.description,
      required this.author,
      required this.content,
      required this.publshedAt,
      required this.urlToImage,
      required this.url});
}
