import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: ScanHistoryPage(),
  ));
}

class ScanHistoryPage extends StatelessWidget {
  final List<String> scanHistoryItems = [
    "Certainly, let's solve the given definite integral:",
    "Here are some typical chapters that might be included in a Cell Biology course:",
    "Sure, let's include the additional questions and update the flow accordingly:",
    "These chapters provide a comprehensive overview of the key concepts and topics typically covered:",
    "Here is a list of some of the most popular courses globally and the majors that typically accompany them:",
    "Certainly! Here are 20 different explanation options for each of the questions you scanned.",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff5f5f5), // Arka plan rengi eklendi
      appBar: AppBar(
        backgroundColor: Color(0xfff5f5f5),
        title: Text('Scan History', style: TextStyle(color: Colors.black)),
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.black),
            onPressed: () {
              showSearch(
                context: context,
                delegate: ScanHistorySearch(scanHistoryItems),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16.0),
        itemCount: scanHistoryItems.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: Card(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              elevation: 2,
              child: ListTile(
                title: Text('Scan & Solve'),
                subtitle: Text(scanHistoryItems[index]),
                trailing: PopupMenuButton<String>(
                  onSelected: (value) {
                    if (value == 'Export Chat') {
                      // Export action
                    } else if (value == 'Delete Chat') {
                      // Delete action
                    }
                  },
                  itemBuilder: (BuildContext context) {
                    return [
                      PopupMenuItem<String>(
                        value: 'Export Chat',
                        child: Row(
                          children: [
                            Icon(Icons.save_alt, color: Colors.black54),
                            SizedBox(width: 8),
                            Text('Export Chat'),
                          ],
                        ),
                      ),
                      PopupMenuItem<String>(
                        value: 'Delete Chat',
                        child: Row(
                          children: [
                            Icon(Icons.delete, color: Colors.red),
                            SizedBox(width: 8),
                            Text('Delete Chat'),
                          ],
                        ),
                      ),
                    ];
                  },
                  icon: Icon(Icons.more_vert),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class ScanHistorySearch extends SearchDelegate<String> {
  final List<String> scanHistoryItems;

  ScanHistorySearch(this.scanHistoryItems);

  @override
  List<Widget> buildActions(BuildContext context) {
    // Arama kutusunu temizlemek için 'clear' butonu
    return [];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // Geri düğmesi
    return IconButton(
      icon: Icon(Icons.close),
      onPressed: () {
        close(context, ''); // Geri dön ve boş bir sonuç döndür
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // Arama sorgusuna göre filtrelenmiş sonuçları göster
    final List<String> results = scanHistoryItems
        .where((item) => item.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(results[index]),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // Kullanıcı arama yaparken öneriler
    final List<String> suggestions = scanHistoryItems
        .where((item) => item.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(suggestions[index]),
          onTap: () {
            query =
                suggestions[index]; // Tıkladığında arama kutusuna bu değeri yaz
            showResults(context); // Sonuçları göster
          },
        );
      },
    );
  }
}
