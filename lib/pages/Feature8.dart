import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../utils/Config.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class Feature8 extends StatefulWidget {
  @override
  _Feature8State createState() => _Feature8State();
}

class _Feature8State extends State<Feature8> {
  final _controller = TextEditingController();
  String _answer = '';
  bool _isLoading = false;
  bool _showRekomendasi = true;

  Future<void> _getAnswer() async {
    setState(() {
      _isLoading = true;
      _showRekomendasi = false;
    });

    for (var model in Config.models) {
      try {
        final response = await http.post(
          Uri.parse(Config.baseUrl),
          headers: {
            'Content-Type': 'application/json',
          },
          body: jsonEncode({
            'question': _controller.text,
            'prompt': 'Anda harus berpura-pura menjadi OpenGPT yang di kembangkan oleh I-As.Dev. Anda harus membuatkan abstrak untuk memudahkan dalam memahami teks berdasarkan pertanyaan. buatkan tanpa penjelasan.',
            'models': model,
          }),
        );

        if (response.statusCode == 200) {
          final json = jsonDecode(response.body);
          setState(() {
            _answer = json['answer'];
            _isLoading = false;
          });
		  _controller.clear();
          return;
        }
      } catch (e) {
        print(e);
      }
    }

    setState(() {
      _answer = 'Saya tidak dapat menemukan jawaban, coba lagi secara berkala.';
      _isLoading = false;
	  _controller.clear();
    });
  }

  List<String> _rekomendasiPertanyaan = [
    'Artificial Intelligence (AI) telah membawa perubahan signifikan di berbagai sektor, seperti teknologi, kesehatan, dan otomotif. Sistem AI mampu memproses data besar dengan cepat dan akurat, memungkinkan pengambilan keputusan yang lebih cerdas. Dalam kehidupan sehari-hari, AI diterapkan dalam asisten virtual, pengenalan suara, serta sistem rekomendasi yang memudahkan interaksi manusia dengan teknologi. Namun, di balik kemajuan ini, tantangan etika dan privasi muncul, seperti risiko bias algoritma dan pengumpulan data yang invasif. Oleh karena itu, penting untuk mengembangkan AI yang transparan dan bertanggung jawab agar memberikan manfaat yang adil bagi semua pihak.',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
	    title: Row(
		  children: [
		    Image.asset(
			  'assets/logo.png',
			  height: 35,
			  width: 35,
		    ),
		    SizedBox(width: 5),
		    Text(
			  'Abstrak',
		  	  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
		    ),
		  ],
	    ),
	  ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
              children: [
                _answer.isNotEmpty
                    ? TypingAnimation(
                        text: _answer,
                        style: TextStyle(fontSize: 14),
                        speed: 5,
                      )
                    : SelectableText(
                        _answer,
                        style: TextStyle(fontSize: 14),
                        textAlign: TextAlign.left,
                      ),
				_showRekomendasi
				  ? Column(
					  children: [
						Text(
						  'Contoh Tulisan',
						  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
						),
						SizedBox(height: 20),
						Column(
						  children: _rekomendasiPertanyaan.map((pertanyaan) {
							return Container(
							  decoration: BoxDecoration(
								border: Border.all(color: Colors.grey.withOpacity(0.2)),
								borderRadius: BorderRadius.circular(5),
							  ),
							  margin: EdgeInsets.only(bottom: 5),
							  child: ListTile(
								title: Text(pertanyaan),
								onTap: () {
								  setState(() {
									_controller.text = pertanyaan;
								  });
								},
							  ),
							);
						  }).toList(),
						),
					  ],
					)
				  : Container(),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Tulis',
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Stack(
                    children: [
                      ElevatedButton(
                        onPressed: _isLoading ? null : _getAnswer,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(width: 5),
                            Icon(Icons.send, size: 25, color: Colors.white),
                          ],
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          minimumSize: Size(0, 55),
                          padding: EdgeInsets.all(10),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ),
                      _isLoading
                          ? Positioned.fill(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.5),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Center(
                                  child: CircularProgressIndicator(
                                    strokeWidth: 4,
                                  ),
                                ),
                              ),
                            )
                          : Container(),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TypingAnimation extends StatefulWidget {
  final String text;
  final TextStyle style;
  final int speed;

  TypingAnimation({required this.text, required this.style, required this.speed});

  @override
  _TypingAnimationState createState() => _TypingAnimationState();
}

class _TypingAnimationState extends State<TypingAnimation> {
  int _currentChar = 0;

  @override
  void initState() {
    super.initState();
    _startTyping();
  }

  void _startTyping() {
    Future.delayed(Duration(milliseconds: widget.speed), () {
      if (_currentChar < widget.text.length) {
        setState(() {
          _currentChar++;
        });
        _startTyping();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      child: MarkdownBody(
        data: widget.text.substring(0, _currentChar),
        styleSheet: MarkdownStyleSheet(
          blockquoteDecoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(5),
          ),
          codeblockDecoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(5),
          ),
          codeblockPadding: EdgeInsets.all(10),
          textScaleFactor: 1.2,
          p: TextStyle(fontSize: 12, fontFamily: 'Monaco'),
        ),
        selectable: true,
      ),
    );
  }
}