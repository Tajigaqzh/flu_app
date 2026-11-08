import 'dart:async';

import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import 'package:flu_app/widgets/navigate_bar.dart';

class ScanPage extends StatefulWidget {
  const ScanPage({super.key});

  @override
  State<ScanPage> createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  final MobileScannerController _controller = MobileScannerController();
  String? _result;

  @override
  void dispose() {
    unawaited(_controller.dispose());
    super.dispose();
  }

  void _onDetect(BarcodeCapture capture) {
    if (_result != null) return;
    for (final barcode in capture.barcodes) {
      final value = barcode.rawValue;
      if (value == null || value.isEmpty) continue;
      setState(() => _result = value);
      unawaited(_controller.stop());
      return;
    }
  }

  Future<void> _scanAgain() async {
    setState(() => _result = null);
    await _controller.start();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomWidgetWithNavigateBar(
        title: '扫一扫',
        isDark: false,
        backgroundColor: Colors.black,
        height: 48,
        overlayChild: true,
        onBack: () => context.pop(),
        trailing: [
          ValueListenableBuilder<MobileScannerState>(
            valueListenable: _controller,
            builder: (context, state, child) => IconButton(
              onPressed: state.torchState == TorchState.unavailable
                  ? null
                  : _controller.toggleTorch,
              tooltip: state.torchState == TorchState.on ? '关闭闪光灯' : '打开闪光灯',
              color: Colors.white,
              icon: Icon(
                state.torchState == TorchState.on
                    ? Icons.flash_on
                    : Icons.flash_off,
              ),
            ),
          ),
        ],
        child: Stack(
          fit: StackFit.expand,
          children: [
            MobileScanner(
              controller: _controller,
              onDetect: _onDetect,
              errorBuilder: (context, error) {
                final message = switch (error.errorCode) {
                  MobileScannerErrorCode.permissionDenied => '请在系统设置中允许使用摄像头',
                  MobileScannerErrorCode.unsupported => '当前设备不支持相机扫码',
                  _ => '摄像头无法启动',
                };
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Text(
                      message,
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                );
              },
            ),
            if (_result == null)
              Center(
                child: IgnorePointer(
                  child: Container(
                    width: 240,
                    height: 240,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white, width: 2),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
            if (_result == null)
              Positioned(
                left: 0,
                right: 0,
                bottom: MediaQuery.paddingOf(context).bottom + 24,
                child: Column(
                  children: [
                    const Text(
                      '将二维码或条形码放入框内',
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                    const SizedBox(height: 16),
                    IconButton(
                      onPressed: _controller.switchCamera,
                      tooltip: '切换摄像头',
                      color: Colors.white,
                      icon: const Icon(Icons.cameraswitch),
                    ),
                  ],
                ),
              )
            else
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(
                    16,
                    16,
                    16,
                    MediaQuery.paddingOf(context).bottom + 16,
                  ),
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('扫描结果'),
                        const SizedBox(height: 8),
                        SelectableText(_result!),
                        const SizedBox(height: 12),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                              onPressed: _scanAgain,
                              child: const Text('继续扫描'),
                            ),
                            TextButton(
                              onPressed: () => Clipboard.setData(
                                ClipboardData(text: _result!),
                              ),
                              child: const Text('复制'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
