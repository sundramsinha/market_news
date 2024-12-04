import 'package:flutter/material.dart';
import 'package:market_news/news/news_article.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsDetailsPage extends StatelessWidget {
  final NewsArticle article;

  const NewsDetailsPage({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    final bulletPoints = article.body
        .split('.')
        .where((sentence) => sentence.trim().isNotEmpty)
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Article Details",
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(
          color: Colors.white, // Set icon color to white
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: () {
              shareResults('Check out this article: ${article.url}');
            },
          ),
        ],
        backgroundColor: Colors.orange,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.orange, Colors.deepOrange],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Article Image
            ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: Image.network(
                article.image,
                fit: BoxFit.cover,
                width: double.infinity,
                height: 200,
                errorBuilder: (context, error, stackTrace) => Container(
                  height: 200,
                  color: Colors.grey[300],
                  child: const Icon(Icons.broken_image,
                      size: 100, color: Colors.grey),
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Headline
            Text(
              article.headline,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 10),
            // Publish Date
            Text(
              "Published on: ${article.publishDate}",
              style: const TextStyle(
                fontSize: 16,
                color: Colors.grey,
                fontStyle: FontStyle.normal,
              ),
            ),
            const SizedBox(height: 10),
            // Publish Date
            Text(
              "Source: ${article.sources}",
              style: const TextStyle(
                fontSize: 16,
                color: Colors.grey,
                fontStyle: FontStyle.normal,
              ),
            ),
            const Divider(height: 30, thickness: 1.5),
            // Bullet Points
            const Text(
              "Highlights:",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: bulletPoints
                  .map(
                    (point) => Padding(
                      padding: const EdgeInsets.only(
                          bottom: 10.0), // Spacing between points
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "• ",
                            style: TextStyle(fontSize: 18, color: Colors.black),
                          ),
                          Expanded(
                            child: Text(
                              point.trim(),
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.black87,
                                height:
                                    1.5, // Line spacing for better readability
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                  .toList(),
            ),

            const SizedBox(height: 30),
            // Read Full Article Button
            Center(
              child: ElevatedButton(
                onPressed: () async {
                  final Uri url = Uri.parse(article.url);
                  if (await canLaunchUrl(url)) {
                    await launchUrl(url, mode: LaunchMode.externalApplication);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Could not open the article URL."),
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  padding: const EdgeInsets.symmetric(
                      vertical: 12.0, horizontal: 24.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                ),
                child: const Text(
                  "Read Full Article",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void shareResults(message) {
  String result = '''
      📊 $message 📊
 
      Thank you for support! 🚀
      ''';

  Share.share(result);
}
