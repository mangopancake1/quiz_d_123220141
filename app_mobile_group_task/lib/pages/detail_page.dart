import 'package:flutter/material.dart';
import 'newsmodel.dart';

class DetailPage extends StatelessWidget {
  final NewsModel news;

  const DetailPage({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(news.title),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(news.image, width: double.infinity, fit: BoxFit.cover),
            const SizedBox(height: 10),
            Text(
              news.title,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              news.description,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                const Icon(Icons.thumb_up, color: Colors.blue),
                const SizedBox(width: 5),
                Text("${news.likes} Suka"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
