// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:managemen_sqlite/ui/widgets/null_data.dart';

class HomePageWeb extends StatefulWidget {
  const HomePageWeb({super.key});

  @override
  State<HomePageWeb> createState() => _HomePageWebState();
}

class _HomePageWebState extends State<HomePageWeb> {
  bool? inCreate = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: NullData(
        title: 'Coming Soon',
        subtitle: 'Halaman Ini Akan Di Tampilkan Pada Waktu Kedepanya',
      ),
    );
  }
}
