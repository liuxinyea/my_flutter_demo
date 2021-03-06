import 'package:flutter/material.dart';

class GradientButton extends StatelessWidget{

  // 渐变色数组
  final List<Color> colors;

  // 按钮宽高
  final double width;
  final double height;

  final Widget child;
  final BorderRadius borderRadius;
  //点击回调
  final GestureTapCallback onPressed;

  GradientButton({
    Key key,
    @required this.child, this.colors, this.width, this.height, this.borderRadius, this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    ThemeData theme = Theme.of(context);

    //确保colors数组不空
    List<Color> _colors = colors ??
        [theme.primaryColor, theme.primaryColorDark ?? theme.primaryColor];
    return DecoratedBox(
        decoration:BoxDecoration(
          gradient: LinearGradient(colors: _colors),
          borderRadius: borderRadius
        ),
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(//水波纹效果组件
          splashColor: _colors.last,
          highlightColor: Colors.transparent,
          borderRadius: borderRadius,
          onTap:onPressed,
          child: ConstrainedBox(
              constraints:BoxConstraints.tightFor(height: height,width: width),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: DefaultTextStyle(
                      style: TextStyle(fontWeight: FontWeight.bold),
                      child: child),
                ),
              ),
          ),
        ),
      ),
    );
  }

}