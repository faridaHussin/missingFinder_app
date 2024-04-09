import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../widgets/DataItemWidget.dart';

class ResultDetails extends StatelessWidget {
  static const String routeName = 'result_details';

  ResultDetails({super.key});

  List<String> sliderImages = [
    'assets/images/image5.jpg',
    'assets/images/img_1.png',
    'assets/images/img_2.png'
  ];

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.jpg'),
            fit: BoxFit.fill,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Column(
              children: [
                ImageSlideshow(
                    initialPage: 0,
                    indicatorColor: Colors.grey,
                    indicatorBackgroundColor: Colors.white,
                    indicatorBottomPadding: 20.h,
                    autoPlayInterval: 3000,
                    isLoop: true,
                    children: sliderImages
                        .map((url) =>
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15.r),
                            child: Image.asset(url,
                                fit: BoxFit.fill,
                                width: 180.w,
                                height: 600.h),
                          ),
                        ))
                        .toList()),
                SizedBox(
                  height: 15.h,
                ),
                Expanded(
                  child: ListView(
                    children: [
                      Column(
                        children: [
                          DataItemWidget(
                            title: 'Missing Name',
                            text: 'Ahmed Badway',
                          ),
                          DataItemWidget(
                            title: 'Missing Gender',
                            text: 'Male',
                          ),
                          DataItemWidget(
                            title: 'Missing Status',
                            text: 'healthy',
                          ),
                          DataItemWidget(
                            title: 'Missing Age',
                            text: '80',
                          ),
                          DataItemWidget(
                            title: 'Date of Loss',
                            text: '2010-10-10',
                          ),
                          DataItemWidget(
                            title: 'Status of missing',
                            text: 'Lost',
                          ),
                          DataItemWidget(
                            title: 'Governorate',
                            text: 'Cairo',
                          ),
                          DataItemWidget(
                            title: 'City',
                            text: 'Nasr City',
                          ),
                          DataItemWidget(
                            title: 'Absence Report',
                            text: 'Yes',
                          ),
                          DataItemWidget(
                            title: 'The Description',
                            text:
                            'He was lost in Salah Salem, next to \ncairo Stadium, a midst the crowd of fans ',
                          ),
                          DataItemWidget(
                            title: 'birthMark',
                            text: 'He has a birthmark on his right hand and\n a mark on his face next to his nostril',
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Row(
                              children: [
                                Icon(Icons.arrow_forward_ios_rounded,
                                    color: Colors.white, size: 15),
                                Text(' Reporter',
                                    style: theme.textTheme.titleMedium!
                                        .copyWith(fontWeight: FontWeight.bold,
                                        color: Colors.white)),
                              ],
                            ),
                          ),
                          DataItemWidget(
                            title: 'Reporter Name',
                            text: 'Ahmed',
                          ),
                          DataItemWidget(
                            title: 'Reporter Number',
                            text: '01016152539',
                          ),
                          DataItemWidget(
                            title: 'Reporter Relation',
                            text: 'third degree relative',
                          ),
                        ],
                      ),
                    ],

                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
