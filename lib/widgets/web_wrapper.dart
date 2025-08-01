import 'package:flutter/material.dart';

/// Web平台的包装器，限制宽度并居中显示
class WebWrapper extends StatelessWidget {
  final Widget child;
  final double? width;
  
  const WebWrapper({
    super.key,
    required this.child,
    this.width = 420, // 默认手机宽度，可以根据需要调整
  });
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(240, 240, 240, 1),
      body: Center(
        child: Container(
          width: width,
          height: double.infinity,
          decoration: const BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 10,
                offset: Offset(0, 0),
              ),
            ],
          ),
          child: child,
        ),
      ),
    );
  }
}
