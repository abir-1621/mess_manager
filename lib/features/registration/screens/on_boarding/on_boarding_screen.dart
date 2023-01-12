import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:mess_manager/features/registration/models/model_on_boarding.dart';
import 'package:mess_manager/utils/image_links.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          LiquidSwipe(
            enableLoop: false,
            pages: [
              OnBoardingPage(model: OnBoardingModel(
                svgImage: create_mess,
                title: 'Create mess',
                subtitle: 'Create your mess or join a mess by code.',
                counterText: '1/3',
                height: screenSize.height,
                bgColor: Colors.white
              ),),
              OnBoardingPage(model: OnBoardingModel(
                  svgImage: add_member,
                  title: 'Add member',
                  subtitle: 'Create your mess or join a mess by code.',
                  counterText: '2/3',
                  height: screenSize.height,
                  bgColor: Colors.blue
              ),),
              OnBoardingPage(model: OnBoardingModel(
                  svgImage: plan_meal,
                  title: 'Plan mess meals.',
                  subtitle: 'Create your mess or join a mess by code.',
                  counterText: '3/3',
                  height: screenSize.height,
                  bgColor: Colors.green
              ),),
            ],
          )
        ],
      ),
    );
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
            height: model.height*.5,
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
          Text(model.counterText,
          style: Theme.of(context).textTheme.headline6),
          SizedBox(height: 50.0.h)
        ],
      ),
    );
  }
}
