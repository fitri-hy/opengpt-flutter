import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingPage extends StatelessWidget {
	
  Future<void> _visitWebsite() async {
    const url = 'https://i-as.dev/';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
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
			  'About',
		  	  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
		    ),
		  ],
	    ),
	  ),

      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
			  Center(
			  child: Column(
				mainAxisAlignment: MainAxisAlignment.center,
				  children: [
				   Image.asset(
					  'assets/logo.png',
					  height: 80,
				    ),
				    SizedBox(height: 5),
				    Text(
					  'Open GPT',
					  style: TextStyle(
					    fontSize: 32,
					    fontWeight: FontWeight.bold,
					  ),
				    ),
				  ],
			    ),
			  ),
				Column(
				  children: [
					Row(
					  mainAxisAlignment: MainAxisAlignment.center,
					  children: [
						Text(
						  'Made with ❤️ by Fitri HY',
						  style: TextStyle(fontSize: 10),
						),
					  ],
					),
				  ],
				),
              SizedBox(height: 20),
              Card(
                elevation: 0,
                margin: EdgeInsets.symmetric(vertical: 10),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Open GPT is an AI-powered text generation tool designed to generate high-quality text based on user input. Leverage its capabilities to create content effortlessly and enhance your productivity.',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),
			  SizedBox(height: 10),
				Row(
				  mainAxisAlignment: MainAxisAlignment.center,
				  children: [
					ElevatedButton(
					  onPressed: () {
						_visitWebsite();
					  },
					  child: Text(
						'Official Site',
						style: TextStyle(
						  color: Colors.white,
						),
					  ),
					  style: ElevatedButton.styleFrom(
						padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
						backgroundColor: Colors.blue,
					  ),
					),
				  ],
				),
            ],
          ),
        ),
      ),
    );
  }
}
