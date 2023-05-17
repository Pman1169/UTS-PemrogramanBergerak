import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Menyembunyikan mark debug
      title: 'Novel App',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: NovelListPage(),
    );
  }
}

class Novel {
  final String title;
  final String coverImage;
  final String author;
  final String description;

  Novel({
    required this.title,
    required this.coverImage,
    required this.author,
    required this.description,
  });
}

class NovelListPage extends StatelessWidget {
  final List<Novel> novels = [
    Novel(
      title: 'The Adventure Begins',
      author: 'seed stun',
      coverImage: 'assets/image/bruh.png',
      description:
          'Stelle adalah seorang gadis muda yang penuh dengan keingintahuan dan semangat petualangan. Dia tinggal di sebuah desa kecil yang terpencil, di mana kehidupannya terasa monoton dan terbatas. Stelle selalu bermimpi tentang menjelajahi dunia luar yang luas dan memperoleh pengalaman yang menakjubkan. Suatu hari, Stelle Melihat sebuah Tong Sampah di tengah kota Jarillo-VI. Dikatakan bahwa tong sampah itu penuh dengan kekayaan dan misteri. Semua yang pernah mendengar tentangnya hanya mengetahui sedikit tentang apa yang sebenarnya terjadi di sana. Kabar ini langsung menarik perhatian Stelle, dan dia merasa bahwa inilah petualangan yang telah dia tunggu-tunggu.',
    ),
    Novel(
      title: '2 Kawan Pencari Bujang',
      author: 'Pman',
      coverImage: 'assets/image/2_kawan.png',
      description:
          'Di sebuah kota kecil yang damai, ada dua anak muda bernama Adam dan Lyle. Mereka adalah teman sejak kecil dan membagi semangat petualangan yang besar. Suatu hari, mereka menemukan sebuah kota yang cukup megah. Tanpa ragu, Adam dan Lyle memutuskan untuk menjadi "2 Kawan Pencari Bujang" dan memulai perjalanan mereka. Dengan tekad yang kuat dan peta sebagai petunjuk, mereka meninggalkan kota mereka dengan semangat petualangan yang membara.',
    ),
    Novel(
      title: 'End of Beginning',
      author: 'One',
      coverImage: 'assets/image/solo_player.png',
      description:
          'Di dunia yang hancur oleh perang dan kekacauan, seorang pria bernama Kevin Kaslana merasa terjebak dalam keputusasaan dan kekosongan. Dia telah kehilangan segalanya yang dia cintai dan tak memiliki harapan untuk masa depan yang lebih baik. Tetapi di tengah kegelapan hidupnya, ia melakukan sebuah project yang bernama "Project Honkai" yang dapat menciptakan dunia yang lebih baik. Dorongan untuk melakukan "Project Honkai" tersebut memunculkan semangat petualangan di dalam diri Kevin Kaslana. Dengan tekad yang begitu kuat, ia memulai perjalanan yang berbahaya untuk mencapai ambisi "End of Beginning" - yaitu sebuah project yang diyakini menjadi kunci untuk menghentikan kehancuran dan memulai masa depan baru.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Novels'),
      ),
      body: ListView.builder(
        itemCount: novels.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NovelDetailPage(novels[index]),
                ),
              );
            },
            child: Card(
              margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(4.0),
                      topRight: Radius.circular(4.0),
                    ),
                    child: Image.asset(
                      novels[index].coverImage,
                      fit: BoxFit.fitWidth,
                      height: 200.0,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          novels[index].title,
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10.0),
                        Text(
                          'By ${novels[index].author}',
                          style: TextStyle(
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class NovelDetailPage extends StatelessWidget {
  final Novel novel;

  NovelDetailPage(this.novel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(novel.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              novel.coverImage,
              fit: BoxFit.fitWidth,
              height: 500.0,
              width: double.infinity,
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    novel.title,
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    'By ${novel.author}',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    'Novel Description',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    novel.description,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
