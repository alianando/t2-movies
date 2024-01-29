import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:t2/last_update/last_update_provider.dart';

class LastUpdate extends StatelessWidget {
  const LastUpdate({super.key});

  @override
  Widget build(BuildContext context) {
    final last_update_provider = Provider.of<LastUpdateProvider>(
      context,
      listen: true,
    );
    final String minute = last_update_provider.last_update_dt.minute.toString();
    final String hour = last_update_provider.last_update_dt.hour.toString();
    final String ampm = last_update_provider.last_update_dt.hour < 12 ? 'am' : 'pm';
    return Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: const EdgeInsets.only(right: 8),
        // child: Text(last_update_provider.last_update_dt.toString()),
        child: Text('last update $hour : $minute $ampm'),
      ),
    );
  }
}
