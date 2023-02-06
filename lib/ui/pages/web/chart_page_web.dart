import 'package:flutter/material.dart';
import 'package:managemen_sqlite/ui/widgets/null_data.dart';

class ChartPageWeb extends StatelessWidget {
  const ChartPageWeb({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: NullData(
        title: 'Coming Soon',
        subtitle: 'Halaman Ini Akan Di Tampilkan Pada Waktu Kedepanya',
      ),
    );
  }
}
