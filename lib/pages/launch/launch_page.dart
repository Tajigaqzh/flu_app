import 'dart:async';

import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';

class LaunchPage extends StatefulWidget {
  const LaunchPage({super.key});

  @override
  State<LaunchPage> createState() => _LaunchPageState();
}
// 加载页面
class _LaunchPageState extends State<LaunchPage> {
  Timer? _timer;
  bool _hasEntered = false;

  @override
  void initState() {
    super.initState();
    _timer = Timer(const Duration(seconds: 3), _enterHome);
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  // 进入首页
  void _enterHome() {
    if (_hasEntered || !mounted) return;
    _hasEntered = true;
    _timer?.cancel();
    context.go('/home');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/images/launch/5.jpg',
            fit: BoxFit.fill,
            alignment: Alignment.center,
          ),
          const DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromRGBO(0, 0, 0, 0.01),
                  Color.fromRGBO(0, 0, 0, 0.25),
                ],
                stops: [0, 1],
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(28, 16, 28, 20),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final compact = constraints.maxHeight < 600;
                  final artworkSize = (constraints.maxHeight * 0.48).clamp(
                    180.0,
                    370.0,
                  );

                  return Column(
                    children: [
                      const Spacer(flex: 2),
                      SizedBox(
                        width: artworkSize,
                        height: artworkSize,
                        child: Stack(
                          clipBehavior: Clip.none,
                          alignment: Alignment.center,
                          children: [
                            Positioned(
                              left: -4,
                              top: -4,
                              right: -4,
                              bottom: -4,
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: const Color.fromRGBO(
                                      255,
                                      255,
                                      255,
                                      0.05,
                                    ),
                                    width: 2,
                                  ),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Color.fromRGBO(
                                        255,
                                        255,
                                        255,
                                        0.05,
                                      ),
                                      blurRadius: 10,
                                      spreadRadius: 1,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Image.asset(
                              'assets/images/launch/1.png',
                              width: artworkSize - 10,
                              height: artworkSize - 10,
                              fit: BoxFit.contain,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: compact ? 24 : 60),
                      Text(
                        'hpMusic',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: compact ? 44 : 54,
                          height: 1,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: compact ? 16 : 30),
                      const Text(
                        '聆听本地，音存于此',
                        style: TextStyle(
                          color: Color.fromRGBO(255, 255, 255, 1),
                          fontSize: 20,
                        ),
                      ),
                      const Spacer(flex: 5),
                      GestureDetector(
                        onTap: _enterHome,
                        behavior: HitTestBehavior.opaque,
                        child: const Padding(
                          padding: EdgeInsets.all(12),
                          child: Text(
                            '进入本地曲库',
                            style: TextStyle(
                              color: Color.fromRGBO(255, 255, 255, 0.72),
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
