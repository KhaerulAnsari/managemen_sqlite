import 'package:flutter/material.dart';
import 'package:managemen_sqlite/theme.dart';
import 'package:managemen_sqlite/ui/widgets/null_data.dart';

class NotesPage extends StatelessWidget {
  const NotesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: defaultMargin,
        ),
        child: const NullData(
          imageUrl: 'images/coming_soon.png',
          title: 'Coming Soon',
          subtitle:
              'Halaman ini belum ada,\nKembali lagi nanti untuk mengakses halaman ini',
        ),
      ),
    );
  }
}
