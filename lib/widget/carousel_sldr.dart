import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:djcateringapps/utilities/responsive_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CarouselSldr extends StatelessWidget {
  final ResponsiveLayout responsiveLayout;

  const CarouselSldr({Key key, this.responsiveLayout}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(200.0),
      child: Stack(
        children: <Widget>[
          CarouselSlider(
            items: [1, 2, 3, 4, 5].map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(color: Colors.white),
                      child: Text(
                        'text $i',
                        style: TextStyle(fontSize: 16.0),
                      ));
                },
              );
            }).toList(),
            options: CarouselOptions(
              height: ScreenUtil().setHeight(200.0),
              aspectRatio: 16 / 9,
              viewportFraction: 1.0,
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 2),
                    width: ScreenUtil().setWidth(10),
                    height: ScreenUtil().setHeight(10),
                    decoration: BoxDecoration(
                        color: Colors.redAccent,
                        borderRadius: BorderRadius.all(Radius.circular(100))),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 2),
                    width: ScreenUtil().setWidth(10),
                    height: ScreenUtil().setHeight(10),
                    decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.8),
                        borderRadius: BorderRadius.all(Radius.circular(100))),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 2),
                    width: ScreenUtil().setWidth(10),
                    height: ScreenUtil().setHeight(10),
                    decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.8),
                        borderRadius: BorderRadius.all(Radius.circular(100))),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}