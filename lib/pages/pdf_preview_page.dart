import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pdf/src/widgets/document.dart';
import 'package:printing/printing.dart';
class PdfPreviewPage extends StatefulWidget {
  const PdfPreviewPage({Key? key}) : super(key: key);

  @override
  _PdfPreviewPageState createState() => _PdfPreviewPageState();
}

class _PdfPreviewPageState extends State<PdfPreviewPage> {
  Document? args;
  @override
  void initState() {
    super.initState();
  }
  @override
  void didChangeDependencies() {
    args = ModalRoute.of(context)!.settings.arguments as Document;
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: PdfPreview(
        build: (format) => args!.save(),
      ),
    );
  }
}
