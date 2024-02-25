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

class MediumList extends StatefulWidget {
  const MediumList({Key? key}) : super(key: key);

  @override
  State<MediumList> createState() => _MediumListState();
}

class _MediumListState extends State<MediumList> {

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


    final List<String> medium_list = [
      "पके पेड़ पर पका पपीता, पका पेड़ या पका पपीता, पके पेड़ को पकडे पिंकू, पिंकू पकडे पका पपीता।",
      "राधा की बूनी में नींबू की धारा।",
      "नंदनगढ़ में, नंदू के नाना ने, नंदू की नानी को, नदिया किनारे, नीम के नीचे, नीनी, करायी।",
      "लाला गोपे गोपाल गपुँग़म दास।",
      "तुला राम ताला तोल के तेल में तुल गया, तुला हुआ तोला तले हुए तेल में तल गया।",
      "कोका कोला कोकिला का किला।",
      "राजा गोप गोपाल गोपग्गम दास।",
      "मदन मोहन मालवीय मदा्स में मछली मारते मारते मरे।",
      "पानी में पकोड़ी कचोड़ी की चटोरी।",
      "ले नियम दे नियम दे नियम ले नियम।",
      "चाचा के चौड़े चबूतरे पर चील ने चूहे को चोंच से चबा डाला।",
      "नज़र नज़र में हर एक नज़र में हमे उस नज़र की तलाश थी। वो नज़र मिली तो सही पर उस नज़र में अब वो नज़र कहाँ थी।",
      "मदन मोहन मालवीय मदा्स में मछली मारते मारते मरे।",
      "राधा की बूनी में नींबू की धारा।",
      "कच्चा पापड़ पक्का पापड़।",
      "लाल लाल लिफाफे में लड्डू।",
      "लाली बोली लालू से लल्लन लाया था लालू की शादी पे, लाल लाल लिफाफे में लड्डू।",
      "पानी में पकोड़ी कचोड़ी की चटोरी।",
      "ले नियम दे नियम दे नियम ले नियम।",
      "चाचा के चौड़े चबूतरे पर चील ने चूहे को चोंच से चबा डाला।",
      "नंदू के नाना ने नंदू की नानी को नंद नगर मे नागिन दिखाई।",
      "चंदू के चाचा ने, चंदू की चाची को, चांदनी-चौक में, चांदनी रात में, चांदी के चम्मच से चटनी चटाई।",
      "चार चोर चार छाते में चार अचार चाटे, चाट-चाट कर चार छाता चोर चुराकर भागे।",
      "चार कचड़ी कच्चे चाचा, चार कचड़ी पक्के. पक्की कचड़ी कच्चे चाचा, कच्ची कचड़ी पक्के।"
    ];


    return Scaffold(
      appBar: AppBar(
        backgroundColor: medium_back,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(4.0),
          child: Container(
            color: Colors.black,
            height: 2.0,
          ),),

        title: Row(
          children: [
            Text(
                medium_hi,
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
        itemCount: medium_list.length,
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
                          child: Text(medium_list[index],
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

                          ftts.speak(medium_list.elementAt(index));
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
                          await Clipboard.setData(ClipboardData(text:medium_list.elementAt(index) ));

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
                          Share.share(medium_list.elementAt(index));
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
              print("Item tapped: ${medium_list[index]}");
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
