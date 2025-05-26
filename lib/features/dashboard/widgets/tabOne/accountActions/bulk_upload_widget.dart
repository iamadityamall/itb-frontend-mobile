import 'dart:io';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../core/constants/app_colors.dart';
import 'SearchJobWidget.dart';

class BulkUploadWidget extends StatefulWidget {
  const BulkUploadWidget({super.key});

  @override
  State<BulkUploadWidget> createState() => _BulkUploadWidgetState();
}

class _BulkUploadWidgetState extends State<BulkUploadWidget> {
  bool isUploading = false;
  double uploadProgress = 0.0;
  File? selectedFile;
  String? selectedFileName;
  List<Map<String, dynamic>> uploadedJobs = [];
  bool isLoadingTransactions = true;
  final Dio dio = Dio();

  @override
  void initState() {
    super.initState();
    _fetchTodayTransactions();
  }

  Future<void> _fetchTodayTransactions() async {
    setState(() {
      isLoadingTransactions = true;
    });

    try {
      final response = await dio.get('http://172.16.17.64:9001/iTB/client/1/jobs');
      if (response.statusCode == 200 && response.data is List) {
        setState(() {
          uploadedJobs = List<Map<String, dynamic>>.from(response.data).reversed.toList();
        });
      } else {
        setState(() {
          uploadedJobs = [];
        });
      }
    } catch (e) {
      // Handle fetch error (log or show snackbar)
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to fetch transactions: $e')),
      );
      setState(() {
        uploadedJobs = [];
      });
    } finally {
      setState(() {
        isLoadingTransactions = false;
      });
    }
  }

  Future<void> _refreshJob(int index, int jobId) async {
    try {

      final response = await dio.get('http://172.16.17.64:9001/iTB/status/$jobId');
      if (response.statusCode == 200 && response.data is Map<String, dynamic>) {

        setState(() {
          uploadedJobs[index] = response.data;
        });
      }
    } catch (e) {
      print("e: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to refresh job $jobId: $e')),
      );
    }
  }


  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.any,
      allowMultiple: false,
    );
    if (result != null) {
      setState(() {
        selectedFile = File(result.files.single.path!);
        selectedFileName = result.files.single.name;
      });
    }
  }

  Future<void> _uploadFile() async {
    if (selectedFile == null) return;

    setState(() {
      isUploading = true;
      uploadProgress = 0.0;
    });

    try {
      String fileName = selectedFile!.path.split('/').last;

      // Prepare FormData for multipart upload
      FormData formData = FormData.fromMap({
        "file": await MultipartFile.fromFile(selectedFile!.path, filename: fileName),
      });

      // API call with progress callback
      final response = await dio.post(
        'http://172.16.17.64:9001/iTB/file/clients/1/process',
        data: formData,
        onSendProgress: (sent, total) {
          setState(() {
            uploadProgress = sent / total;
          });
        },
      );

      if (response.statusCode == 200 && response.data is List) {
        setState(() {
          uploadedJobs.insertAll(
            0,
            List<Map<String, dynamic>>.from(response.data).reversed,
          );
        });
      } else {
        // Handle unexpected response
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Upload failed: Unexpected response')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Upload failed: $e')),
      );
    } finally {
      setState(() {
        isUploading = false;
        uploadProgress = 0.0;
        selectedFile = null;
        selectedFileName = null;
      });
    }
  }



  void _navigateToSearchPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SearchJobWidget()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.primary.withOpacity(0.1),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            const SizedBox(height: 50),
            Center(
              child: Text("Please select file for bulk upload",
                  style: GoogleFonts.poppins(
                      fontSize: 10, color: AppColors.textGrey)),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  onPressed: _pickFile,
                  icon: const Icon(Icons.upload_file, color: AppColors.textWhite),
                  label: Text("Select File",
                      style: GoogleFonts.poppins(
                          fontSize: 12, color: AppColors.textWhite)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.secondary,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                ),
                const SizedBox(width: 10),
                Text("or", style: GoogleFonts.poppins(fontSize: 12)),
                const SizedBox(width: 10),
                ElevatedButton.icon(
                  onPressed: _navigateToSearchPage,
                  icon: const Icon(Icons.search, color: AppColors.textWhite),
                  label: Text("Search",
                      style: GoogleFonts.poppins(
                          fontSize: 12, color: AppColors.textWhite)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.secondary,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                ),
              ],
            ),
            if (selectedFileName != null)
              Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: AppColors.primary.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      Expanded(child: Text("Selected file: $selectedFileName",
                          style: GoogleFonts.poppins(fontWeight: FontWeight.bold))),
                      ElevatedButton(
                        onPressed: isUploading ? null : _uploadFile,
                        child: Text("Upload",
                            style: GoogleFonts.poppins(
                                fontSize: 10, color: AppColors.textWhite)),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primary,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            if (isUploading)
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Text("Uploading...",
                        style: GoogleFonts.poppins(fontSize: 10)),
                    const SizedBox(height: 5),
                    LinearProgressIndicator(value: uploadProgress),
                  ],
                ),
              ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: isLoadingTransactions
                  ? const Center(child: CircularProgressIndicator())
                  : uploadedJobs.isEmpty
                  ? const Center(child: Text("No transactions for now"))
                  : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Recent Transactions",
                      style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 250,
                    child: ListView.builder(
                      itemCount: uploadedJobs.length,
                      itemBuilder: (context, index) {
                        final job = uploadedJobs[index];
                        return Card(
                          child: ExpansionTile(
                            initiallyExpanded: index == 0,
                            title: Row(
                              children: [
                                Text("Job ID: ${job['jobId']}",
                                    style: GoogleFonts.poppins(
                                        fontSize: 12)),
                                IconButton(
                                  icon: const Icon(Icons.refresh, size: 16, color: Colors.red),
                                  onPressed: () =>
                                      _refreshJob(index, job['jobId']),
                                )
                              ],
                            ),
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("File Name: ${job['fileName']}",
                                        style: GoogleFonts.poppins(fontSize: 12)),
                                    Text("Status: ${job['status']}",
                                        style: GoogleFonts.poppins(fontSize: 12)),
                                    // Text("Total Records: ${job['totalRecords']}",
                                    //     style: GoogleFonts.poppins(fontSize: 12)),
                                    Text("Processed Records: ${job['processedRecords']}",
                                        style: GoogleFonts.poppins(fontSize: 12)),
                                    Text("Valid Records: ${job['validRecords']}",
                                        style: GoogleFonts.poppins(fontSize: 12)),
                                    Text("Invalid Records: ${job['invalidRecords']}",
                                        style: GoogleFonts.poppins(fontSize: 12)),
                                    Text("Download Link: ${job['downloadLink'] ?? 'N/A'}",
                                        style: GoogleFonts.poppins(fontSize: 12)),
                                    Text("Error Message: ${job['errorMessage'] ?? 'None'}",
                                        style: GoogleFonts.poppins(fontSize: 12)),
                                  ],
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
