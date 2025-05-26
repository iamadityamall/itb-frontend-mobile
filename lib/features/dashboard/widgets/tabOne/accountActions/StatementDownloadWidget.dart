import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../../../../core/constants/app_colors.dart';

class StatementDownloadWidget extends StatefulWidget {
  const StatementDownloadWidget({super.key});

  @override
  State<StatementDownloadWidget> createState() =>
      _StatementDownloadWidgetState();
}

class _StatementDownloadWidgetState extends State<StatementDownloadWidget> {
  String? selectedFormat = "CSV";
  String? selectedRangeOption;
  DateTimeRange? selectedRange;

  final List<String> predefinedOptions = [
    "Last month",
    "Last 3 months",
    "Last 6 months",
    "Last 1 year"
  ];

  Future<void> _selectDateRangePopup() async {
    final DateTime now = DateTime.now();
    final result = await showDateRangePicker(
      context: context,
      initialDateRange: selectedRange ??
          DateTimeRange(
            start: now.subtract(const Duration(days: 30)),
            end: now,
          ),
      firstDate: DateTime(now.year - 5),
      lastDate: now,
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            dialogBackgroundColor: Colors.white,
          ),
          child: child!,
        );
      },
    );

    if (result != null) {
      setState(() {
        selectedRange = result;
        selectedRangeOption = null; // Unselect other quick ranges
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final selectedDateLabel = selectedRange == null
        ? "Select Date range"
        : "${DateFormat('dd/MM/yyyy').format(selectedRange!.start)} - ${DateFormat('dd/MM/yyyy').format(selectedRange!.end)}";

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          const SizedBox(height: 10),

          // Format selector
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: ["CSV", "Excel"].map((type) {
              return Row(
                children: [
                  Radio<String>(
                    value: type,
                    groupValue: selectedFormat,
                    activeColor: Colors.teal,
                    onChanged: (value) {
                      setState(() => selectedFormat = value);
                    },
                  ),
                  Text(type, style: GoogleFonts.poppins(fontSize: 10)),
                  const SizedBox(width: 10),
                ],
              );
            }).toList(),
          ),

          const SizedBox(height: 20),
          Text("Select from options or date picker",
              style: GoogleFonts.poppins(fontSize: 10)),

          const SizedBox(height: 20),

          // Quick options
          Wrap(
            spacing: 10,
            runSpacing: 10,
            alignment: WrapAlignment.center,
            children: predefinedOptions.map((option) {
              final isSelected = selectedRangeOption == option;
              return GestureDetector(
                onTap: () {
                  setState(() {
                    if (isSelected) {
                      selectedRangeOption = null;
                    } else {
                      selectedRangeOption = option;
                      selectedRange = null;
                    }
                  });
                },
                child: Container(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.teal),
                    color: isSelected ? Colors.teal.withOpacity(0.2) : null,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Text(option,
                      style: GoogleFonts.poppins(fontSize: 10)),
                ),
              );
            }).toList(),
          ),

          const SizedBox(height: 30),
          Text("OR", style: GoogleFonts.poppins(fontSize: 10)),
          const SizedBox(height: 20),

          // Date picker button
          GestureDetector(
            onTap: _selectDateRangePopup,
            child: Container(
              padding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.teal),
                borderRadius: BorderRadius.circular(40),
                color: Colors.white,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.calendar_today,
                      size: 14, color: Colors.teal),
                  const SizedBox(width: 8),
                  Text(
                    selectedDateLabel,
                    style: GoogleFonts.poppins(
                        fontSize: 10, color: Colors.black87),
                  )
                ],
              ),
            ),
          ),

          const SizedBox(height: 30),

          // Download Button Placeholder
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.secondary,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text("Download", style: GoogleFonts.poppins(fontSize: 10, color: AppColors.textWhite)),
            ),
          ),
        ],
      ),
    );
  }
}
