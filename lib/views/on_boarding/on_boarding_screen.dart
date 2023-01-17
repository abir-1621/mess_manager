import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:mess_manager/services/shared_preferences.dart';
import 'package:mess_manager/utils/image_links.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../models/model_on_boarding.dart';

class OnBoardingScreen extends StatefulWidget {
   OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  int currentpage=0;
  final controller=LiquidController();

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final pages = [
      OnBoardingPage(
        model: OnBoardingModel(
            svgImage: create_mess,
            title: 'Create mess',
            subtitle: 'Create your mess or join a mess by code.',
            counterText: '1/3',
            height: screenSize.height,
            bgColor: Colors.white),
      ),
      OnBoardingPage(
        model: OnBoardingModel(
            svgImage: add_member,
            title: 'Add member',
            subtitle: 'Create your mess or join a mess by code.',
            counterText: '2/3',
            height: screenSize.height,
            bgColor: Colors.blue),
      ),
      OnBoardingPage(
        model: OnBoardingModel(
            svgImage: plan_meal,
            title: 'Plan mess meals.',
            subtitle: 'Create your mess or join a mess by code.',
            counterText: '3/3',
            height: screenSize.height,
            bgColor: Colors.green),
      ),
    ];


    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          LiquidSwipe(
            liquidController: controller,
            enableLoop: false,
            onPageChangeCallback: onPageChangedCallBack,
            pages: pages,
          ),
          Positioned(
            bottom: 60.0,
            child: OutlinedButton(
              onPressed: () {
                int nextPage=controller.currentPage+1;
                controller.animateToPage(page: nextPage);
                if(nextPage==3){
                  SharedPrefs.setIsOnBoardVisited(true);

                }
              },
              style: ElevatedButton.styleFrom(
                  side: const BorderSide(color: Colors.brown),
                  shape: const CircleBorder(),
                  padding: const EdgeInsets.all(20),
                  foregroundColor: Colors.white),
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration
                  (
                    color: Colors.blue,
                    shape: BoxShape.circle),
                child: Icon(Icons.arrow_forward_ios),
              ),
            ),
          ),
          Positioned(
            top: 50,
              right: 50,
              child: TextButton(
                onPressed:(){
                  controller.jumpToPage(page:2);
                  SharedPrefs.setIsOnBoardVisited(true);
                },
                child: const Text("Skip", style: TextStyle(color: Colors.grey),),
              )),
          Positioned(
              bottom: 10,
              child: AnimatedSmoothIndicator(
            activeIndex: controller.currentPage,
            count: 3,
                effect: const WormEffect(
                  activeDotColor: Color(0xff272727),
                  dotHeight: 5.0
                ),
          ))
        ],
      ),
    );
  }

   onPageChangedCallBack(int activePageIndex) {
    setState((){
      currentpage = activePageIndex;
    });
  }
}

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({
    Key? key,
    required this.model,
  }) : super(key: key);

  final OnBoardingModel model;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: model.bgColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        children: [
          SvgPicture.asset(
            model.svgImage,
            height: model.height * .5,
          ),
          Column(children: [
            Text(
              model.title,
              style: Theme.of(context).textTheme.headline3,
            ),
            Text(
              model.subtitle,
              style: Theme.of(context).textTheme.headline6,
              textAlign: TextAlign.center,
            ),
          ]),
          Text(model.counterText, style: Theme.of(context).textTheme.headline6),
          SizedBox(height: 80.0.h)
        ],
      ),
    );
  }
}
