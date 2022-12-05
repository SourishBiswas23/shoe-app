import 'package:flutter/material.dart';
import 'package:shoe_app/constants.dart';
import 'package:shoe_app/screens/auth/login_page.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Carousel extends StatefulWidget {
  const Carousel({super.key});

  static const routeName = '/carousel';

  static const _imageLocation = [
    'assets/images/first-image.png',
    'assets/images/second-image.png',
    'assets/images/third-image.png',
  ];

  static const _imageTitle = [
    'Start Journey With Nike',
    'Follow Latest Style Shoes',
    'Summer Shoes Nike 2022',
  ];

  static const _imageDescription = [
    'Smart, Gorgeouos & Fashionable Collection',
    'There Are Many Attractive And Beautiful Shoes',
    'Wear These This Mid Summer Afternoon',
  ];

  @override
  State<Carousel> createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  final length = Carousel._imageLocation.length;
  late final pageController;
  int pageIndex = 0;

  @override
  void initState() {
    pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            onPageChanged: (value) {
              setState(() {
                pageIndex = value;
              });
            },
            controller: pageController,
            itemCount: Carousel._imageDescription.length,
            itemBuilder: (context, index) {
              return Container(
                padding: const EdgeInsets.only(left: 10, right: 10),
                color: Constants.scaffoldBackgroundColor,
                height: mediaQuery.height,
                width: double.infinity,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Image.asset(
                        Carousel._imageLocation[index],
                        fit: BoxFit.cover,
                      ),
                      Text(
                        Carousel._imageTitle[index],
                        style: const TextStyle(fontSize: 45),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        Carousel._imageDescription[index],
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
          CarouselRow(
            mediaQuery: mediaQuery,
            pageController: pageController,
            length: length,
            pageIndex: pageIndex,
          ),
        ],
      ),
    );
  }
}

class CarouselRow extends StatelessWidget {
  const CarouselRow({
    Key? key,
    required this.mediaQuery,
    required this.pageController,
    required this.length,
    required this.pageIndex,
  }) : super(key: key);

  final Size mediaQuery;
  final PageController pageController;
  final int length;
  final int pageIndex;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 10,
      left: 10,
      child: SizedBox(
        width: mediaQuery.width - 20,
        height: 40,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: SmoothPageIndicator(
                controller: pageController,
                count: length,
                effect: const ExpandingDotsEffect(
                  dotWidth: 10,
                  dotHeight: 8,
                  activeDotColor: Constants.dotActiveColor,
                  dotColor: Constants.dotInactiveColor,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: TextButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                    Constants.buttonColor,
                  ),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
                onPressed: () {
                  if (pageIndex != length - 1) {
                    pageController.animateToPage(
                      pageIndex + 1,
                      duration: const Duration(milliseconds: 400),
                      curve: Curves.easeInOut,
                    );
                  } else {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        LoginPage.routeName, (route) => false);
                  }
                },
                child: pageIndex != length - 1
                    ? const RowButton(label: 'Next')
                    : const RowButton(label: 'Get Started'),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class RowButton extends StatelessWidget {
  const RowButton({
    Key? key,
    required this.label,
  }) : super(key: key);

  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Text(
        label,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
