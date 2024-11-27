import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: KanbanBoard(),
    );
  }
}

class KanbanBoard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Side Hustle"),
        backgroundColor: Colors.lightBlue.shade100,
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildTaskColumn("Ideas", Colors.green.shade100, [
                "Design Moodboard",
                "Product Ideas",
                "Feature Concepts",
                "Research Findings",
              ]),
              const SizedBox(width: 16),
              buildTaskColumn("Features / Work in Progress", Colors.yellow.shade100, [
                "API Design",
                "Hi-Fi Prototypes",
                "Edge Case Designs",
              ]),
              const SizedBox(width: 16),
              buildTaskColumn("Done", Colors.blue.shade100, [
                "Information Architecture",
                "Code Convention",
                "Competitor Analysis",
                "Wireframes",
              ]),
              const SizedBox(width: 16),
              buildTaskColumn("Goals", Colors.purple.shade100, [
                "MVP",
                "Launch Plans",
              ]),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTaskColumn(String title, Color color, List<String> tasks) {
    return Container(
      width: 200,
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(2, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 8),
          ...tasks.map((task) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    task,
                    style: const TextStyle(fontSize: 14),
                  ),
                ),
              )),
          const SizedBox(height: 8),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.symmetric(vertical: 8),
            ),
            child: const Text("Add Page"),
          ),
        ],
      ),
    );
  }
}

