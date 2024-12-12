import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'utils/Theme.dart';
import 'pages/Setting.dart';
import 'pages/Feature1.dart';
import 'pages/Feature2.dart';
import 'pages/Feature3.dart';
import 'pages/Feature4.dart';
import 'pages/Feature5.dart';
import 'pages/Feature6.dart';
import 'pages/Feature7.dart';
import 'pages/Feature8.dart';
import 'pages/Feature9.dart';
import 'pages/Feature10.dart';
import 'pages/Feature11.dart';
import 'pages/Feature12.dart';
import 'pages/Feature13.dart';
import 'pages/Feature14.dart';
import 'pages/Feature15.dart';
import 'pages/Feature16.dart';
import 'pages/Feature17.dart';
import 'pages/Feature18.dart';
import 'pages/Feature19.dart';
import 'pages/Feature20.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeChanger(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeChanger>(
      builder: (context, themeChanger, child) {
        return MaterialApp(
          title: 'OpenGPT',
          themeMode: themeChanger.themeMode,
          darkTheme: ThemeData.dark(),
          theme: ThemeData.light(),
          home: HomeScreen(),
        );
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: context.watch<ThemeChanger>().themeMode == ThemeMode.dark
                ? [Color(0xFF000000), Color(0xFF1f1f1f)]
                : [Color(0xFFFFFFFF), Color(0xFFf5f5f5)],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(0.0),
          child: ListView(
            children: [
              SizedBox(height: 15),
				Padding(
				  padding: const EdgeInsets.symmetric(horizontal: 20.0),
				  child: Row(
					mainAxisAlignment: MainAxisAlignment.spaceBetween,
					children: [
					  Row(
						children: [
						  Image.asset(
							'assets/logo.png',
							height: 35,
							width: 35,
						  ),
						  SizedBox(width: 5),
						  Text(
							'OpenGPT',
							style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
						  ),
						],
					  ),
					  Row(
						children: [
						  IconButton(
							icon: Icon(Icons.brightness_6),
							onPressed: () {
							  Provider.of<ThemeChanger>(context, listen: false).toggleTheme();
							},
						  ),
						  IconButton(
							icon: Icon(Icons.info),
							onPressed: () {
							  Navigator.push(
								context,
								MaterialPageRoute(builder: (context) => SettingPage()),
							  );
							},
						  ),
						],
					  ),
					],
				  ),
				),
				GridView.builder(
				  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
					crossAxisCount: 2,
					crossAxisSpacing: 10,
					mainAxisSpacing: 10,
					childAspectRatio: 1,
				  ),
				  shrinkWrap: true,
				  physics: NeverScrollableScrollPhysics(),
				  padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
				  itemCount: 20,
				  itemBuilder: (context, index) {
					List<IconData> icons = [
					  Icons.question_answer, // Tanya
					  Icons.tag, // Buat Tag
					  Icons.create, // Buat Postingan
					  Icons.translate, // Terjemahkan Teks
					  Icons.summarize, // Buat Ringkasan
					  Icons.format_list_bulleted, // Buat Outline
					  Icons.format_list_numbered, // Buat Daftar Isi
					  Icons.description, // Buat Abstrak
					  Icons.movie, // Buat Sinopsis
					  Icons.description, // Buat Laporan
					  Icons.description, // Buat Proposal
					  Icons.mail, // Buat Surat
					  Icons.email, // Buat Email
					  Icons.newspaper, // Buat Artikel
					  Icons.newspaper, // Buat Berita
					  Icons.rate_review, // Buat Ulasan
					  Icons.recommend, // Buat Rekomendasi
					  Icons.online_prediction, // Buat Prediksi
					  Icons.troubleshoot, // Buat Analisis
					  Icons.code, // Perbaiki Kode
					];
					List<String> titles = [
					  'Bertanya',
					  'Tagar',
					  'Postingan',
					  'Terjemahkan',
					  'Ringkasan',
					  'Puisi',
					  'Daftar Isi',
					  'Abstrak',
					  'Sinopsis',
					  'Laporan',
					  'Proposal',
					  'Surat',
					  'Email',
					  'Artikel',
					  'Berita',
					  'Ulasan',
					  'Rekomendasi',
					  'Prediksi',
					  'Analisis',
					  'Perbaiki Kode',
					  
					];
					List<String> subTitles = [
					  'Tanya jawab tentang topik yang Anda inginkan. Dengan fitur ini, Anda dapat menanyakan pertanyaan tentang topik yang Anda inginkan dan mendapatkan jawaban yang akurat.',
					  'Buat tag untuk mengategorikan postingan Anda. Dengan fitur ini, Anda dapat membuat tag untuk mengategorikan postingan Anda dan memudahkan Anda dalam mencari informasi.',
					  'Buat postingan yang menarik dan informatif. Dengan fitur ini, Anda dapat membuat postingan yang menarik dan informatif untuk memudahkan Anda dalam berkomunikasi dengan orang lain.',
					  'Terjemahkan teks dari bahasa asing ke bahasa Anda. Dengan fitur ini, Anda dapat menerjemahkan teks dari bahasa asing ke bahasa Anda dan memudahkan Anda dalam memahami informasi.',
					  'Buat ringkasan dari teks yang panjang. Dengan fitur ini, Anda dapat membuat ringkasan dari teks yang panjang dan memudahkan Anda dalam memahami informasi.',
					  'Buat puisi untuk memudahkan Anda dalam menulis. Dengan fitur ini, Anda dapat membuat puisi untuk memudahkan Anda dalam menulis dan memudahkan Anda dalam berkomunikasi dengan orang lain.',
					  'Buat daftar isi untuk memudahkan Anda dalam mencari informasi. Dengan fitur ini, Anda dapat membuat daftar isi untuk memudahkan Anda dalam mencari informasi dan memudahkan Anda dalam memahami informasi.',
					  'Buat abstrak untuk memudahkan Anda dalam memahami teks. Dengan fitur ini, Anda dapat membuat abstrak untuk memudahkan Anda dalam memahami teks dan memudahkan Anda dalam memahami informasi.',
					  'Buat sinopsis untuk memudahkan Anda dalam memahami cerita. Dengan fitur ini, Anda dapat membuat sinopsis untuk memudahkan Anda dalam memahami cerita dan memudahkan Anda dalam memahami informasi.',
					  'Buat laporan untuk memudahkan Anda dalam memahami data. Dengan fitur ini, Anda dapat membuat laporan untuk memudahkan Anda dalam memahami data dan memudahkan Anda dalam memahami informasi.',
					  'Buat proposal untuk memudahkan Anda dalam memahami rencana. Dengan fitur ini, Anda dapat membuat proposal untuk memudahkan Anda dalam memahami rencana dan memudahkan Anda dalam memahami informasi.',
					  'Buat surat untuk memudahkan Anda dalam berkomunikasi. Dengan fitur ini, Anda dapat membuat surat untuk memudahkan Anda dalam berkomunikasi dengan orang lain dan memudahkan Anda dalam memahami informasi.',
					  'Buat email untuk memudahkan Anda dalam berkomunikasi. Dengan fitur ini, Anda dapat membuat email untuk memudahkan Anda dalam berkomunikasi dengan orang lain dan memudahkan Anda dalam memahami informasi.',
					  'Buat artikel untuk memudahkan Anda dalam memahami topik. Dengan fitur ini, Anda dapat membuat artikel untuk memudahkan Anda dalam memahami topik dan memudahkan Anda dalam memahami informasi.',
					  'Buat berita untuk memudahkan Anda dalam memahami informasi. Dengan fitur ini, Anda dapat membuat berita untuk memudahkan Anda dalam memahami informasi dan memudahkan Anda dalam memahami informasi.',
					  'Buat ulasan untuk memudahkan Anda dalam memahami produk. Dengan fitur ini, Anda dapat membuat ulasan untuk memudahkan Anda dalam memahami produk dan memudahkan Anda dalam memahami informasi.',
					  'Buat rekomendasi untuk memudahkan Anda dalam memahami pilihan. Dengan fitur ini, Anda dapat membuat rekomendasi untuk memudahkan Anda dalam memahami pilihan dan memudahkan Anda dalam memahami informasi.',
					  'Buat prediksi untuk memudahkan Anda dalam memahami kemungkinan. Dengan fitur ini, Anda dapat membuat prediksi untuk memudahkan Anda dalam memahami kemungkinan dan memudahkan Anda dalam memahami informasi.',
					  'Buat analisis untuk memudahkan Anda dalam memahami data. Dengan fitur ini, Anda dapat membuat analisis untuk memudahkan Anda dalam memahami data dan memudahkan Anda dalam memahami informasi.',
					  'Perbaiki kode untuk memudahkan Anda dalam memahami program. Dengan fitur ini, Anda dapat memperbaiki kode untuk memudahkan Anda dalam memahami program dan memudahkan Anda dalam memahi masalah.',
					];
					List<Color> iconColors = [
					  Colors.blue, // Tanya
					  Colors.red, // Buat Tag
					  Colors.green, // Buat Postingan
					  Colors.purple, // Terjemahkan Teks
					  Colors.orange, // Buat Ringkasan
					  Colors.teal, // Buat Puisi
					  Colors.grey, // Buat Daftar Isi
					  Colors.pink.shade600, // Buat Abstrak
					  Colors.pink, // Buat Sinopsis
					  Colors.cyan, // Buat Laporan
					  Colors.teal, // Buat Proposal
					  Colors.lime, // Buat Surat
					  Colors.amber, // Buat Email
					  Colors.deepPurple, // Buat Artikel
					  Colors.indigo, // Buat Berita
					  Colors.blueGrey, // Buat Ulasan
					  Colors.lightBlue, // Buat Rekomendasi
					  Colors.lightGreen, // Buat Prediksi
					  Colors.yellow, // Buat Analisis
					  Colors.deepOrange, // Perbaiki Kode
					];

					return InkWell(
					  onTap: () {
						Navigator.push(
						  context,
						  MaterialPageRoute(builder: (context) {
							switch (index) {
							  case 0:
								return Feature1();
							  case 1:
								return Feature2();
							  case 2:
								return Feature3();
							  case 3:
								return Feature4();
							  case 4:
								return Feature5();
							  case 5:
								return Feature6();
							  case 6:
								return Feature7();
							  case 7:
								return Feature8();
							  case 8:
								return Feature9();
							  case 9:
								return Feature10();
							  case 10:
								return Feature11();
							  case 11:
								return Feature12();
							  case 12:
								return Feature13();
							  case 13:
								return Feature14();
							  case 14:
								return Feature15();
							  case 15:
								return Feature16();
							  case 16:
								return Feature17();
							  case 17:
								return Feature18();
							  case 18:
								return Feature19();
							  case 19:
								return Feature20();
							  default:
								return Container();
							}
						  }),
						);
					  },
					  child: Card(
						elevation: 0,
						shape: RoundedRectangleBorder(
						  borderRadius: BorderRadius.circular(8),
						  side: BorderSide(
							color: context.watch<ThemeChanger>().themeMode == ThemeMode.dark
								? Color(0xFF2b2b2b)
								: Colors.grey[300]!,
						  ),
						),
						child: Padding(
						  padding: const EdgeInsets.all(20.0),
						  child: Column(
							mainAxisSize: MainAxisSize.min,
							crossAxisAlignment: CrossAxisAlignment.start,
							children: [
							  Icon(icons[index], size: 60, color: iconColors[index]),
							  SizedBox(height: 8),
							  Text(
								titles[index],
								style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
								maxLines: 1,
								overflow: TextOverflow.ellipsis,
							  ),
							  SizedBox(height: 4),
							  Text(
								subTitles[index],
								style: TextStyle(fontSize: 14, color: Colors.grey),
								maxLines: 3,
								overflow: TextOverflow.ellipsis,
							  ),
							],
						  ),
						),
					  ),
					);
				  },
				)
            ],
          ),
        ),
      ),
    );
  }
}
