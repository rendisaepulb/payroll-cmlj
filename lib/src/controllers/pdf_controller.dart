import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as web;

import '../models/employee.dart';
import '../utils/utils.dart';

class PdfController {
  static Future<void> generatePdf(EmployeeModel data) async {
    final pdf = pw.Document();

    final img = await rootBundle.load('assets/images/app-logo.png');
    final imageBytes = img.buffer.asUint8List();
    pw.Image appLogo = pw.Image(
      pw.MemoryImage(imageBytes),
      width: 46,
      height: 46,
    );

    pw.Widget rowItem(String label, String? value) {
      return pw.Padding(
        padding: const pw.EdgeInsets.fromLTRB(8, 0, 8, 2),
        child: pw.Row(
          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
          children: [
            pw.Text(label),
            pw.Text(value ?? '-'),
          ],
        ),
      );
    }

    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Container(
            child: pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.center,
              children: [
                pw.Center(child: appLogo),
                pw.SizedBox(height: 8),
                pw.Text(
                  'PT. CITRA MARGA LINTAS JABAR',
                  style: pw.TextStyle(
                    fontSize: 16,
                    fontWeight: pw.FontWeight.bold,
                  ),
                ),
                pw.SizedBox(height: 4),
                pw.Text(
                  'PERUSAHAAN JALAN TOL SOREANG PASIRKOJA',
                ),
                pw.SizedBox(height: 28),
                pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceAround,
                  children: [
                    pw.Row(
                      children: [
                        pw.Column(
                          crossAxisAlignment: pw.CrossAxisAlignment.start,
                          children: [
                            pw.Text('NIK'),
                            pw.Text('Nama Karyawan'),
                          ],
                        ),
                        pw.SizedBox(width: 8),
                        pw.Column(
                          crossAxisAlignment: pw.CrossAxisAlignment.start,
                          children: [
                            pw.Text(': ${data.nik ?? '-'}'),
                            pw.Text(': ${data.name}'),
                          ],
                        ),
                      ],
                    ),
                    pw.Row(
                      children: [
                        pw.Column(
                          crossAxisAlignment: pw.CrossAxisAlignment.start,
                          children: [
                            pw.Text('Jabatan'),
                            pw.Text('Npwp'),
                          ],
                        ),
                        pw.SizedBox(width: 8),
                        pw.Column(
                          crossAxisAlignment: pw.CrossAxisAlignment.start,
                          children: [
                            pw.Text(': ${data.role ?? '-'}'),
                            pw.Text(': ${data.npwp ?? '-'}'),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                pw.SizedBox(height: 16),
                pw.Row(
                  children: [
                    pw.Expanded(
                      child: pw.Container(
                        decoration: pw.BoxDecoration(
                          border: pw.Border.all(),
                        ),
                        padding: const pw.EdgeInsets.symmetric(vertical: 2),
                        child: pw.Center(
                          child: pw.Text(
                            'PENDAPATAN',
                            style: pw.TextStyle(
                              fontWeight: pw.FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    pw.Expanded(
                      child: pw.Container(
                        decoration: pw.BoxDecoration(
                          border: pw.Border.all(),
                        ),
                        padding: const pw.EdgeInsets.symmetric(vertical: 2),
                        child: pw.Center(
                          child: pw.Text(
                            'POTONGAN',
                            style: pw.TextStyle(
                              fontWeight: pw.FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                pw.SizedBox(height: 8),
                pw.Row(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Expanded(
                      child: pw.Column(
                        children: [
                          rowItem(
                            'GAJI POKOK',
                            Utils.getCurrency(data.gajiPokok),
                          ),
                          rowItem(
                            'TUNJANGAN KEAHLIAN',
                            Utils.getCurrency(data.tunKeahlian),
                          ),
                          rowItem(
                            'TUNJANGAN MAKAN',
                            Utils.getCurrency(data.tunMakan),
                          ),
                          rowItem(
                            'TUNJANGAN LAIN-LAIN',
                            Utils.getCurrency(data.tunLain),
                          ),
                          rowItem(
                            'LEMBUR NASIONAL',
                            Utils.getCurrency(data.lemburNasional),
                          ),
                        ],
                      ),
                    ),
                    pw.Expanded(
                      child: pw.Column(
                        children: [
                          rowItem(
                            'BPJS NAKER',
                            Utils.getCurrency(data.bpjsNaker),
                          ),
                          rowItem(
                            'JAMINAN PENSIUN',
                            Utils.getCurrency(data.pensiun),
                          ),
                          rowItem(
                            'BPJS KESEHATAN',
                            Utils.getCurrency(data.bpjsKesehatan),
                          ),
                          rowItem(
                            'KEHADIRAN',
                            Utils.getCurrency(data.kehadiran),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                pw.SizedBox(height: 16),
                pw.Row(
                  children: [
                    pw.Expanded(
                      child: pw.Container(
                        decoration: pw.BoxDecoration(
                          border: pw.Border.all(),
                        ),
                        padding: const pw.EdgeInsets.symmetric(
                          vertical: 2,
                          horizontal: 8,
                        ),
                        child: pw.Row(
                          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                          children: [
                            pw.Center(
                              child: pw.Text(
                                'JUMLAH PENDAPATAN',
                                style: pw.TextStyle(
                                  fontWeight: pw.FontWeight.bold,
                                ),
                              ),
                            ),
                            pw.Padding(
                              padding: const pw.EdgeInsets.only(left: 4),
                              child: pw.Text(
                                Utils.getCurrency(data.totalPendapatan()),
                                style: pw.TextStyle(
                                  fontWeight: pw.FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    pw.Expanded(
                      child: pw.Container(
                        decoration: pw.BoxDecoration(
                          border: pw.Border.all(),
                        ),
                        padding: const pw.EdgeInsets.symmetric(
                          vertical: 2,
                          horizontal: 8,
                        ),
                        child: pw.Row(
                          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                          children: [
                            pw.Center(
                              child: pw.Text(
                                'JUMLAH POTONGAN',
                                style: pw.TextStyle(
                                  fontWeight: pw.FontWeight.bold,
                                ),
                              ),
                            ),
                            pw.Padding(
                              padding: const pw.EdgeInsets.only(left: 4),
                              child: pw.Text(
                                Utils.getCurrency(data.totalPengurangan()),
                                style: pw.TextStyle(
                                  fontWeight: pw.FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                pw.SizedBox(height: 16),
                pw.Padding(
                  padding: const pw.EdgeInsets.symmetric(horizontal: 8),
                  child: pw.Row(
                    children: [
                      pw.Expanded(
                        child: pw.Row(
                          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                          children: [
                            pw.Flexible(child: pw.Text('Gaji Bersih'), flex: 1),
                            pw.Flexible(
                              flex: 2,
                              child: pw.Container(
                                decoration: pw.BoxDecoration(
                                  border: pw.Border.all(),
                                ),
                                padding: const pw.EdgeInsets.symmetric(
                                  vertical: 2,
                                  horizontal: 8,
                                ),
                                child: pw.Text(Utils.getCurrency(
                                  data.gajiBersih(),
                                )),
                              ),
                            ),
                          ],
                        ),
                      ),
                      pw.Spacer(),
                    ],
                  ),
                ),
                pw.SizedBox(height: 16),
                pw.Align(
                  alignment: pw.Alignment.topRight,
                  child: pw.Padding(
                    padding: const pw.EdgeInsets.only(right: 32),
                    child: pw.Column(
                      children: [
                        pw.Text('SDM'),
                        pw.SizedBox(height: 60),
                        pw.Text('John Doe'),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );

    var savedFile = await pdf.save();
    List<int> fileInts = List.from(savedFile);
    web.AnchorElement()
      ..href =
          "data:application/octet-stream;charset=utf-16le;base64,${base64.encode(fileInts)}"
      ..setAttribute("download", "${DateTime.now().millisecondsSinceEpoch}.pdf")
      ..click();
  }
}
