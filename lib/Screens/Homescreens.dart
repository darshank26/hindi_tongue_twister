import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:hindi_tongue_twister/Screens/AboutApp.dart';
import 'package:hindi_tongue_twister/Screens/EasyList.dart';
import 'package:hindi_tongue_twister/Screens/HardList.dart';
import 'package:hindi_tongue_twister/Screens/MediumList.dart';
import 'package:hindi_tongue_twister/Screens/RandomList.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';
import 'package:page_transition/page_transition.dart';
import '../AdHelper/adshelper.dart';
import '../utils/constants.dart';
import '../utils/string_hi.dart';
import 'package:flutter_svg/flutter_svg.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  late BannerAd _bannerAd;

  bool _isBannerAdReady = false;

  @override
  void initState() {
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

  }

  @override
  void dispose() {
    super.dispose();
    _bannerAd.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: home_back,
        title: Row(
          children: [
            Icon(
              LineIcons.values['winkingFaceWithTongueAlt'],
              size: 52.0,
              color: Colors.black,
            ),
          ],
        ),
        // actions: [
        //   Padding(
        //     padding: const EdgeInsets.only(left:8.0),
        //     child: PopupMenuButton(
        //         icon: SvgPicture.asset(
        //           'assets/icons/more-alt.svg',
        //           height: 20.0,
        //           width: 20.0,
        //           allowDrawingOutsideViewBox: true,
        //         ),
        //         // add this line
        //         itemBuilder: (_) => <PopupMenuItem<String>>[
        //           const PopupMenuItem<String>(
        //               value: 'About App',
        //               child: SizedBox(
        //                   width: 80,
        //                   // height: 30,
        //                   child: Column(
        //                     mainAxisAlignment: MainAxisAlignment.start,
        //                     crossAxisAlignment: CrossAxisAlignment.start,
        //                     children: [
        //                       Padding(
        //                         padding: EdgeInsets.all(8.0),
        //                         child: Text(
        //                           "About",
        //                           style: TextStyle(color: Colors.black, fontSize: 14),
        //                         ),
        //                       ),
        //                       Padding(
        //                         padding: EdgeInsets.all(8.0),
        //                         child: Text(
        //                           "Share",
        //                           style: TextStyle(color: Colors.black, fontSize: 14),
        //                         ),
        //                       ),
        //                       Padding(
        //                         padding: EdgeInsets.all(8.0),
        //                         child: Text(
        //                           "Rate Us",
        //                           style: TextStyle(color: Colors.black, fontSize: 14),
        //                         ),
        //                       ),
        //
        //                     ],
        //                   ))),
        //
        //         ],
        //         onSelected: (index) async {
        //           switch (index) {
        //             case 'About':
        //               Navigator.pop(context);
        //               break;
        //           }
        //         }),
        //   )
        // ],
        centerTitle: true,
      ),
      backgroundColor: home_back,
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 30,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Text(
                      homescreen_welcome_1,
                      style: GoogleFonts.poppins(textStyle: TextStyle(fontSize: 45,color: kprimarycolor,fontWeight: FontWeight.w500))
                  ),
                ],
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: EasyList()));

                },
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Container(
                    width: double.infinity,
                    height: 100,
                    decoration: BoxDecoration(
                      color: easy_back,
                      border: Border.all(
                        color: Colors.black,
                        width: 2.0, // You can adjust the width of the border
                      ),
                      borderRadius: BorderRadius.circular(10.0), // Adjust the radius as needed
                    ),
                    child: Center(child: Text(easy_hi,
                        style: GoogleFonts.lato(textStyle: TextStyle(fontSize: 36,color: kprimarycolor,fontWeight: FontWeight.w500))

                  )), // Add your content here
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: MediumList()));

                },
                child: Padding(
                  padding: const EdgeInsets.only(left:24.0,right: 24.0,top:0),
                  child: Container(
                    width: double.infinity,
                    height: 100,
                    decoration: BoxDecoration(
                      color: medium_back,
                      border: Border.all(
                        color: Colors.black,
                        width: 2.0, // You can adjust the width of the border
                      ),
                      borderRadius: BorderRadius.circular(10.0), // Adjust the radius as needed
                    ),
                    child: Center(child: Text(medium_hi,
                        style: GoogleFonts.lato(textStyle: TextStyle(fontSize: 36,color: kprimarycolor,fontWeight: FontWeight.w500))

                    )), // Add your content here
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: HardList()));

                },
                child: Padding(
                  padding: const EdgeInsets.only(left:24.0,right: 24.0,top:24),
                  child: Container(
                    width: double.infinity,
                    height: 100,
                    decoration: BoxDecoration(
                      color: hard_back,
                      border: Border.all(
                        color: Colors.black,
                        width: 2.0, // You can adjust the width of the border
                      ),
                      borderRadius: BorderRadius.circular(10.0), // Adjust the radius as needed
                    ),
                    child: Center(child: Text(hard_hi,
                        style: GoogleFonts.lato(textStyle: TextStyle(fontSize: 36,color: kprimarycolor,fontWeight: FontWeight.w500))

                    )), // Add your content here
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: AboutApp()));

                },
                child: Padding(
                  padding: const EdgeInsets.only(left:24.0,right: 24.0,top:24),
                  child: Container(
                    width: double.infinity,
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0), // Adjust the radius as needed

                      color: Colors.teal,
                      border: Border.all(
                        color: Colors.black,
                        width: 2.0,
                        // You can adjust the width of the border
                      ),

                    ),
                    child: Center(child: Text(about_app,
                        style: GoogleFonts.lato(textStyle: TextStyle(fontSize: 36,color: kprimarycolor,fontWeight: FontWeight.w500))

                    )), // Add your content here
                  ),
                ),
              ),



            ],
          ),
        ),
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
