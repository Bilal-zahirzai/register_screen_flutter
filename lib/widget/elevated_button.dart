import 'package:flutter/material.dart';
class ElevatedBtn extends StatefulWidget {
  const ElevatedBtn({Key? key, required this.btnName, this.onPressed, required this.width, required this.height,  this.radius}) : super(key: key);
  final String btnName;
  final VoidCallback? onPressed;
  final double width;
  final double height;
  final double? radius;
  @override
  State<ElevatedBtn> createState() => _ElevatedBtnState();
}

class _ElevatedBtnState extends State<ElevatedBtn> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 12.0),
      width:widget.width,
      height: widget.height,
      child: ElevatedButton(
        onPressed: widget.onPressed??(){},
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(widget.radius??20), // Set the desired border radius here
          ),
          backgroundColor: Color(0xFF4A5367),//Theme.of(context).primaryColor,
        ),
        child: Text(widget.btnName),
      ),
    );
  }
}
