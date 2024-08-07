import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:military1km/common/common.dart';
import 'date_selector.dart';
import 's_sign_up.dart';

class ServiceDateScreen extends ConsumerStatefulWidget {
  const ServiceDateScreen({super.key});

  @override
  ConsumerState<ServiceDateScreen> createState() => _ServiceDateScreenState();
}

class _ServiceDateScreenState extends ConsumerState<ServiceDateScreen> {
  DateTime? enlistmentDate;
  DateTime? dischargeDate;
  bool isAlarmOn = false;

  void _onEnlistmentDateSelected(DateTime? date) {
    setState(() {
      enlistmentDate = date;
      if(enlistmentDate != null) {
        dischargeDate = _calculateDischargeDate(enlistmentDate!);
        ref.read(enlistmentDateProvider.notifier).state = enlistmentDate!;
        ref.read(dischargeDateProvider.notifier).state = dischargeDate!;
      }
    });
  }

  void _onDischargeDateSelected(DateTime? date) {
    setState(() {
      dischargeDate = date;
    });
  }


  DateTime _calculateDischargeDate(DateTime enlistmentDate) {
    final selectedMilitary = ref.read(selectedMilitaryProvider);
    int serviceDays = 548;
    switch(selectedMilitary) {
      case '육군' :
        serviceDays = 548;
        break;
      case '해군' :
        serviceDays = 607;
        break;
      case '공군' :
        serviceDays = 637;
        break;
    }
    return enlistmentDate.add(Duration(days: serviceDays));
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
                  :'입대일',
              onDateSelected: _onEnlistmentDateSelected,
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
              onDateSelected: _onDischargeDateSelected,
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
