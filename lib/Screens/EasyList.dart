import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:hindi_tongue_twister/utils/constants.dart';
import 'package:line_icons/line_icons.dart';
import 'package:share_plus/share_plus.dart';

import '../AdHelper/adshelper.dart';
import '../utils/string_hi.dart';

class EasyList extends StatefulWidget {
  const EasyList({Key? key}) : super(key: key);

  @override
  State<EasyList> createState() => _EasyListState();
}

class _EasyListState extends State<EasyList> {

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


    final List<String> easy_list = [
      "फासले का फासला।",
      "चटाई पे चटनी चटाई।",
      "जो हँसेगा वो फंसेगा, जो फंसेगा वो हँसेगा।",
      "डबल बबल गम बबल डबल।",
      "नीला अंगूर काला लंगूर।",
      "उड़ी चिड़ी ऊंची उड़ी सब्जी पूड़ी ठंडी पड़ी।",
      "अब कूद रस्सी रस्सी कूद कूद मत गिर पड़।",
      "गोल में गप्पा गप्पे में गोला।",
      "नदी किनारे किराने की दुकान।",
      "राधा की बूनी में नींबू की धारा।",
      "टेची में कैंची टेची पे कैंची।",
      "शरद चन्द्र मकरन मरकण शंकर नन्द।",
      "कच्चा पापड़, पक्का पापड़।",
      "राजा गोप गोपाल गोपग्गम दास।",
      "लाला गोपे गोपाल गोपंग्गम दास।",
      "कोका कोला कोकिला का किला।",
      "भालु काला आलू भूरा।",
      "बुड्ढ़े के बाल गुड्ढ़े के गाल।",
      "पीतल के पतीले मे पका पपीता पीला पीला।",
      "कच्चा कद्दू, पक्का कद्दू।",
      "छल्ले में छल्ला छज्जे पे चच्चा।",
      "दूबे दुबई में डूब गया।",
      "लकड़ी पर चकरी चकरी में लड़की।",
      "आले में अलमारी काली अलमारी।"
    ];



    return Scaffold(
      appBar: AppBar(
        backgroundColor: easy_back,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(4.0),
          child: Container(
            color: Colors.black,
            height: 2.0,
          ),),

        title: Row(
          children: [
            Text(
                  easy_hi,
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
      body: ListView.builder(
        itemCount: easy_list.length,
        itemBuilder: (context, index) {
          return ListTile(
            dense:true,
            minVerticalPadding: 0,
            contentPadding: EdgeInsets.zero,
            title:  Container(
              decoration: const BoxDecoration(
                color: home_back,
                border: Border(
                  bottom: BorderSide( //
                    color: Colors.black,
                    width: 2.0,
                  ),
                ),

              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(easy_list[index],
                              style: GoogleFonts.lato(textStyle: TextStyle(fontSize: 22,color: kprimarycolor,fontWeight: FontWeight.w600))

                          ),
                        ),
                      ),

                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () async{

                          print(await ftts.getLanguages);
                          print(ftts.isLanguageAvailable('hi-IN'));
                          print(ftts.isLanguageInstalled('hi-IN'));

                          ftts.speak(easy_list.elementAt(index));
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(
                            LineIcons.values['volumeUp'],
                            size: 30.0,
                            color: Colors.black,
                          ),
                        ),
                      ),

                      GestureDetector(
                        onTap: () async{
                          await Clipboard.setData(ClipboardData(text:easy_list.elementAt(index) ));

                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(
                            LineIcons.values['copy'],
                            size: 30.0,
                            color: Colors.black,
                          ),
                        ),
                      ),

                      GestureDetector(
                        onTap: () {
                          Share.share(easy_list.elementAt(index));
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(
                            LineIcons.values['share'],
                            size: 30.0,
                            color: Colors.black,
                          ),
                        ),
                      ),

                    ],
                  ),

                ],
              ), //
            ),
            onTap: () {
              // Handle item tap
              print("Item tapped: ${easy_list[index]}");
            },
          );
        },
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
}
