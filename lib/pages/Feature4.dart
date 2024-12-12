import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Feature4 extends StatefulWidget {
  @override
  _Feature4State createState() => _Feature4State();
}

class _Feature4State extends State<Feature4> {
  String _inputText = '';
  String _translatedText = '';
  String _selectedLangID = 'id';
  final List<String> _languages = [
    'id', 'en', 'es', 'fr', 'de',
    'af', 'sq', 'am', 'ar', 'hy', 'az', 'eu', 'be', 'bn', 'bs', 'bg', 'ca', 'ceb', 'ny',
    'zh', 'zh-cn', 'zh-tw', 'co', 'hr', 'cs', 'da', 'nl', 'eo', 'et', 'tl', 'fi', 'fy',
    'gl', 'ka', 'el', 'gu', 'ht', 'ha', 'haw', 'iw', 'hi', 'hmn', 'hu', 'is', 'ig', 'ga',
    'it', 'ja', 'jw', 'kn', 'kk', 'km', 'ko', 'ku', 'ky', 'lo', 'la', 'lv', 'lt', 'lb', 'mk',
    'mg', 'ms', 'ml', 'mt', 'mi', 'mr', 'mn', 'my', 'ne', 'no', 'or', 'ps', 'fa', 'pl', 'pt',
    'pa', 'ro', 'ru', 'sm', 'gd', 'sr', 'st', 'sn', 'sd', 'si', 'sk', 'sl', 'so', 'su',
    'sw', 'sv', 'tg', 'ta', 'te', 'th', 'tr', 'uk', 'ur', 'uz', 'vi', 'cy', 'xh', 'yi', 'yo',
    'zu',
  ];

  final TextEditingController _controller = TextEditingController();
  bool _isLoading = false;

  Future<void> _translateText() async {
    if (_controller.text.isEmpty) {
      return;
    }

    setState(() {
      _isLoading = true;
    });

    final String apiUrl = 'https://api.i-as.dev/api/translate';
    final String langID = _selectedLangID;

    final response = await http.get(Uri.parse('$apiUrl?text=${_controller.text}&lang=$langID'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      setState(() {
        _translatedText = data['textResult'];
        _controller.clear();
        _isLoading = false;
      });
    } else {
      print('Failed to fetch translation: ${response.statusCode}');
      setState(() {
        _isLoading = false;
      });
    }
  }

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
			  'Terjemahan',
		  	  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
		    ),
		  ],
	    ),
        actions: [
          DropdownButton<String>(
            value: _selectedLangID,
            onChanged: (String? newValue) {
              setState(() {
                _selectedLangID = newValue!;
              });
            },
            items: _languages.map<DropdownMenuItem<String>>((String lang) {
              return DropdownMenuItem<String>(
                value: lang,
                child: Text(lang.toUpperCase()),
              );
            }).toList(),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
              child: Text(
                _translatedText.isEmpty ? '' : _translatedText,
                style: TextStyle(fontSize: 14),
                textAlign: TextAlign.left,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0.0),
                child: TextField(
                  controller: _controller,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Tulis',
                  ),
                  onChanged: (value) {
                    setState(() {
                      _inputText = value;
                    });
                  },
                ),
              ),
            ),
            SizedBox(width: 5),
            ElevatedButton(
              onPressed: _isLoading ? null : _translateText,
              child: _isLoading
                  ? CircularProgressIndicator(color: Colors.white, strokeWidth: 4)
                  : Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.translate, size: 25, color: Colors.white),
                      ],
                    ),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(0, 50),
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
