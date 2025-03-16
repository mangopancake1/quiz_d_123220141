import 'package:flutter/material.dart';
import 'newsmodel.dart';

class DetailPage extends StatefulWidget {
  final NewsModel news;

  const DetailPage({super.key, required this.news});

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  late int likes;
  bool isLiked = false;

  @override
  void initState() {
    super.initState();
    likes = widget.news.likes;
  }

  void toggleLike() {
    setState(() {
      if (isLiked) {
        likes--;
      } else {
        likes++;
      }
      isLiked = !isLiked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.news.title),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(widget.news.image,
                width: double.infinity, fit: BoxFit.cover),
            const SizedBox(height: 10),
            Text(
              widget.news.title,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              widget.news.description,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                IconButton(
                  icon: Icon(
                    isLiked ? Icons.favorite : Icons.favorite_border,
                    color: Colors.red,
                  ),
                  onPressed: toggleLike,
                ),
                Text("$likes Suka"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
