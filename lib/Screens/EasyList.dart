import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hindi_tongue_twister/utils/constants.dart';
import 'package:line_icons/line_icons.dart';

import '../utils/string_hi.dart';

class EasyList extends StatefulWidget {
  const EasyList({Key? key}) : super(key: key);

  @override
  State<EasyList> createState() => _EasyListState();
}

class _EasyListState extends State<EasyList> {
  @override
  Widget build(BuildContext context) {

    final List<String> easy_list = [
      "Item 1",
      "Item 2",
      "Item 3",
      "Item 4",
      "Item 5",
      "Item 1",
      "Item 2",
      "Item 3",
      "Item 4",
      "Item 5",
      "Item 1",
      "Item 2",
      "Item 3",
      "Item 4",
      "Item 5",
      "Item 1",
      "Item 2",
      "Item 3",
      "Item 4",
      "Item 5",

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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(easy_list[index],
                        style: GoogleFonts.lato(textStyle: TextStyle(fontSize: 22,color: kprimarycolor,fontWeight: FontWeight.w500))

                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      LineIcons.values['heart'],
                      size: 30.0,
                      color: Colors.black,
                    ),
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

      // SingleChildScrollView(
      //   child: Column(
      //     children: [
      //       Container(
      //         width: double.infinity,
      //         decoration: const BoxDecoration(
      //           color: easy_back,
      //           border: Border(
      //             top: BorderSide( //
      //               color: Colors.black,
      //               width: 2.0,
      //             ),
      //             bottom: BorderSide( //
      //               color: Colors.black,
      //               width: 2.0,
      //             ),
      //           ),
      //
      //         ),
      //         child: Center(child: Padding(
      //           padding: const EdgeInsets.all(8.0),
      //           child: Text("Hello",
      //               style: GoogleFonts.lato(textStyle: TextStyle(fontSize: 36,color: kprimarycolor,fontWeight: FontWeight.w500))
      //
      //           ),
      //         )), //
      //       ),
      //
      //     ],
      //   ),
      // ),
    );
  }
}
