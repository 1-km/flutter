import 'package:flutter/material.dart';
import 'package:page_view_dot_indicator/page_view_dot_indicator.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  late int selectedPage;
  late final PageController _pageController;

  final List<AssetImage> images = [
    AssetImage('assets/image/Maskgroup.png'),
    AssetImage('assets/image/Maskgroup.png'),
    AssetImage('assets/image/Maskgroup.png'),
  ];

  @override
  void initState() {
    selectedPage = 0;
    _pageController = PageController(initialPage: selectedPage);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const pageCount = 3;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: 500,
            child: PageView(
              controller: _pageController,
              onPageChanged: (value) {
                setState(() {
                  selectedPage = value;
                });
              },
              children: List.generate(pageCount, (index) {
                return Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: images[index],
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                            Color(0xFF000000),
                            Color(0xFF322B3A).withOpacity(0.0),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              }),
            ),
          ),
          Expanded(
            flex: 2,
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 20.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 45,
                          height: 45,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/image/logo.png'),
                            ),
                          ),
                        ),
                        SizedBox(height: 10,),
                        RichText(
                          textAlign: TextAlign.start,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'Team Alpha',
                                style: TextStyle(
                                  fontSize: 48,
                                  fontWeight: FontWeight.w900,
                                  color: Colors.white,
                                ),
                              ),
                              TextSpan(
                                text: "에서\n",
                                style: TextStyle(
                                  fontSize: 36,
                                  color: Colors.white,
                                ),
                              ),
                              TextSpan(
                                text: "목표",
                                style: TextStyle(
                                  fontSize: 36,
                                  color: Color(0xffC2FF49),
                                  fontWeight: FontWeight.w700
                                ),
                              ),
                              TextSpan(
                                text: "를 세우고\n이루어 나가 보세요.",
                                style: TextStyle(
                                  fontSize: 36,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
           PageViewDotIndicator(
              currentItem: selectedPage,
              count: pageCount,
              unselectedColor: const Color(0xffD9D9D9).withOpacity(0.5),
              selectedColor: Colors.white
           ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFC2FF49),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  fixedSize: Size(400, 50)
              ),
              child: Text(
                  '시작하기',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.black
                  )
              ),
            ),
          ),
          SizedBox(height: 50,),
        ],
      ),
    );
  }
}