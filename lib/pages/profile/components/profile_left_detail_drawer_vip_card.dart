import 'dart:math' as math;

import 'package:flutter_svg/flutter_svg.dart';
import 'package:material_ui/material_ui.dart';

import '../profile_event.dart';

class ProfileLeftDetailDrawerVipCard extends StatelessWidget {
  const ProfileLeftDetailDrawerVipCard({super.key, required this.onPressed});

  final ProfileDrawerPressed onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [Color(0xff646884), Color(0xff656785)],
        ),
        borderRadius: BorderRadius.all(Radius.circular(6)),
      ),
      width: double.infinity,
      height: 130,
      child: Padding(
        padding: EdgeInsetsGeometry.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "VIP特权已失效30+天",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        "每日成长值-6，续费恢复VIP特权",
                        style: TextStyle(
                          fontSize: 10,
                          color: Color(0xffD8DEF6),
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () =>
                          onPressed(eventKey: ProfileDrawerEventKey.startVip),
                      style: TextButton.styleFrom(
                        backgroundColor: Color(0xffF4D99B),
                        foregroundColor: Color(0xff51432E),
                        minimumSize: Size(64, 28),
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                      child: Text('续费', style: TextStyle(fontSize: 12)),
                    ),
                  ],
                ),
              ],
            ),
            InkWell(
              onTap: () => onPressed(eventKey: ProfileDrawerEventKey.startVip),
              borderRadius: BorderRadius.circular(4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(
                        'assets/images/svg/profile/clock.svg',
                        width: 16,
                        height: 16,
                      ),
                      Text(
                        "每日打卡",
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xffD8DEF6),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "去打卡",
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xffD8DEF6),
                        ),
                      ),
                      Transform.rotate(
                        angle: math.pi,
                        child: Icon(
                          Icons.arrow_back_ios_new,
                          size: 12,
                          color: Color(0xffD8DEF6),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
