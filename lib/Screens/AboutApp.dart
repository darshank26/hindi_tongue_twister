import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:hindi_tongue_twister/utils/constants.dart';
import 'package:launch_review/launch_review.dart';
import 'package:line_icons/line_icons.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import '../AdHelper/adshelper.dart';
import '../utils/string_hi.dart';

class AboutApp extends StatefulWidget {
  const AboutApp({Key? key}) : super(key: key);

  @override
  State<AboutApp> createState() => _AboutAppState();
}

class _AboutAppState extends State<AboutApp> {

  FlutterTts ftts = FlutterTts();
  late BannerAd _bannerAd;

  bool _isBannerAdReady = false;


  @override
  void dispose() {
    super.dispose();
    _bannerAd.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _bannerAd = BannerAd(
      adUnitId: AdHelper.bannerAdUnitIdOfHomeScreen,
      request: AdRequest(),
      size: AdSize.banner,
      listener: BannerAdListener(
        onAdLoaded: (_) {
          setState(() {
            _isBannerAdReady = true;
          });
        },
        onAdFailedToLoad: (ad, err) {
          print('Failed to load a banner ad: ${err.message}');
          _isBannerAdReady = false;
          ad.dispose();
        },
      ),
    );
    _bannerAd.load();
    ftts.setLanguage('hi-IN');
    ftts.setSpeechRate(0.3);
    ftts.setVolume(1.0); //volume of speech
    ftts.setPitch(1);
  }

  @override
  Widget build(BuildContext context) {



    return Scaffold(
      appBar: AppBar(
        backgroundColor: random_back,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(4.0),
          child: Container(
            color: Colors.black,
            height: 2.0,
          ),),

        title: Row(
          children: [
            Text(
                about_app,
                style: GoogleFonts.poppins(textStyle: TextStyle(fontSize: 28,color: kprimarycolor,fontWeight: FontWeight.w500)))
          ],
        ),

        // actions: [
        //   Padding(
        //     padding: const EdgeInsets.all(8.0),
        //     child: Icon(
        //       LineIcons.values['random'],
        //       size: 28.0,
        //       color: Colors.black,
        //     ),
        //   ),
        // ],

        centerTitle: true,
      ),

      backgroundColor: home_back,
      body: SingleChildScrollView(
        child: Column(children: [
          Center(child: Image.asset('assets/images/logo.png',width: 200,height: 200,)),
          Padding(
            padding: const EdgeInsets.only(left:24.0,right: 24.0,top:0,bottom: 24.0),
            child: Container(
              width: 300,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0), // Adjust the radius as needed
                color: random_back.shade400,
                border: Border.all(
                  color: Colors.black,
                  width: 2.0,
                  // You can adjust the width of the border
                ),

              ),
              child: Center(child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(homescreen_welcome_1,
                    style: GoogleFonts.lato(textStyle: TextStyle(fontSize: 30,color: kprimarycolor,fontWeight: FontWeight.w500))

                ),
              )), // Add your content here
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left:44.0,right: 44.0,top:0),
            child: Container(
              height: 1.0,
              color: Colors.black12,
            ),
          ),
          GestureDetector(
            onTap: (){
              launchShare();
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    flex:1,
                    child: Icon(
                      LineIcons.values['shareSquare'],
                      size: 32.0,
                      color: Colors.black,
                    ),
                  ),
                  Expanded(
                    flex:1,
                    child: Text("Share",
                        style: GoogleFonts.lato(textStyle: TextStyle(fontSize: 22,color: kprimarycolor,fontWeight: FontWeight.w600))

                    ),
                  ),
                  Expanded(
                    flex:1,
                    child: Icon(
                      LineIcons.values['arrowCircleRight'],
                      size: 22.0,
                      color: Colors.black,
                    ),
                  ),
                ],),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left:44.0,right: 44.0,top:0),
            child: Container(
              height: 1.0,
              color: Colors.black12,
            ),
          ),
          GestureDetector(
            onTap: () {
              launchMoreApps();
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    flex:1,
                    child: Icon(
                      LineIcons.values['medapps'],
                      size: 32.0,
                      color: Colors.black,
                    ),
                  ),
                  Expanded(
                    flex:1,
                    child: Text("More Apps",
                        style: GoogleFonts.lato(textStyle: TextStyle(fontSize: 22,color: kprimarycolor,fontWeight: FontWeight.w600))

                    ),
                  ),
                  Expanded(
                    flex:1,
                    child: Icon(
                      LineIcons.values['arrowCircleRight'],
                      size: 22.0,
                      color: Colors.black,
                    ),
                  ),
                ],),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left:44.0,right: 44.0,top:0),
            child: Container(
              height: 1.0,
              color: Colors.black12,
            ),
          ),
          GestureDetector(
            onTap: () {
              launchPlay();
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    flex:1,
                    child: Icon(
                      LineIcons.values['starStruck'],
                      size: 32.0,
                      color: Colors.black,
                    ),
                  ),
                  Expanded(
                    flex:1,
                    child: Text("Rate Us",
                        style: GoogleFonts.lato(textStyle: TextStyle(fontSize: 22,color: kprimarycolor,fontWeight: FontWeight.w600))

                    ),
                  ),
                  Expanded(
                    flex:1,
                    child: Icon(
                      LineIcons.values['arrowCircleRight'],
                      size: 22.0,
                      color: Colors.black,
                    ),
                  ),
                ],),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left:44.0,right: 44.0,top:0),
            child: Container(
              height: 1.0,
              color: Colors.black12,
            ),
          ),
          GestureDetector(
            onTap: () {
              launchMail();
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    flex:1,
                    child: Icon(
                      LineIcons.values['coffee'],
                      size: 32.0,
                      color: Colors.black,
                    ),
                  ),
                  Expanded(
                    flex:1,
                    child: Text("Email Us",
                        style: GoogleFonts.lato(textStyle: TextStyle(fontSize: 22,color: kprimarycolor,fontWeight: FontWeight.w600))

                    ),
                  ),
                  Expanded(
                    flex:1,
                    child: Icon(
                      LineIcons.values['arrowCircleRight'],
                      size: 22.0,
                      color: Colors.black,
                    ),
                  ),
                ],),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left:44.0,right: 44.0,top:0),
            child: Container(
              height: 1.0,
              color: Colors.black12,
            ),
          ),


        ],),
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (_isBannerAdReady)
            Container(
              width: _bannerAd.size.width.toDouble(),
              height: _bannerAd.size.height.toDouble(),
              child: AdWidget(ad: _bannerAd),
            ),
        ],
      ),


    );
  }

  void launchShare() {
    Share.share('Download Tongue Twister App in Hindi from below link ${androidAppShareLink}');

  }

  void launchMoreApps() async {
    const url = 'https://play.google.com/store/apps/developer?id=Darshan+Komu';  // Replace with your desired URL
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void launchMail() async {

     Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'darsh2605@gmail.com',
    );

    if (await canLaunchUrl(emailLaunchUri)) {
      await launchUrl(emailLaunchUri);
    } else {
      throw 'Could not launch $emailLaunchUri';
    }
  }
  void launchPlay() async {
    LaunchReview.launch(
      androidAppId: androidAppIdValue,
      iOSAppId: iOSAppIdValue,);
  }

}
