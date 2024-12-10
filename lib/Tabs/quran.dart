import 'package:alquran/app_colors.dart';
import 'package:alquran/detail_screen.dart';
import 'package:alquran/models/suhra.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class SurahTab extends StatelessWidget {
  const SurahTab({super.key});

  Future<List<Surah>> _getSurahList() async {
    String data = await rootBundle.loadString('assets/datas/list_surah.json');
    return surahFromJson(data);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Surah>>(
        future: _getSurahList(),
        initialData: [],
        builder: ((context, snapshot) {
          if (!snapshot.hasData) {
            return Container();
          }
          return Column(
            children: [
              Expanded(child: Image.asset("assets/images/logo (1).png")),
              const Divider(thickness: 3, color: AppColors.orange),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Spacer(),
                  Text(
                    "عدد الآيات",
                    style: GoogleFonts.amiri(
                      color: AppColors.blackColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 24,
                    ),
                  ),
                  const Spacer(),
                  Container(
                    height: 70,
                    width: 5,
                    color: AppColors.orange,
                  ),
                  const Spacer(),
                  Text(
                    "أسم السورة",
                    style: GoogleFonts.amiri(
                      color: AppColors.blackColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 24,
                    ),
                  ),
                  const Spacer(),
                ],
              ),
              const Divider(thickness: 3, color: AppColors.orange),
              Expanded(
                flex: 2,
                child: ListView.separated(
                    itemBuilder: (context, index) => _surahItem(
                        context: context,
                        surah: snapshot.data!.elementAt(index)),
                    separatorBuilder: (context, index) =>
                        Divider(thickness: 2, color: AppColors.orange),
                    itemCount: snapshot.data!.length),
              ),
            ],
          );
        }));
  }

  Widget _surahItem({required Surah surah, required BuildContext context}) =>
      GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => DetailScreen(
                    noSurat: surah.nomor,
                  )));
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 28),
          child: Row(
            children: [
              Stack(
                children: [
                  SvgPicture.asset(
                    'assets/svgs/nomor-surah.svg',
                    width: 90,
                  ),
                  SizedBox(
                    height: 89,
                    width: 100,
                    child: Center(
                      child: Text(
                        "${surah.jumlahAyat} ",
                        style: GoogleFonts.poppins(
                          color: AppColors.blackColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 24,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              const Spacer(),
              Text(
                surah.nama,
                style: GoogleFonts.amiri(
                  color: AppColors.gray,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      );
}
