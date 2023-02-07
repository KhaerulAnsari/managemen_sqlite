import 'package:flutter/material.dart';
import 'package:managemen_sqlite/theme.dart';

class FormDialog extends StatelessWidget {
  final Widget? contentDialog;
  final String? title;
  final Function? onTapBack;
  const FormDialog({
    Key? key,
    this.title,
    this.contentDialog,
    this.onTapBack,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          10,
        ),
      ),
      elevation: 1,
      child: Container(
        padding: const EdgeInsets.fromLTRB(11, 11, 11, 25),
        width: 600,
        height: 500,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: whiteColor,
        ),
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(
                    height: 18,
                  ),

                  // // image
                  // Center(
                  //   child: Image.asset(
                  //     'images/notes.png',
                  //     width: 115,
                  //     height: 100,
                  //     fit: BoxFit.fill,
                  //   ),
                  // ),

                  const SizedBox(
                    height: 8,
                  ),

                  // Form Nama Barang,
                  contentDialog ?? const SizedBox()
                ],
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Center(
                        child: Text(
                          title.toString(),
                          style: blackTextStyle.copyWith(
                            fontSize: 20,
                            fontWeight: medium,
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                        onTap: () {
                          onTapBack!();
                        },
                        child: const Icon(
                          Icons.cancel,
                          size: 20,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
