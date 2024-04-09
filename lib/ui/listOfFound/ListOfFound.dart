import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:missing_finder1/ui/widgets/FoundListCard.dart';

class ListOfFound extends StatefulWidget {
  static const String routeName = 'list';

  const ListOfFound({super.key});

  @override
  State<ListOfFound> createState() => _ListOfFoundState();
}

class _ListOfFoundState extends State<ListOfFound> {
  TextEditingController searchController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  var selectedArea;
  var selectedYear;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background2.jpg'),
            fit: BoxFit.fill,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 25),
          child: Column(
            children: [
              Row(children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Image(
                    width: 170.w,
                    image: AssetImage('assets/images/logo.png'),
                    // alignment: Alignment.topLeft
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 7),
                    child: TextField(
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: 15),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(28.r),
                            borderSide: BorderSide(color: Colors.transparent),
                          ),
                          hintText: 'search for people',
                          prefixIcon: const Icon(Icons.search, size: 30),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(28.r),
                            borderSide: BorderSide(
                              color: Color(0xFF987B71),
                            ),
                          )),
                      controller: searchController,
                    ),
                  ),
                ),
              ]),
              SizedBox(
                height: 10.h,
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        color: theme.primaryColor,
                        borderRadius: BorderRadius.circular(28.r),
                      ),
                      child: DropdownButton(
                        isExpanded: true,
                        iconEnabledColor: Colors.black,
                        elevation: 0,
                        style: TextStyle(color: Colors.white),
                        underline: Divider(
                          color: Colors.transparent,
                          thickness: 0,
                        ),
                        dropdownColor: theme.colorScheme.onPrimary,
                        hint: const Text('Area'),
                        items: ['Cairo', 'Giza']
                            .map((e) => DropdownMenuItem(
                                  child: Text('$e'),
                                  value: e,
                                ))
                            .toList(),
                        onChanged: (val) {
                          setState(() {
                            selectedArea = val;
                          });
                        },
                        value: selectedArea,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        color: theme.primaryColor,
                        borderRadius: BorderRadius.circular(28.r),
                      ),
                      child: DropdownButton(
                        isExpanded: true,
                        iconEnabledColor: Colors.black,
                        elevation: 0,
                        style: TextStyle(color: Colors.white),
                        underline: Divider(
                          color: Colors.transparent,
                          thickness: 0,
                        ),
                        dropdownColor: theme.colorScheme.onPrimary,
                        hint: const Text('Missing since'),
                        items: ['1999', '2000', '2001', '2002']
                            .map((e) => DropdownMenuItem(
                                  child: Text('$e'),
                                  value: e,
                                ))
                            .toList(),
                        onChanged: (val) {
                          setState(() {
                            selectedYear = val;
                          });
                        },
                        value: selectedYear,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 30.h,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Container(
                      height: 540.h,
                      width: 395.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: theme.primaryColor,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          children: [
                            Text('You Can search with name who you looking',
                                style: theme.textTheme.bodyMedium!
                                    .copyWith(fontWeight: FontWeight.bold)),
                            Center(
                                child: Text(
                                    'for and filter Area and missing time',
                                    style: theme.textTheme.bodyMedium!.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ))),
                            SizedBox(
                              height: 15.h,
                            ),
                            Container(
                              width: 300.w,
                              color: Colors.transparent,
                              height: 400.h,
                              child: PageView(
                                scrollDirection: Axis.horizontal,
                                children: [FoundListCard()],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        // SmoothPageIndicator(
                        //   controller: _scrollController,
                        //     count: 4,
                        //     effect: ExpandingDotsEffect(
                        //       activeDotColor:theme.primaryColor,
                        //       dotHeight: 10,
                        //       dotWidth: 10,
                        //       spacing: 16,
                        //     )),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
