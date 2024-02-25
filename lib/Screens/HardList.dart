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

class HardList extends StatefulWidget {
  const HardList({Key? key}) : super(key: key);

  @override
  State<HardList> createState() => _HardListState();
}

class _HardListState extends State<HardList> {

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


    final List<String> hard_list = [
      "ऊँट ऊँचा, ऊँट की पीठ ऊंची, ऊँची पूँछ ऊँट की ||",
      "तोला राम ताला तोड़ कर तेल में तुल गया",
      "तुला हुआ तोला तले के तले हुए तेल में तला गया ||",
      "डबल बबल गम बबल डबल( ये तो “देखन में छोटन लगे, घाव करे गंभीर” वाला केस लगता है) ||",
      "पीतल के पतीले में पपीता पीला-पीला ||",
      "जो जो को खोजो खोजो जोजो को, जो जोजो को ना खोजो तो खो जाए जोजो ||",
      "खड़क सिंह के खड़कने से खड़कती हैं खिड़कियां, खिड़कियों के खड़कने से खड़कता है खड़क सिंह(आमिर खान की फ़ना फिल्म के एक गाने में आप इसे देख सकते हैं) ||",
      "तोला राम ताला तोल के तेल में तुल गया, तुला हुआ तोला ताले के तले हुए तेल में तला गया ||",
      "लाला गोपे गोपाल गोपंगगम दास ||",
      "चंदा चमके चम्-चम् चीखे चौक्काना चोर, चीटी चाटे चीनी, चटोरी चीनी खोर ||",
      "मदन मोहन मालविया मद्रास में मछली मारते-मारते मरे ||",
      "चंदू के चाचा ने, चंदू की चाची को, चांदनी चौक में, चांदनी रात में, चांदी के चम्मच से चटनी चटाई ||",
      "ऊँट ऊँचा, ऊँट की पीठ ऊंची, ऊँची पूँछ ऊँट की ||",
      "पीठ ऊँची उंट की उह्चई से नहीं होती, होती ही है होती ही है पीठ ऊँची ऊँट की ||",
      "रोटी खा के पॉटी जाओ पॉटी जा के रोटी खाओ ||",
      "नदी किनारे है किराने की दूकान ||",
      "कच्चा कद्दू, पक्का कद्दू ||",
      "तुला राम ताला तोल के तेल में तुल गया, तुला हुआ तोला ताले के तले हुए तेल में तला गया ||",
      "पक्की कचरी कच्चे चाचा, कच्ची कचरी पक्के ||",
      "चार कचरी कच्चे चाचा, चार कचरी पक्के, पक्की कचरी कच्चे चाचा, कच्ची कचरी पक्के ||",
      "पके पेड़ पर पका पपीता, पका पेड़ या पका पपीता, पके पेड़ को पकड़े पिंकू, पिंकू पकड़े पका पपीता ||",
      "लपक बबुलिया लपक, अब ना लपकबे तो लपकबे कब ||",
      "दूबे दुबई में डूब गया ||",
      "चार कचरी कच्चे चाचा, चार कचरी पक्के ||",
      "मर हम भी गए मरहम के लिए, मरहम ना मिला हम दम से गए, हमदम के लिए, हमदम न मिला ||",
      "समझ समझ के समझ को समझो, समझ समझना भी एक समझ है ||",
      "डाली डाली पे नज़र डाली, किसी ने अच्छी डाली, किसी ने बुरी डाली| जिस डाली पे मैंने नज़र डाली वही डाली किसी ने तोड़ डाली ||",
      "जो हँसेगा वो फंसेगा, जो फंसेगा वो हँसेगा ||",
      "कच्चा पापड़, पक्का पापड़ ||"
    ];


    return Scaffold(
      appBar: AppBar(
        backgroundColor: hard_back,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(4.0),
          child: Container(
            color: Colors.black,
            height: 2.0,
          ),),

        title: Row(
          children: [
            Text(
                hard_hi,
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
        itemCount: hard_list.length,
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
                          child: Text(hard_list[index],
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

                          ftts.speak(hard_list.elementAt(index));
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
                          await Clipboard.setData(ClipboardData(text:hard_list.elementAt(index) ));

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
                          Share.share(hard_list.elementAt(index));
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
              print("Item tapped: ${hard_list[index]}");
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
