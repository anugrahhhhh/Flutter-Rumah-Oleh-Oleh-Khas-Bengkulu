import 'package:flutter/material.dart';
import 'constants.dart';

// Format currency
String formatCurrency(double amount) {
  return 'Rp ${amount.toStringAsFixed(0)}';
}

// Format date
String formatDate(DateTime date) {
  final months = [
    'Januari',
    'Februari',
    'Maret',
    'April',
    'Mei',
    'Juni',
    'Juli',
    'Agustus',
    'September',
    'Oktober',
    'November',
    'Desember',
  ];

  return '${date.day} ${months[date.month - 1]} ${date.year}';
}

// Show snackbar
void showSnackbar(
  BuildContext context,
  String message, {
  bool isError = false,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
      backgroundColor: isError ? ERROR_COLOR : PRIMARY_COLOR,
      duration: Duration(seconds: 3),
    ),
  );
}

// Show dialog
Future<bool?> showConfirmDialog(
  BuildContext context, {
  required String title,
  required String message,
  String confirmText = 'Ya',
  String cancelText = 'Tidak',
}) async {
  return await showDialog<bool>(
    context: context,
    barrierDismissible: false,
    builder:
        (context) => AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context, false),
              child: Text(cancelText),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pop(context, true),
              child: Text(confirmText),
              style: ElevatedButton.styleFrom(backgroundColor: PRIMARY_COLOR),
            ),
          ],
        ),
  );
}

// Validate email
bool isValidEmail(String email) {
  final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  return emailRegex.hasMatch(email);
}

// Validate phone number
bool isValidPhone(String phone) {
  final phoneRegex = RegExp(r'^\d{10,13}$');
  return phoneRegex.hasMatch(phone);
}

// Get screen size
Size getScreenSize(BuildContext context) {
  return MediaQuery.of(context).size;
}

// Check if device is in landscape mode
bool isLandscape(BuildContext context) {
  return MediaQuery.of(context).orientation == Orientation.landscape;
}

// Calculate discount
double calculateDiscount(double price, double discountPercentage) {
  return price - (price * discountPercentage / 100);
}

// Calculate delivery time estimate
String getDeliveryEstimate() {
  final now = DateTime.now();
  final deliveryTime = now.add(Duration(minutes: 30));

  return '${deliveryTime.hour}:${deliveryTime.minute.toString().padLeft(2, '0')}';
}

// Generate order ID
String generateOrderId() {
  final now = DateTime.now();
  final random = now.millisecondsSinceEpoch % 1000;

  return 'ORD-${now.day}${now.month}${now.year}-$random';
}
