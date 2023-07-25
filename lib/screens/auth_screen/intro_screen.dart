import 'package:authwithrest/repositories/repositories.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:authwithrest/style/theme.dart' as Style;

class IntroPage extends StatefulWidget {
  final UserRepositories userRepositories;
  const IntroPage({super.key, required this.userRepositories});

  @override
  State<IntroPage> createState() => _IntroPageState(userRepositories);
}

class _IntroPageState extends State<IntroPage> {
  final UserRepositories userRepositories;

  _IntroPageState(this.userRepositories);

  bool clicked = false;

  void afterIntroComplete() {
    setState(() {
      clicked = true;
    });
  }

  final List<PageViewModel> pages = [
    PageViewModel(
        titleWidget: Column(
          children: <Widget>[
            Text(
              'FREE GIFT',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 8,
            ),
            Container(
              height: 3,
              width: 100,
              decoration: BoxDecoration(
                  color: Style.Colors.mainColor,
                  borderRadius: BorderRadius.circular(10)),
            )
          ],
        ),
        body:
            'Free gifts with purchase. Offer free gifts like a gift wrap, gift card, orany free product.',
        image: Center(
          child: SvgPicture.asset('assets/icons/gift.svg'),
        ))
  ];

  @override
  Widget build(BuildContext context) {
    return clicked
        ? Container()
        : IntroductionScreen(
            pages: pages,
            onDone: () {
              afterIntroComplete();
            },
            onSkip: () {
              afterIntroComplete();
            },
            showSkipButton: true,
            skip: Text('Skip',
                style:
                    TextStyle(fontWeight: FontWeight.w600, color: Colors.grey)),
            next: Icon(Icons.navigate_next),
            done: Text('Done', style: TextStyle(fontWeight: FontWeight.w600)),
            dotsDecorator: DotsDecorator(
                size: Size.square(7),
                activeSize: Size(20, 5),
                activeColor: Style.Colors.mainColor,
                color: Colors.black26,
                spacing: EdgeInsets.symmetric(horizontal: 3),
                activeShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5))),
          );
  }
}
