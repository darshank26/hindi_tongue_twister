import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hindi_tongue_twister/utils/constants.dart';
import 'package:line_icons/line_icons.dart';
import 'package:share_plus/share_plus.dart';
import 'package:swipe_cards/draggable_card.dart';
import 'package:swipe_cards/swipe_cards.dart';

import '../utils/content.dart';
import '../utils/string_hi.dart';

class RandomList extends StatefulWidget {
  const RandomList({Key? key}) : super(key: key);

  @override
  State<RandomList> createState() => _RandomListState();
}

class _RandomListState extends State<RandomList> {

  FlutterTts ftts = FlutterTts();
  List<SwipeItem> _swipeItems = <SwipeItem>[];
  MatchEngine? _matchEngine;
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  List<String> _names = [
    "Red",
    "Blue",
    "Green",
    "Yellow",
    "Orange",
    "Grey",
    "Purple",
    "Pink"
  ];


  final List<String> random_list = [
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

  List<Color> _colors = [
    Colors.teal,
    Colors.teal,
    Colors.teal,
    Colors.teal,   Colors.teal,
    Colors.teal,   Colors.teal,
    Colors.teal,   Colors.teal,
    Colors.teal,   Colors.teal,
    Colors.teal,   Colors.teal,
    Colors.teal,   Colors.teal,
    Colors.teal,   Colors.teal,
    Colors.teal,   Colors.teal,
    Colors.teal,   Colors.teal,
    Colors.teal,   Colors.teal,
    Colors.teal,   Colors.teal,
    Colors.teal,
  ];

  @override
  void initState() {
    // TODO: implement

    for (int i = 0; i < random_list.length; i++) {
      _swipeItems.add(SwipeItem(
          content: Content(text: random_list[i], color: _colors[i]),
          likeAction: () {
          },
          nopeAction: () {
          },
          superlikeAction: () {
          },
          onSlideUpdate: (SlideRegion? region) async {
            print("Region $region");
          }));
    }

    _matchEngine = MatchEngine(swipeItems: _swipeItems);
    super.initState();
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
                random_hi,
                style: GoogleFonts.poppins(textStyle: TextStyle(fontSize: 28,color: kprimarycolor,fontWeight: FontWeight.w500)))
          ],
        ),

        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              LineIcons.values['random'],
              size: 28.0,
              color: Colors.black,
            ),
          ),
        ],

        centerTitle: true,
      ),

      backgroundColor: home_back,
      body:Padding(
        padding: const EdgeInsets.all(24.0),
        child: Container(
            child: Stack(children: [
              Container(
                height: MediaQuery.of(context).size.height - kToolbarHeight,
                child: SwipeCards(
                  matchEngine: _matchEngine!,
                  itemBuilder: (BuildContext context, int index) {
                    return Center(
                      child: Container(

                        alignment: Alignment.center,
                        color: _swipeItems[index].content.color,
                        child: Text(random_list[index],
                            textAlign: TextAlign.center,
                            style: GoogleFonts.lato(textStyle: TextStyle(fontSize: 34,color: kprimarycolor,fontWeight: FontWeight.w600,))

                        ),
                      ),
                    );
                  },
                  onStackFinished: () {

                  },
                  itemChanged: (SwipeItem item, int index) {


                  },
                  leftSwipeAllowed: true,
                  rightSwipeAllowed: true,
                  upSwipeAllowed: true,
                  fillSpace: true,

                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          _matchEngine!.currentItem?.nope();
                        },
                        child: Text("Nope")),
                    ElevatedButton(
                        onPressed: () {
                          _matchEngine!.currentItem?.superLike();
                        },
                        child: Text("Superlike")),
                    ElevatedButton(
                        onPressed: () {
                          _matchEngine!.currentItem?.like();
                        },
                        child: Text("Like"))
                  ],
                ),
              )
            ])),
      ));

  }
}
