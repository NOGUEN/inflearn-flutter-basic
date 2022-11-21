class Book {
  String title = "";
  String subTitle = "";
  String thumbnail = "";
  String previewLink = "";

  Book({
    required this.title,
    required this.subTitle,
    required this.thumbnail,
    required this.previewLink,
  });

  factory Book.fromJson(Map<String, dynamic> volumeInfo) {
    return Book(
      title: volumeInfo["title"] ?? "",
      subTitle: volumeInfo["subTitle"] ?? "",
      thumbnail: volumeInfo["imageLinks"]?["thumbnail"] ??
          "https://i.ibb.co/2ypYwdr/no-photo.png",
      previewLink: volumeInfo["previewLink"] ?? "",
    );
  }
}
