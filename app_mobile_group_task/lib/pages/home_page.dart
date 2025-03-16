import 'package:flutter/material.dart';
import 'newsmodel.dart';
import 'detail_page.dart';

class HomePage extends StatelessWidget {
  final String username;

  const HomePage({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Selamat Datang - $username"),
        backgroundColor: Colors.blueAccent,
      ),
      body: ListView.builder(
        itemCount: dummyNews.length,
        itemBuilder: (context, index) {
          final news = dummyNews[index];
          return Card(
            margin: const EdgeInsets.all(10),
            child: ListTile(
              leading: Image.network(news.image, width: 100, fit: BoxFit.cover),
              title: Text(news.title,
                  style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text("${news.likes} Suka"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailPage(news: news),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
