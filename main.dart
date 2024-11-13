import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AboutPage',
      home: SelfDescription(),
    );
  }
}

class SelfDescription extends StatelessWidget {
  final List<Map<String, dynamic>> aboutme = [
    {
      'title': 'Yerema Maydinata Narana',
      'description': 'Mahasiswa Sistem Informasi Angkatan 2022',
      'imageUrl':
          'https://osissman1purbalingga.wordpress.com/wp-content/uploads/2021/09/sekretaris.png?w=768/image.jpg',
      'Funfact': ['Pernah liat member akatsukti makan siang di TC'],
      'NRP': '5026221068'
    },
    {
      'title': 'Mahasiswa X',
      'description': 'Orang orang apa yang spesial.. Orang kamu doang',
      'imageUrl':
          'https://1.bp.blogspot.com/-WpnFwd0r7wg/T96tHsOK1rI/AAAAAAAABDo/WlSCWwmSzr4/s1600/kere.jpg',
      'Funfact': ['Passionate in making rizz assessment'],
      'NRP': '6189287823'
    },
    {
      'title': 'Mahasiswa R',
      'description': 'Hater mahasiswa X',
      'imageUrl':
          'https://thumbs.dreamstime.com/b/macaque-monkey-oslob-cebu-island-monkeys-ion-philippines-276120533.jpg',
      'Funfact': ['Rizz mahasiswa X cuma geli2'],
      'NRP': '62890122133'
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('AboutPage'),
        ),
        body: ListView.builder(
            itemCount: aboutme.length,
            itemBuilder: (context, index) {
              return Card(
                color: Colors.orange.shade100,
                child: ListTile(
                  leading: Image.network(
                    aboutme[index]['imageUrl']!,
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                  title: Text(
                    aboutme[index]['title']!,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(aboutme[index]['description']!),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            DetailInformation(recipe: aboutme[index]),
                      ),
                    );
                  },
                ),
              );
            }));
  }
}

class DetailInformation extends StatelessWidget {
  final Map<String, dynamic> recipe;

  DetailInformation({required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(recipe['title']!),
        backgroundColor: Colors.orangeAccent,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              recipe['imageUrl']!,
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 16),
            Text(
              recipe['title']!,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              'NRP',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.green),
            ),
            Text(
              recipe['NRP'] ?? 'Unknown NRP',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              'Funfact:',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.green),
            ),
            SizedBox(height: 8),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: recipe['Funfact'].length,
              itemBuilder: (context, index) {
                return Text(
                  '${recipe['Funfact'][index]}',
                  style: TextStyle(fontSize: 16),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
