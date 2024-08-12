import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'calendar_dialog.dart';

class DateSelector extends StatefulWidget {
  final String text;
  final ValueChanged<DateTime?> onDateSelected;

  const DateSelector({
    required this.text,
    required this.onDateSelected,
    super.key,
  });

  @override
  DateSelectorState createState() => DateSelectorState();
}

class DateSelectorState extends State<DateSelector> {
  List<DateTime?> _selectedDate = [DateTime.now()];

  void _showDatePicker() {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      pageBuilder: (BuildContext buildContext, Animation<double> animation,
          Animation<double> secondaryAnimation) {
        return CalendarDialog(
          initialDate: _selectedDate[0],
          onDateSelected: (date) {
            setState(() {
              _selectedDate = [date];
              widget.onDateSelected(date);
            });
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.text,
              style: TextStyle(
                color: const Color(0xFFD9D9D9).withOpacity(0.5),
                fontSize: 28,
              ),
            ),
            GestureDetector(
              onTap: _showDatePicker,
              child: const Icon(
                Icons.expand_more,
                color: Colors.white,
                size: 50.0,
              ),
            ),
          ],
        ),
        VxBox()
            .height(2)
            .width(150)
            .white
            .margin(const EdgeInsets.only(top: 5))
            .make(),
      ],
    );
  }
}
