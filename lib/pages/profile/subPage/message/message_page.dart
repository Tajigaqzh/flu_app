import 'dart:math' as math;

import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/services.dart';
import 'package:material_ui/material_ui.dart';

import '../../../../widgets/navigate_bar.dart';

class MessagePage extends StatefulWidget {
  const MessagePage({super.key});

  @override
  State<MessagePage> createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
        statusBarColor: Colors.white,
      ),

      child: Scaffold(
        backgroundColor: Colors.white,
        body: CustomWidgetWithNavigateBar(
          title: "我的消息",
          trailing: [
            GestureDetector(
              child: const Icon(Icons.search, size: 24),
              onTap: () {},
            ),
            const SizedBox(width: 10),
            const Icon(Icons.cleaning_services_rounded, size: 19),
          ],
          child: EasyRefresh(
            header: const ClassicHeader(
              dragText: '下拉刷新',
              armedText: '下拉刷新',
              readyText: '松开刷新',
              processingText: '刷新中...',
              processedText: '刷新完成',
              noMoreText: '没有更多了',
              failedText: '刷新失败',
              // 关闭「上次更新 %T」那一行。
              showMessage: false,
              backgroundColor: Colors.white,
            ),
            // 下拉刷新
            onRefresh: () async {
              await Future.delayed(const Duration(seconds: 1));
              setState(() {});
            },
            child: ListView(
              children: [
                _MessageActionItem(mainTitle: "新增粉丝", subTitle: "没有新通知"),
                _MessageActionItem(mainTitle: "评论和@提及", subTitle: "没有新通知"),
                _MessageActionItem(mainTitle: "赞和通知", subTitle: "没有新通知"),
                _MessageItem(tipsNum: 5),
                _MessageItem(),
                _MessageItem(tipsNum: 11),
                _MessageItem(),
                _MessageItem(tipsNum: 8),
                _MessageItem(),
                _MessageItem(),
                _MessageItem(),
                _MessageItem(),
                _MessageItem(),
                _MessageItem(),
                _MessageItem(),
                _MessageItem(),
                _MessageItem(),
                _MessageItem(),
                _MessageItem(),
                _MessageItem(),
                _MessageItem(),
                _MessageItem(),
                _MessageItem(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _MessageItem extends StatelessWidget {
  const _MessageItem({this.tipsNum = 0});

  final int tipsNum;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            margin: EdgeInsets.only(right: 10),
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("倩影啊", style: TextStyle(fontWeight: FontWeight.w500)),
                    Text(
                      "11月5日",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey.withAlpha(220),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        "分享专辑《烟霞》，我的最新专辑《烟霞》发布了。快来听听吧",
                        maxLines: 1,
                        style: TextStyle(
                          fontSize: 13,
                          overflow: TextOverflow.ellipsis,
                          color: Colors.grey.withAlpha(220),
                        ),
                      ),
                    ),

                    ?tipsNum > 1
                        ? Container(
                            width: tipsNum > 10 ? 8 : 16,
                            height: tipsNum > 10 ? 8 : 16,
                            margin: EdgeInsets.only(left: 8),
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                            alignment: Alignment.center,

                            child: tipsNum > 10
                                ? null
                                : Text(
                                    tipsNum.toString(),
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                      height: 1,
                                      fontSize: 10,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                          )
                        : null,
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _MessageActionItem extends StatelessWidget {
  const _MessageActionItem({required this.mainTitle, required this.subTitle});

  final String mainTitle;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            margin: EdgeInsets.only(right: 10),
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(mainTitle, style: TextStyle(fontWeight: FontWeight.w500)),
                Text(
                  subTitle,
                  maxLines: 1,
                  style: TextStyle(
                    fontSize: 13,
                    overflow: TextOverflow.ellipsis,
                    color: Colors.grey.withAlpha(220),
                  ),
                ),
              ],
            ),
          ),

          Transform.rotate(
            angle: math.pi,
            child: Icon(
              Icons.arrow_back_ios_rounded,
              size: 18,
              color: Colors.grey.withAlpha(220),
            ),
          ),
          // Icons.arrow_back_ios_rounded,
        ],
      ),
    );
  }
}
