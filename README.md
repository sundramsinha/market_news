# Market News App

A simple Flutter application that fetches and displays market-related news articles. This app demonstrates Flutter's powerful UI capabilities and data fetching from local JSON files.

---

## Features

- **News Listing**: Displays a list of market-related news articles with a headline, image, and publish date.
- **Detailed View**: Opens a detailed page showing the full article, publish date, and sources when an article is clicked.
- **Custom UI**: Attractive UI with gradient backgrounds, cards, and responsive layouts.

---

## Installation

### Prerequisites

- Install [Flutter](https://docs.flutter.dev/get-started/install) on your system.
- Set up an Android or iOS emulator OR connect a physical device.

### Steps

1. Clone this repository:

   ```
   git clone https://github.com/your-username/market_news.git
   ```

2. ```
       cd market_news
   ```

3. ```
       flutter pub get
   ```

4. ```
       flutter run
   ```

## Folder Structure

        market_news/
        ├── assets/                  # Folder for assets like images and JSON
        │   ├── news_articles.json   # JSON file containing news data
        │   └── background.jpg       # Background image for the app
        ├── lib/                     # Main source code folder
        │   ├── news_article.dart    # Model class for news articles
        │   ├── news_list_page.dart  # Page displaying the list of news articles
        │   ├── news_details_page.dart # Detailed page for a news article
        │   └── main.dart            # Entry point of the application
        ├── pubspec.yaml             # Flutter configuration file
        └── README.md                # This file

## Dependencies

# The app uses the following Flutter packages:

- flutter/material.dart: Core UI framework for Flutter.
- dart:convert: For JSON decoding.
- flutter/services.dart: To load JSON files from assets.
- url_launcher: To open external URLs (e.g., read full articles).

Add these dependencies in your pubspec.yaml file:

```
dependencies:
   flutter:
   sdk: flutter
   url_launcher: ^6.0.20
```

## Screenshots

| Home Page                                                                            | News List Page                                                                           | News Details Page                                                                        |
| ------------------------------------------------------------------------------------ | ---------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------- |
| [![image.png](https://i.postimg.cc/c4g37Vf5/image.png)](https://postimg.cc/HVmjdvZQ) | [![image-1.png](https://i.postimg.cc/d3Dyxfp3/image-1.png)](https://postimg.cc/5QdyHsxW) | [![image-2.png](https://i.postimg.cc/JzjBvZ6N/image-2.png)](https://postimg.cc/87P5rJVc) |

### How to Contribute

1. Fork this repository.
2. Create a new branch:  
   `      git checkout -b feature-branch`
3. Commit your changes:
   `    git commit -m "Add your message"`
4. Push to your branch:
   `     git push origin feature-branch`
5. Open a Pull Request.

## License

This project is licensed under the MIT License.
