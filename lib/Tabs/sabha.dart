import 'package:alquran/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Sabha extends StatefulWidget {
  @override
  State<Sabha> createState() => _SabhaState();
}

class _SabhaState extends State<Sabha> {
  int taspehCounter = 0;
  int index = 0;
  double angle = 0;
  List<String> Taspeh = [
    "أستغفر الله",
    "الحمد الله",
    "سبحان الله",
    "لا اله الا الله",
  ];

  onTab() {
    taspehCounter++;
    angle += 2;
    if (taspehCounter == 33) {
      taspehCounter = 0;
      index++;
    }
    if (index == Taspeh.length) {
      index = 0;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 80,
                ),
                child: Image.asset(
                  "assets/images/head of seb7a.png",
                ),
              ),
              GestureDetector(
                onTap: onTab,
                child: Padding(
                  padding: const EdgeInsets.all(35.0),
                  child: Transform.rotate(
                    angle: angle,
                    child: Image.asset(
                      "assets/images/body of seb7a.png",
                      width: 270,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Text(
            "عدد التسبيحات",
            style: GoogleFonts.elMessiri(
              color: AppColors.blackColor,
              fontWeight: FontWeight.w600,
              fontSize: 25,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: AppColors.orange,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Text(
              "$taspehCounter",
              style: GoogleFonts.elMessiri(
                color: AppColors.blackColor,
                fontSize: 25,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            decoration: BoxDecoration(
              color: AppColors.text,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Text(
              Taspeh[index],
              style: GoogleFonts.elMessiri(
                color: AppColors.whiteColor,
                fontSize: 25,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
