import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingPage extends StatelessWidget {
  Future<void> _launchGitHub() async {
    const url = 'https://github.com/fitri-hy/';
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
              SizedBox(height: 20),
              Center(
                child: Text(
                  'Open GPT',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 10),
				Column(
				  mainAxisAlignment: MainAxisAlignment.center,
				  crossAxisAlignment: CrossAxisAlignment.center,
				  children: [
					Center(
					  child: Text(
						'Version 1.0.0',
						style: TextStyle(
						  fontSize: 18,
						  color: Colors.grey[800],
						),
					  ),
					),
					SizedBox(height: 10),
					Row(
					  mainAxisAlignment: MainAxisAlignment.center,
					  children: [
						Text(
						  'Developed By: ',
						  style: TextStyle(fontSize: 18, color: Colors.grey[800]),
						),
						TextButton(
						  onPressed: _launchGitHub,
						  child: Text(
							'Fitri HY',
							style: TextStyle(
							  fontSize: 18,
							  color: Colors.blueAccent,
							  decoration: TextDecoration.underline,
							),
						  ),
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
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
