import 'package:flutter/material.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:intl/intl.dart';
import 'date_selector.dart';

class ServiceDateScreen extends StatefulWidget {
  @override
  _ServiceDateScreenState createState() => _ServiceDateScreenState();
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

    return Padding(
      padding: EdgeInsets.all(23.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 100),
          Text(
            '입대일과 전역 예상일을\n알려주세요.',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 30,
            ),
          ),
          const SizedBox(height: 100),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DateSelector(
                text: enlistmentDate != null
                    ? DateFormat('yy.MM.dd').format(enlistmentDate!)
                    : '입대일',
                onDateSelected: (date) => _updateDate('입대일', date),
              ),
              SizedBox(
                width: 20,
              ),
              Text(
                '~',
                style: TextStyle(
                  color: Color(0xFFD9D9D9).withOpacity(0.5),
                  fontSize: 30,
                ),
              ),
              SizedBox(
                width: 20,
              ),
              DateSelector(
                text: dischargeDate != null
                    ? DateFormat('yy.MM.dd').format(dischargeDate!)
                    : '전역일',
                onDateSelected: (date) => _updateDate('전역일', date),
              ),
            ],
          ),
          const SizedBox(height: 345),
          _buildAlarmSwitch(),
        ],
      ),
    );
  }
  Widget _buildAlarmSwitch() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '알림',
          style: TextStyle(
            color: Colors.white,
            fontSize: 28,
          ),
        ),
        SizedBox(width: 230,),
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


