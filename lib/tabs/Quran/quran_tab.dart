import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami_app/widgets/suras_details.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../core/theme/app_colors.dart';
import '../../widgets/search_widget.dart';
import '../../widgets/suras_horizontal.dart';
import '../../widgets/suras_name_item.dart';

class RecentSurasService {
  static const String _key = 'recent_suras';

  static Future<void> saveRecentSura(String suraName) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> recents = prefs.getStringList(_key) ?? [];
    recents.remove(suraName);
    recents.insert(0, suraName);
    if (recents.length > 5) {
      recents = recents.sublist(0, 5);
    }
    await prefs.setStringList(_key, recents);
  }

  static Future<List<String>> getRecentSuras() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(_key) ?? [];
  }
}
class QuranTab extends StatefulWidget {
  const QuranTab({super.key});

  @override
  State<QuranTab> createState() => _QuranTabState();
}
class _QuranTabState extends State<QuranTab> {
  static List<String> SuraNamesArabic = [
    "الفاتحه",
    "البقرة",
    "آل عمران",
    "النساء",
    "المائدة",
    "الأنعام",
    "الأعراف",
    "الأنفال",
    "التوبة",
    "يونس",
    "هود",
    "يوسف",
    "الرعد",
    "إبراهيم",
    "الحجر",
    "النحل",
    "الإسراء",
    "الكهف",
    "مريم",
    "طه",
    "الأنبياء",
    "الحج",
    "المؤمنون",
    "النّور",
    "الفرقان",
    "الشعراء",
    "النّمل",
    "القصص",
    "العنكبوت",
    "الرّوم",
    "لقمان",
    "السجدة",
    "الأحزاب",
    "سبأ",
    "فاطر",
    "يس",
    "الصافات",
    "ص",
    "الزمر",
    "غافر",
    "فصّلت",
    "الشورى",
    "الزخرف",
    "الدّخان",
    "الجاثية",
    "الأحقاف",
    "محمد",
    "الفتح",
    "الحجرات",
    "ق",
    "الذاريات",
    "الطور",
    "النجم",
    "القمر",
    "الرحمن",
    "الواقعة",
    "الحديد",
    "المجادلة",
    "الحشر",
    "الممتحنة",
    "الصف",
    "الجمعة",
    "المنافقون",
    "التغابن",
    "الطلاق",
    "التحريم",
    "الملك",
    "القلم",
    "الحاقة",
    "المعارج",
    "نوح",
    "الجن",
    "المزّمّل",
    "المدّثر",
    "القيامة",
    "الإنسان",
    "المرسلات",
    "النبأ",
    "النازعات",
    "عبس",
    "التكوير",
    "الإنفطار",
    "المطفّفين",
    "الإنشقاق",
    "البروج",
    "الطارق",
    "الأعلى",
    "الغاشية",
    "الفجر",
    "البلد",
    "الشمس",
    "الليل",
    "الضحى",
    "الشرح",
    "التين",
    "العلق",
    "القدر",
    "البينة",
    "الزلزلة",
    "العاديات",
    "القارعة",
    "التكاثر",
    "العصر",
    "الهمزة",
    "الفيل",
    "قريش",
    "الماعون",
    "الكوثر",
    "الكافرون",
    "النصر",
    "المسد",
    "الإخلاص",
    "الفلق",
    "الناس",
  ];

  static List<String> SuraNamesEnglish = [
    "Al-Fatiha",
    "Al-Baqarah",
    "Aal-E-Imran",
    "An-Nisa'",
    "Al-Ma'idah",
    "Al-An'am",
    "Al-A'raf",
    "Al-Anfal",
    "At-Tawbah",
    "Yunus",
    "Hud",
    "Yusuf",
    "Ar-Ra'd",
    "Ibrahim",
    "Al-Hijr",
    "An-Nahl",
    "Al-Isra",
    "Al-Kahf",
    "Maryam",
    "Ta-Ha",
    "Al-Anbiya",
    "Al-Hajj",
    "Al-Mu'minun",
    "An-Nur",
    "Al-Furqan",
    "Ash-Shu'ara",
    "An-Naml",
    "Al-Qasas",
    "Al-Ankabut",
    "Ar-Rum",
    "Luqman",
    "As-Sajda",
    "Al-Ahzab",
    "Saba",
    "Fatir",
    "Ya-Sin",
    "As-Saffat",
    "Sad",
    "Az-Zumar",
    "Ghafir",
    "Fussilat",
    "Ash-Shura",
    "Az-Zukhruf",
    "Ad-Dukhan",
    "Al-Jathiya",
    "Al-Ahqaf",
    "Muhammad",
    "Al-Fath",
    "Al-Hujurat",
    "Qaf",
    "Adh-Dhariyat",
    "At-Tur",
    "An-Najm",
    "Al-Qamar",
    "Ar-Rahman",
    "Al-Waqi'a",
    "Al-Hadid",
    "Al-Mujadila",
    "Al-Hashr",
    "Al-Mumtahina",
    "As-Saff",
    "Al-Jumu'a",
    "Al-Munafiqun",
    "At-Taghabun",
    "At-Talaq",
    "At-Tahrim",
    "Al-Mulk",
    "Al-Qalam",
    "Al-Haqqah",
    "Al-Ma'arij",
    "Nuh",
    "Al-Jinn",
    "Al-Muzzammil",
    "Al-Muddathir",
    "Al-Qiyamah",
    "Al-Insan",
    "Al-Mursalat",
    "An-Naba'",
    "An-Nazi'at",
    "Abasa",
    "At-Takwir",
    "Al-Infitar",
    "Al-Mutaffifin",
    "Al-Inshiqaq",
    "Al-Buruj",
    "At-Tariq",
    "Al-A'la",
    "Al-Ghashiyah",
    "Al-Fajr",
    "Al-Balad",
    "Ash-Shams",
    "Al-Lail",
    "Ad-Duha",
    "Ash-Sharh",
    "At-Tin",
    "Al-Alaq",
    "Al-Qadr",
    "Al-Bayyina",
    "Az-Zalzalah",
    "Al-Adiyat",
    "Al-Qari'a",
    "At-Takathur",
    "Al-Asr",
    "Al-Humazah",
    "Al-Fil",
    "Quraysh",
    "Al-Ma'un",
    "Al-Kawthar",
    "Al-Kafirun",
    "An-Nasr",
    "Al-Masad",
    "Al-Ikhlas",
    "Al-Falaq",
    "An-Nas",
  ];

  static List<String> SearchResult = [];

  static List<String> AyaNumber = [
    '7',
    '286',
    '200',
    '176',
    '120',
    '165',
    '206',
    '75',
    '129',
    '109',
    '123',
    '111',
    '43',
    '52',
    '99',
    '128',
    '111',
    '110',
    '98',
    '135',
    '112',
    '78',
    '118',
    '64',
    '77',
    '227',
    '93',
    '88',
    '69',
    '60',
    '34',
    '30',
    '73',
    '54',
    '45',
    '83',
    '182',
    '88',
    '75',
    '85',
    '54',
    '53',
    '89',
    '59',
    '37',
    '35',
    '38',
    '29',
    '18',
    '45',
    '60',
    '49',
    '62',
    '55',
    '78',
    '96',
    '29',
    '22',
    '24',
    '13',
    '14',
    '11',
    '11',
    '18',
    '12',
    '12',
    '30',
    '52',
    '52',
    '44',
    '28',
    '28',
    '20',
    '56',
    '40',
    '31',
    '50',
    '40',
    '46',
    '42',
    '29',
    '19',
    '36',
    '25',
    '22',
    '17',
    '19',
    '26',
    '30',
    '20',
    '15',
    '21',
    '11',
    '8',
    '5',
    '19',
    '5',
    '8',
    '8',
    '11',
    '11',
    '8',
    '3',
    '9',
    '5',
    '4',
    '6',
    '3',
    '6',
    '3',
    '5',
    '4',
    '5',
    '6',
  ];

  var searchController = TextEditingController();
  bool isSearching = false;
  List<String> mostRecents = [];

  @override
  void initState() {
    super.initState();
    searchController.addListener(onSearch);
    loadRecents();
  }

  void onSearch() {
    String text = searchController.text.trim().toLowerCase();
    if (text.isNotEmpty) {
      isSearching = true;
      SearchResult.clear();
      for (String data in SuraNamesArabic) {
        if (data.toLowerCase().contains(text)) {
          SearchResult.add(data);
        }
      }
    } else {
      isSearching = false;
      SearchResult.clear();
    }
    setState(() {});
  }

  Future<void> loadRecents() async {
    mostRecents = await RecentSurasService.getRecentSuras();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    List<String> displayList = isSearching ? SearchResult : SuraNamesArabic;

    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset("assets/images/onBoardingHeader.png"),
              const SizedBox(height: 20),
              SearchWidget(
                onChanged: (text) => onSearch(),
                searchController: searchController,
              ),
              const SizedBox(height: 20),
              if (!isSearching && mostRecents.isNotEmpty) ...[
                Text(
                  "Most Recently",
                  style: GoogleFonts.elMessiri(
                    color: AppColors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  height: 150,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    separatorBuilder: (context, index) =>
                        const SizedBox(width: 10),
                    itemCount: mostRecents.length,
                    itemBuilder: (context, index) {
                      int originalIndex = SuraNamesArabic.indexOf(
                        mostRecents[index],
                      );
                      return InkWell(
                        onTap: () async {
                          await RecentSurasService.saveRecentSura(
                            SuraNamesArabic[originalIndex],
                          );
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SurasDetails(
                                suraNumber: originalIndex + 1,
                                suraNameArabic: SuraNamesArabic[originalIndex],
                                suraNameEnglish:
                                    SuraNamesEnglish[originalIndex],
                              ),
                            ),
                          ).then((_) => loadRecents());
                        },
                        child: SizedBox(
                          width: 283,
                          child: Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: AppColors.Gold,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: SurasHorizontal(
                              nameArabic: SuraNamesArabic[originalIndex],
                              nameEnglish: SuraNamesEnglish[originalIndex],
                              AyaNumber: AyaNumber[originalIndex],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 20),
              ],
              Text(
                "Suras List",
                style: GoogleFonts.elMessiri(
                  color: AppColors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                separatorBuilder: (context, index) => const Divider(
                  color: AppColors.white,
                  indent: 40,
                  endIndent: 40,
                ),
                itemCount: displayList.length,
                itemBuilder: (context, index) {
                  int originalIndex = SuraNamesArabic.indexOf(
                    displayList[index],
                  );
                  return InkWell(
                    onTap: () async {
                      await RecentSurasService.saveRecentSura(
                        SuraNamesArabic[originalIndex],
                      );
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SurasDetails(
                            suraNumber: originalIndex + 1,
                            suraNameArabic: SuraNamesArabic[originalIndex],
                            suraNameEnglish: SuraNamesEnglish[originalIndex],
                          ),
                        ),
                      ).then((_) => loadRecents());
                    },
                    child: SurasNameItem(
                      index: originalIndex + 1,
                      nameArabic: SuraNamesArabic[originalIndex],
                      nameEnglish: SuraNamesEnglish[originalIndex],
                      AyaNumber: AyaNumber[originalIndex],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

