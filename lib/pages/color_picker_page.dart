import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ColorPickerPage extends StatefulWidget {
  const ColorPickerPage({Key? key}) : super(key: key);

  @override
  _ColorPickerPageState createState() => _ColorPickerPageState();
}

class _ColorPickerPageState extends State<ColorPickerPage> {
  Color pickerColor = Color(0xff443a49);
  Color currentColor = Color(0xff443a49);
  @override
  Widget build(BuildContext context) {
    return Container();
    // return AlertDialog(
    //   title: const Text('Pick a color!'),
    //   content: SingleChildScrollView(
    //     child: ColorPicker(
    //       pickerColor: pickerColor,
    //       onColorChanged: (Color? color){
    //         print(color);
    //
    //       },
    //       showLabel: true,
    //       pickerAreaHeightPercent: 0.8,
    //     ),
    //     // Use Material color picker:
    //     //
    //     // child: MaterialPicker(
    //     //   pickerColor: pickerColor,
    //     //   onColorChanged: changeColor,
    //     //   showLabel: true, // only on portrait mode
    //     // ),
    //     //
    //     // Use Block color picker:
    //     //
    //     // child: BlockPicker(
    //     //   pickerColor: currentColor,
    //     //   onColorChanged: changeColor,
    //     // ),
    //     //
    //     // child: MultipleChoiceBlockPicker(
    //     //   pickerColors: currentColors,
    //     //   onColorsChanged: changeColors,
    //     // ),
    //   ),
    //   actions: <Widget>[
    //     TextButton(
    //       child: const Text('Got it'),
    //       onPressed: () {
    //         setState(() => currentColor = pickerColor);
    //         Navigator.pop(context,0.0);
    //       },
    //     ),
    //   ],
    // );
  }
}
