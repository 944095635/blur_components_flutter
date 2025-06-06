效果图：

<img src="https://raw.githubusercontent.com/944095635/blur_components_flutter/master/preview.png" width='600'>

```dart
appBar: AppBar(
        title: const Text("DM's Blur Gallery"),
        flexibleSpace: BlurWidget(child: SizedBox.expand()),
      ),
```

```dart
extendBody: true,
      bottomNavigationBar: BlurWidget(
        child: _buildMenus(themeData),
      ),
```

```dart
/// 模糊组件
class BlurWidget extends StatelessWidget {
  const BlurWidget({
    super.key,
    this.child,
    this.sigmaX = 20,
    this.sigmaY = 20,
    this.radius = BorderRadius.zero,
  });

  final double sigmaX;

  final double sigmaY;

  final Widget? child;

  final BorderRadius radius;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return ClipRRect(
      borderRadius: radius,
      child: BackdropFilter.grouped(
        filter: ImageFilter.blur(sigmaX: sigmaX, sigmaY: sigmaY),
        child: DecoratedBox(
          decoration: BoxDecoration(color: theme.shadowColor),
          child: child,
        ),
      ),
    );
  }
}

```

**注意点**

ListView 的padding 默认包含SafeArea 边距
增加下拉刷新组件时，需要使用SafeArea 内容体的 第一个元素 需要 使用SafeArea。

**关于手动获取底部导航栏高度**

///// 系统级别的安全区域 + 100（底部导航栏，例如100） 等于 主页面的安全区域

> double bottom = MediaQuery.of(Get.context!).padding.bottom + 100;

///// 当前页面的安全区域（子页面）

> double bottom = MediaQuery.of(context).padding.bottom;

[源码地址：https://github.com/944095635/blur\_components\_flutter](https://github.com/944095635/blur_components_flutter)
