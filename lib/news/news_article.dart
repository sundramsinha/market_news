class NewsArticle {
  final int id;
  final String headline;
  final String body;
  final String publishDate;
  final String url;
  final String image;
  final List<String> sources;

  NewsArticle({
    required this.id,
    required this.headline,
    required this.body,
    required this.publishDate,
    required this.url,
    required this.image,
    required this.sources,
  });

  factory NewsArticle.fromJson(Map<String, dynamic> json) {
    return NewsArticle(
      id: json['id'],
      headline: json['headline'],
      body: json['body'],
      publishDate: json['publish_date'],
      url: json['url'],
      image: json['image'] ?? '', // Handle missing image URLs
      sources: List<String>.from(
          json['sources'] ?? []), // Safely handle the sources array
    );
  }
}
