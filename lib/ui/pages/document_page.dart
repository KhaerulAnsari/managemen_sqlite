import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:managemen_sqlite/database/document_database.dart';
import 'package:managemen_sqlite/model/document.dart';
import 'package:managemen_sqlite/theme.dart';
import 'package:managemen_sqlite/ui/pages/add_document_page.dart';
import 'package:managemen_sqlite/ui/pages/detail_document.dart';
import 'package:managemen_sqlite/ui/widgets/document_widget.dart';
import 'package:managemen_sqlite/ui/widgets/null_data.dart';

class DocumentPage extends StatefulWidget {
  const DocumentPage({super.key});

  @override
  State<DocumentPage> createState() => _DocumentPageState();
}

class _DocumentPageState extends State<DocumentPage> {
  late List<Document> documents;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    refreshNotes();
  }

  // @override
  // void dispose() {
  //   DocumentDatabase.instance.close();
  //   super.dispose();
  // }

  Future refreshNotes() async {
    setState(() {
      isLoading = true;
    });

    this.documents = await DocumentDatabase.instance.readAllNotes();

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: blueColor,
          elevation: 0,
          title: Text(
            'On-Site Service System',
            style: whiteTextStyle.copyWith(
              fontSize: 18,
            ),
          ),
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: blueColor,
          child: const Icon(Icons.add),
          onPressed: () {
            Get.to(
              const AddDocumentPage(),
            );
            refreshNotes();
          },
        ),
        body: isLoading
            ? Center(
                child: const CircularProgressIndicator(),
              )
            : documents.isEmpty
                ? RefreshIndicator(
                    onRefresh: () {
                      return Future.delayed(
                        const Duration(seconds: 1),
                        () {
                          setState(
                            () {
                              refreshNotes();
                            },
                          );
                        },
                      );
                    },
                    child: const SingleChildScrollView(
                      physics: AlwaysScrollableScrollPhysics(),
                      child: NullData(
                        title: 'Upss Dokumen Kosong!',
                        subtitle:
                            'Untuk saat ini dokument kosong\nsilahkan menambahkan dokumen.',
                      ),
                    ),
                  )
                : buildDocument(),
      ),
    );
  }

  Widget buildDocument() {
    return RefreshIndicator(
      onRefresh: () {
        return Future.delayed(
          const Duration(seconds: 1),
          () {
            setState(
              () {
                refreshNotes();
              },
            );
          },
        );
      },
      child: ListView.builder(
        padding: const EdgeInsets.only(
          top: 20,
        ),
        physics: const AlwaysScrollableScrollPhysics(),
        itemCount: documents.length,
        itemBuilder: (context, index) {
          final document = documents[index];

          return GestureDetector(
            onTap: () {
              Get.to(
                DetailDocumentPage(
                  document: document,
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.only(
                left: 10,
                right: 10,
                bottom: 10,
              ),
              child: DocumentWidget(
                document: document,
                index: index,
              ),
            ),
          );
        },
      ),
    );
  }
}
