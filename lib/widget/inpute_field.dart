import 'package:flutter/material.dart';

import '../constant.dart';
class InputField extends StatefulWidget {
  final FocusNode focusNode;
  InputField({
    Key? key,
    this.title,
    required this.hint,
    this.maxLine,
    required this.containerSize,
    this.controller,
    this.widget,
    this.containerWidth,
    this.isTitle, this.marginTop,
    this.onChanged
  }) : focusNode = FocusNode(), super(key: key);
  final String? title;
  final bool? isTitle;
  final String hint;
  final int? maxLine;
  final TextEditingController? controller;
  final Widget? widget;
  final double containerSize;
  final double? containerWidth;
  final double? marginTop;
  final ValueChanged<String>? onChanged;

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  final FocusNode _focusNode = FocusNode();
  // Create a FocusNode instance
  @override
  void initState() {
    super.initState();
    _focusNode.addListener(_onFocusChange); // Add listener to the FocusNode
  }
  @override
  void dispose() {
    _focusNode.removeListener(_onFocusChange); // Remove listener to prevent memory leaks
    _focusNode.dispose(); // Dispose the FocusNode
    super.dispose();
  }
  void _onFocusChange() {
    setState(() {}); // Update the widget state when the focus changes
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      margin:  EdgeInsets.only(top: widget.marginTop??16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          widget.isTitle==null ? Text(
            widget.title!,
            style: subTitleStyle,
          ):Container(),
          Container(
            height: widget.containerSize,
            width: widget.containerWidth,
            margin: const EdgeInsets.only(top: 8),
            padding: const EdgeInsets.only(left: 15),
            decoration: BoxDecoration(
                border: Border.all(
                  color: _focusNode.hasFocus ? Colors.blue : Colors.grey, // Change border color based on focus state
                  width: 1,
                ),borderRadius: BorderRadius.circular(12)
            ),
            child: Row(
              children: [
                Expanded(
                  child:TextFormField(
                    readOnly: widget.widget==null?false:true,
                    maxLines: widget.maxLine,
                    focusNode: _focusNode,
                    onChanged: widget.onChanged,
                    cursorColor: Colors.grey[700],
                    style: subTitleStyle,
                    controller: widget.controller,
                    decoration: InputDecoration(
                      hintText: widget.hint,
                      hintStyle: TextStyle(color: Colors.grey,fontSize: 14),
                      focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.white,
                              width: 0
                          )
                      ),
                      enabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.white,
                              width: 0
                          )
                      ),
                    ),
                  ),
                ),
                if (widget.widget != null) Container(child: widget.widget!)
              ],
            ),
          ),
        ],
      ),

    );
  }
}
