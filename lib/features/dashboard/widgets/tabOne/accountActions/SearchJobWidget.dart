import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import '../../../../../core/constants/app_colors.dart';

class SearchJobWidget extends StatefulWidget {
  const SearchJobWidget({super.key});

  @override
  State<SearchJobWidget> createState() => _SearchJobWidgetState();
}

class _SearchJobWidgetState extends State<SearchJobWidget> {
  final TextEditingController jobIdController = TextEditingController();
  DateTime? startDate;
  DateTime? endDate;
  List<Map<String, dynamic>> searchResults = [];
  bool isLoading = false;
  final Dio dio = Dio();

  final DateFormat formatter = DateFormat('yyyy-MM-dd');

  Future<void> _search() async {
    setState(() {
      isLoading = true;
      searchResults = [];
    });

    try {
      String jobId = jobIdController.text.trim();
      Map<String, dynamic> queryParams = {};  // Use this for future query params

      // Include jobId as a query param (if you plan to support it in the backend)
      if (jobId.isNotEmpty) {
        queryParams['jobId'] = jobId;
      }

      final response = await dio.get(
        'http://172.16.17.64:9001/iTB/client/1/jobs',
        queryParameters: queryParams.isNotEmpty ? queryParams : null,
      );

      if (response.statusCode == 200 && response.data is List) {
        List<Map<String, dynamic>> jobs = List<Map<String, dynamic>>.from(response.data);

        // Optional: Apply local filtering for dates (if needed)
        if (startDate != null && endDate != null) {
          jobs = jobs.where((job) {
            // Assuming there's a 'date' field, otherwise, this should be handled differently
            DateTime jobDate = DateTime.now(); // Placeholder: Replace with job['date']
            return jobDate.isAfter(startDate!.subtract(const Duration(days: 1))) &&
                jobDate.isBefore(endDate!.add(const Duration(days: 1)));
          }).toList();
        }

        setState(() {
          searchResults = jobs.reversed.toList(); // Latest first
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Failed to fetch jobs: Unexpected response')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to fetch jobs: $e')),
      );
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }


  Future<void> _pickStartDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: startDate ?? DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() {
        startDate = picked;
      });
    }
  }

  Future<void> _pickEndDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: endDate ?? DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() {
        endDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search Jobs", style: GoogleFonts.poppins(fontSize: 14)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: jobIdController,
              decoration: const InputDecoration(
                labelText: 'Enter Job ID',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            Divider(color: AppColors.secondary),
            Text("or", style: GoogleFonts.poppins(fontSize: 12)),
            Divider(color: AppColors.secondary),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: Text(
                    startDate != null
                        ? "Start Date: ${formatter.format(startDate!)}"
                        : 'No start date selected',
                    style: GoogleFonts.poppins(fontSize: 10),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.secondary,
                  ),
                  onPressed: _pickStartDate,
                  child: Text(
                    'Start Date',
                    style: GoogleFonts.poppins(
                      fontSize: 10,
                      color: AppColors.textWhite,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: Text(
                    endDate != null
                        ? "End Date: ${formatter.format(endDate!)}"
                        : 'No end date selected',
                    style: GoogleFonts.poppins(fontSize: 10),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.secondary,
                  ),
                  onPressed: _pickEndDate,
                  child: Text(
                    'End Date',
                    style: GoogleFonts.poppins(
                      fontSize: 10,
                      color: AppColors.textWhite,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.secondary,
                  ),
                  onPressed: _search,
                  child: Text(
                    'Search',
                    style: GoogleFonts.poppins(
                      fontSize: 10,
                      color: AppColors.textWhite,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            Expanded(
              child:
                  isLoading
                      ? const Center(child: CircularProgressIndicator())
                      : searchResults.isEmpty
                      ? const Center(child: Text("No results found"))
                      : ListView.builder(
                        itemCount: searchResults.length,
                        itemBuilder: (context, index) {
                          final data = searchResults[index];
                          return Container(
                            margin: const EdgeInsets.symmetric(vertical: 8),
                            child: ExpansionTile(
                              backgroundColor: AppColors.ternary,
                              collapsedBackgroundColor: AppColors.ternary,
                              collapsedShape: RoundedRectangleBorder(
                                side: BorderSide(
                                  color: AppColors.secondary,
                                  width: 1.5,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                  color: AppColors.secondary,
                                  width: 1.5,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              title: Text(
                                "Job ID: ${data['jobId']}",
                                style: GoogleFonts.poppins(fontSize: 12),
                              ),
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(12),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "File Name: ${data['fileName']}",
                                        style: GoogleFonts.poppins(
                                          fontSize: 12,
                                        ),
                                      ),
                                      Text(
                                        "Status: ${data['status']}",
                                        style: GoogleFonts.poppins(
                                          fontSize: 12,
                                        ),
                                      ),
                                      // Text(
                                      //   "Total Records: ${data['totalRecords']}",
                                      //   style: GoogleFonts.poppins(
                                      //     fontSize: 12,
                                      //   ),
                                      // ),
                                      Text(
                                        "Processed Records: ${data['processedRecords']}",
                                        style: GoogleFonts.poppins(
                                          fontSize: 12,
                                        ),
                                      ),
                                      Text(
                                        "Valid Records: ${data['validRecords']}",
                                        style: GoogleFonts.poppins(
                                          fontSize: 12,
                                        ),
                                      ),
                                      Text(
                                        "Invalid Records: ${data['invalidRecords']}",
                                        style: GoogleFonts.poppins(
                                          fontSize: 12,
                                        ),
                                      ),
                                      Text(
                                        "Download Link: ${data['downloadLink'] ?? 'N/A'}",
                                        style: GoogleFonts.poppins(
                                          fontSize: 12,
                                        ),
                                      ),
                                      Text(
                                        "Error Message: ${data['errorMessage'] ?? 'None'}",
                                        style: GoogleFonts.poppins(
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
            ),
          ],
        ),
      ),
    );
  }
}
