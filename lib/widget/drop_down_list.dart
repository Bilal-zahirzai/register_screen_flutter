import 'package:flutter/material.dart';

class DropDownList extends StatefulWidget {
  final List<String> items;
  final TextStyle? textStyle;
  final Color? color;
  final Function(String newValue)? onChanged;
  DropDownList({Key? key, required this.items, this.color, this.textStyle,this.onChanged}) : super(key: key);

  @override
  State<DropDownList> createState() => _DropDownListState();
}

class _DropDownListState extends State<DropDownList> {
  late String selectedValue;
  @override
  void initState() {
    super.initState();
    selectedValue = widget.items[0]; // Initialize the variable with a default value
  }

  @override
  Widget build(BuildContext context) {
    //color=shadowColorLight;
    return  Container(
      width: 125,
      padding: const EdgeInsets.only(left: 0,right: 0),
      decoration: BoxDecoration(
        color: widget.color,
        borderRadius: BorderRadius.circular(8), // Add border radius to the container
        //border: Border.all(color: Colors.grey, width: 0.5), // Add border to the container
      ),
      child: DropdownButton<String>(
        icon: Padding(
          padding: const EdgeInsets.only(left: 25.0),
          child: const Icon(Icons.keyboard_arrow_down,color: Colors.grey,),
        ),
        iconSize: 30,
        elevation: 4,
        style: widget.textStyle,
        underline: Container(height: 0,),
        value: selectedValue,
        onChanged: (newValue) {
          setState(() {
            selectedValue = newValue!;
            if (widget.onChanged != null) {
              widget.onChanged!(newValue!);
            }
          });
        },
        dropdownColor: widget.color,
        items: widget.items.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }
}
