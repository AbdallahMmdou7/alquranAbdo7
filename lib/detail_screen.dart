import 'dart:convert';

import 'package:alquran/app_colors.dart';
import 'package:alquran/models/ayat.dart';
import 'package:alquran/models/suhra.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailScreen extends StatelessWidget {
  final int? noSurat;
  final String? surahName;

  const DetailScreen({super.key, this.noSurat, this.surahName});

  Future<Surah> _getDetailSurah() async {
    var data = await Dio().get("https://equran.id/api/surat/$noSurat");
    return Surah.fromJson(json.decode(data.toString()));
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Surah>(
        future: _getDetailSurah(),
        initialData: null,
        builder: ((context, snapshot) {
          if (!snapshot.hasData) {
            return Scaffold(
              backgroundColor: AppColors.backgroundColor,
            );
          }
          Surah surah = snapshot.data!;
          return Stack(
            children: [
              Image.asset(
                "assets/images/minBack.png",
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.fill,
              ),
              Scaffold(
                backgroundColor: Colors.transparent,
                appBar: _appBar(context: context, surah: surah),
                body: NestedScrollView(
                  headerSliverBuilder: (context, innerBoxIsScrolled) => [
                    SliverToBoxAdapter(
                      child: _details(surah: surah),
                    )
                  ],
                  body: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                    ),
                    child: ListView.separated(
                      itemBuilder: (context, index) => _ayatItem(
                        ayat: surah.ayat!.elementAt(
                          index + (noSurat == 1 ? 1 : 0),
                        ),
                      ),
                      itemCount: surah.jumlahAyat + (noSurat == 1 ? -1 : 0),
                      separatorBuilder: (context, index) => Container(),
                    ),
                  ),
                ),
              )
            ],
          );
        }));
  }

  Widget _ayatItem({required Ayat ayat}) => Padding(
        padding: const EdgeInsets.only(top: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              decoration: BoxDecoration(
                color: AppColors.orange,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Container(
                    width: 45,
                    height: 50,
                    decoration: BoxDecoration(
                      color: AppColors.text,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                        child: Text(
                      '${ayat.nomor}',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                        fontSize: 25,
                      ),
                    )),
                  ),
                  const Spacer(),
                  const Icon(
                    Icons.share_outlined,
                    color: Colors.white,
                    size: 30,
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  const Icon(
                    Icons.play_arrow_outlined,
                    color: Colors.white,
                    size: 38,
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  const Icon(
                    Icons.bookmark_outline,
                    color: Colors.white,
                    size: 30,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            Text(
              ayat.ar,
              style: GoogleFonts.amiri(
                color: AppColors.blackColor,
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
              textAlign: TextAlign.right,
            ),
            const SizedBox(
              height: 16,
            ),
          ],
        ),
      );

  Widget _details({required Surah surah}) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Stack(children: [
          Container(
            height: 257,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    stops: [
                      0,
                      .6,
                      9
                    ],
                    colors: [
                      Color(0xFF3A3737),
                      Color(0xf2d3afaf),
                      Color(0xff302d2d),
                    ])),
          ),
          Positioned(
              bottom: 0,
              right: 0,
              top: 0,
              child: Opacity(
                  opacity: .2,
                  child: SvgPicture.asset(
                    'assets/svgs/quran.svg',
                    width: 324 - 55,
                  ))),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(28),
            child: Column(
              children: [
                Text(
                  surah.namaLatin,
                  style: GoogleFonts.elMessiri(
                    color: AppColors.blackColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                // Text(
                //   surah.arti,
                //   style: GoogleFonts.poppins(
                //     color: Colors.white,
                //     fontWeight: FontWeight.w500,
                //     fontSize: 20,
                //   ),
                // ),
                Divider(
                  color: AppColors.primaryColorLight.withOpacity(.35),
                  thickness: 2,
                  height: 32,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      surah.tempatTurun.name,
                      style: GoogleFonts.poppins(
                        color: AppColors.blackColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Container(
                      width: 4,
                      height: 4,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(2),
                        color: AppColors.blackColor,
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      "${surah.jumlahAyat} Ayat",
                      style: GoogleFonts.poppins(
                        color: Colors.orange,
                        fontWeight: FontWeight.w500,
                        fontSize: 19,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 32,
                ),
                SvgPicture.asset(
                  'assets/svgs/bismillah.svg',
                  color: Colors.white,
                ),
              ],
            ),
          )
        ]),
      );

  AppBar _appBar({required BuildContext context, required Surah surah}) =>
      AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Row(children: [
          IconButton(
            onPressed: (() => Navigator.of(context).pop()),
            icon: SvgPicture.asset('assets/svgs/back-icon.svg'),
          ),
          const SizedBox(
            width: 68,
          ),
          Text(
            surah.nama,
            style: GoogleFonts.elMessiri(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: AppColors.blackColor,
            ),
          ),
          const Spacer(),
          IconButton(
            onPressed: (() => {}),
            icon: SvgPicture.asset('assets/svgs/search_icon.svg',
                color: AppColors.blackColor),
          ),
        ]),
      );
}
