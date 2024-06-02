import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BestScoreScreen extends StatefulWidget {
  @override
  State<BestScoreScreen> createState() => _BestScoreScreenState();
}

class _BestScoreScreenState extends State<BestScoreScreen> {
  List<int> scores = [];

  @override
  void initState() {
    super.initState();
    _loadScores();
  }

  Future<void> _loadScores() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      scores = (prefs.getStringList('scores') ?? [])
          .map((e) => int.parse(e))
          .toList();
      scores.sort((a, b) => b.compareTo(a)); // Sort scores in descending order
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Best Scores'),
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      ),
      backgroundColor: const Color.fromARGB(255, 255, 254, 254),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: scores.length,
          itemBuilder: (context, index) {
            return Card(
              color: const Color.fromARGB(255, 0, 0, 0),
              margin:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              child: ListTile(
                leading: Icon(Icons.star, color: Colors.yellow[700]),
                title: Text(
                  'Score: ${scores[index]}',
                  style: const TextStyle(
                    fontSize: 18,
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
