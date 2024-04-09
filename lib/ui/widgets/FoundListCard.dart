import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FoundListCard extends StatelessWidget {
  FoundListCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return ListView.builder(
      itemCount: 10,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) => Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        width: 300.w,
        height: 400.h,
        decoration: BoxDecoration(
          color: theme.primaryColor,
          borderRadius: BorderRadius.circular(15.r),
          border: Border.all(
            color: theme.colorScheme.secondary,
            width: 1,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15.r),
              child: Image.asset('assets/images/img.png',
                  fit: BoxFit.cover, width: 200, height: 250),
            ),
            SizedBox(
              height: 5.h,
            ),
            Center(child: Text('Ahmed Badway')),
            SizedBox(
              height: 5.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.location_on_outlined,
                ),
                SizedBox(
                  width: 3.w,
                ),
                Text(
                  'Missing from Madina Nasr',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                  ),
                ),
                // Text('Madina Nasr ',style:TextStyle(color: Colors.black,
                //     fontSize: 12,
                //    ),)
              ],
            ),
            SizedBox(
              height: 5.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.person,
                ),
                SizedBox(
                  width: 3.w,
                ),
                Text(
                  'Age at disapperance 21',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 5.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.calendar_month_outlined,
                ),
                SizedBox(
                  width: 3.w,
                ),
                Text(
                  'Missing since 12/2/2015',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
