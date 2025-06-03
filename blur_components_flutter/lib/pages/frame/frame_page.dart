import 'package:blur_components_flutter/blur_widget.dart';
import 'package:blur_components_flutter/pages/home/home_page.dart';
import 'package:blur_components_flutter/pages/mine/mine_page.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

/// 框架页面
class FramePage extends StatefulWidget {
  const FramePage({super.key});

  @override
  State<FramePage> createState() => _FramePageState();
}

class _FramePageState extends State<FramePage> {
  int pageIndex = 0;

  final List pages = [HomePage(), MinePage()];

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Scaffold(
      body: pages[pageIndex],
      extendBody: true,
      // 底部的高度是 75.h ,完整高度 90.h
      bottomNavigationBar: BlurWidget(
        child: DecoratedBox(
          decoration: BoxDecoration(color: Color(0x440E1327)),
          child: _buildMenus(themeData),
        ),
      ),
    );
  }

  Widget _buildMenus(ThemeData themeData) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 15),
        child: Row(
          children: [
            Expanded(
              child: _buildItem(
                themeData,
                HugeIcons.strokeRoundedHome01,
                "HOME",
                pageIndex == 0,
                onTap: () {
                  setState(() {
                    pageIndex = 0;
                  });
                },
              ),
            ),
            Expanded(
              child: _buildItem(
                themeData,
                HugeIcons.strokeRoundedUser,
                "MINE",
                pageIndex == 1,
                onTap: () {
                  setState(() {
                    pageIndex = 1;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// 构建菜单项
  Widget _buildItem(
    ThemeData themeData,
    IconData icon,
    String text,
    bool isSelected, {
    Function()? onTap,
  }) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Column(
        spacing: 5,
        mainAxisSize: MainAxisSize.min,
        children: [
          HugeIcon(
            icon: icon,
            color: isSelected
                ? themeData.bottomNavigationBarTheme.selectedItemColor!
                : themeData.bottomNavigationBarTheme.unselectedItemColor!,
          ),
          Text(
            text,
            style: TextStyle(
              color: isSelected
                  ? themeData.bottomNavigationBarTheme.selectedItemColor!
                  : themeData.bottomNavigationBarTheme.unselectedItemColor!,
            ),
          ),
        ],
      ),
    );
  }
}
