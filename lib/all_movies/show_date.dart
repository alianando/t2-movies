import 'package:flutter/material.dart';

class ShowDate extends StatelessWidget {
  final String date;
  const ShowDate(this.date, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      '# ${getDuration()} -------------------------------------------------------------------------------------------------------',
      softWrap: false,
      maxLines: 1,
      style: const TextStyle(overflow: TextOverflow.clip),
    );
  }

  String getDuration(){
    final DateTime todayDt = DateTime.now();
    final DateTime today = DateTime(todayDt.year, todayDt.month, todayDt.day);
    final DateTime movieDt = DateTime.parse(date);
    final int duration = today.difference(movieDt).inDays;
    debugPrint('$movieDt , $duration, $today');
    if(duration == 0){
      return 'Today';
    }
    if(duration == 1){
      return 'Yesterday';
    }
    if(duration == 2){
      return 'Two days ago';
    }
    return '$duration days ago';
  }
}
