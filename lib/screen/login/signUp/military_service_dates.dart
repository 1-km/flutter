import 'package:flutter/material.dart';
import 'package:military1km/common/common.dart';
import 'date_selector.dart';

class ServiceDateScreen extends StatefulWidget {
  const ServiceDateScreen({super.key});

  @override
  State<ServiceDateScreen> createState() => _ServiceDateScreenState();
}

class _ServiceDateScreenState extends State<ServiceDateScreen> {
  DateTime? enlistmentDate;
  DateTime? dischargeDate;
  bool isAlarmOn = false;

  void _updateDate(String type, DateTime? date) {
    setState(() {
      if (type == '입대일') {
        enlistmentDate = date;
      } else {
        dischargeDate = date;
      }
    });
  }

  void _toggleAlarm(bool value) {
    setState(() {
      isAlarmOn = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Height(100),
        '입대일과 전역 예상일을\n알려주세요.'.text.size(30).make(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DateSelector(
              text: enlistmentDate != null
                  ? DateFormat('yy.MM.dd').format(enlistmentDate!)
                  : '입대일',
              onDateSelected: (date) => _updateDate('입대일', date),
            ),
            width20,
            '~'
                .text
                .color(const Color(0xFFD9D9D9))
                .size(30)
                .make()
                .opacity(value: 0.5),
            width20,
            DateSelector(
              text: dischargeDate != null
                  ? DateFormat('yy.MM.dd').format(dischargeDate!)
                  : '전역일',
              onDateSelected: (date) => _updateDate('전역일', date),
            ),
          ],
        ),
        const SizedBox(height: 355),
        _buildAlarmSwitch(),
      ],
    ).p(23);
  }

  Widget _buildAlarmSwitch() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        '알림'.text.size(28).make(),
        Transform.scale(
          scale: 1.2, // Switch 크기를 1.5배 키움
          child: Switch(
            value: isAlarmOn,
            onChanged: _toggleAlarm,
            activeColor: Colors.green,
            inactiveThumbColor: Colors.grey,
            inactiveTrackColor: Colors.grey.withOpacity(0.5),
          ),
        ),
      ],
    );
  }
}
