import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AboutPage',
      home: RecipeListPage(),
    );
  }
}

class RecipeListPage extends StatelessWidget {
  final List<Map<String, dynamic>> recipes = [
    {
      'title': 'Yerema Maydinata Narana',
      'description': 'Mahasiswa Sistem Informasi Angkatan 2022',
      'imageUrl':
          'https://cdn0-production-images-kly.akamaized.net/mkAcKHQQm2Ujwq0LngbV5KHKOp4=/1979x0:4981x4001/500x667/filters:quality(75):strip_icc():format(webp)/kly-media-production/medias/2843447/original/098533600_1562138068-shutterstock_1335756413.jpg',
      'Funfact': ['Pernah liat member akatsukti makan siang di TC'],
      'NRP': '5026221068'
    },
    {
      'title': 'Mahasiswa X',
      'description': 'Orang orang apa yang spesial.. Orang kamu doang',
      'imageUrl':
          'https://cdn1-production-images-kly.akamaized.net/a6xvLhjIWqlrNOdjaI40qxT_Jr0=/0x148:1920x1230/640x360/filters:quality(75):strip_icc():format(webp)/kly-media-production/medias/3093328/original/069244600_1585909700-fried-2509089_1920.jpg',
      'Funfact': ['Passionate in making rizz assessment'],
      'NRP': '6189287823'
    },
    {
      'title': 'Mahasiswa R',
      'description': 'Hater mahasiswa X',
      'imageUrl':
          'https://www.masakapahariini.com/wp-content/uploads/2023/11/Resep-Mie-Goreng-Telur-Untuk-Tanggal-Tua.jpg',
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
            itemCount: recipes.length,
            itemBuilder: (context, index) {
              return Card(
                color: const Color.fromARGB(255, 159, 243, 228),
                child: ListTile(
                  leading: Image.network(
                    recipes[index]['imageUrl']!,
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                  title: Text(
                    recipes[index]['title']!,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(recipes[index]['description']!),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            RecipeDetailPage(recipe: recipes[index]),
                      ),
                    );
                  },
                ),
              );
            }));
  }
}

class RecipeDetailPage extends StatelessWidget {
  final Map<String, dynamic> recipe;

  RecipeDetailPage({required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(recipe['title']!),
        backgroundColor: const Color.fromARGB(255, 91, 171, 103),
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
