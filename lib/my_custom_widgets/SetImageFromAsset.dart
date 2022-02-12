import 'package:flutter/material.dart';
import 'package:hairfixxer_shopkeeper/my_custom_widgets/MyContainer.dart';

class SetImageFromAsset extends StatefulWidget {
  SetImageFromAsset({
    Key? key,
    this.imageAddress = '',
    this.height = 0.0,
    this.width = 0.0,
    this.radiusValue = 0.0,
    this.marginLeft = 0.0,
    this.marginRight = 0.0,
    this.marginTop = 0.0,
    this.marginBottom = 0.0,
    this.fit = BoxFit.none,
    required this.onTap
  }) : super(key: key);
  String imageAddress = '';
  double height;

  double width;

  double radiusValue;
  double marginLeft;

  double marginRight;
  double marginTop;
  double marginBottom;
  Function() onTap;

  BoxFit fit = BoxFit.none;

  @override
  _SetImageFromAssetState createState() => _SetImageFromAssetState();
}

class _SetImageFromAssetState extends State<SetImageFromAsset> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(widget.marginLeft, widget.marginTop,
          widget.marginRight, widget.marginBottom),
      child: Container(
          width: widget.width,
          height: widget.height,
          child: GestureDetector(
            onTap: (){
              widget.onTap();

            },
            child: Image.asset(
              widget.imageAddress,
              fit: widget.fit,
            ),
          )),
    );
  }
}
