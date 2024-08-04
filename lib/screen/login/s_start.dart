import 'package:flutter/material.dart';
import 'package:military1km/common/common.dart';
import 'package:military1km/common/widget/w_round_button.dart';
import 'package:military1km/screen/login/s_login.dart';
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
    const AssetImage('assets/image/Maskgroup.png'),
    const AssetImage('assets/image/Maskgroup.png'),
    const AssetImage('assets/image/Maskgroup.png'),
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: 400,
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
                            const Color(0xFF000000),
                            const Color(0xFF322B3A).withOpacity(0.0),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              }),
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset('assets/image/logo.png', width: 45, height: 45),
              height10,
              RichText(
                textAlign: TextAlign.start,
                text: const TextSpan(
                  children: [
                    TextSpan(
                      text: 'Team Alpha',
                      style: TextStyle(
                        fontSize: 48,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    TextSpan(
                      text: "에서\n",
                      style: TextStyle(
                        fontSize: 36,
                      ),
                    ),
                    TextSpan(
                      text: "목표",
                      style: TextStyle(
                          fontSize: 36,
                          color: Color(0xffC2FF49),
                          fontWeight: FontWeight.w700),
                    ),
                    TextSpan(
                      text: "를 세우고\n이루어 나가 보세요.",
                      style: TextStyle(
                        fontSize: 36,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          PageViewDotIndicator(
              currentItem: selectedPage,
              count: pageCount,
              unselectedColor: const Color(0xffD9D9D9).withOpacity(0.5),
              selectedColor: Colors.white),
          RoundButton(
            text: '시작하기',
            onTap: () => Nav.push(const LoginScreen()),
            bgColor: const Color(0xFFC2FF49),
            textColor: Colors.black,
            isFullWidth: true,
            borderRadius: 10,
            fontSize: 18,
          ).p(16),
          height50,
        ],
      ),
    );
  }
}
