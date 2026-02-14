import 'package:flutter/material.dart';
import '../../../../global_widgets/base_scaffold.dart';
import '../../../../core/utils/size_utils.dart';

class PrivacyPolicyView extends StatelessWidget {
  const PrivacyPolicyView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      showHeader: true,
      showBottomNav: true,
      title: "Privacy Policy",
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Effective Date: February 15, 2026",
              style: TextStyle(
                color: const Color(0xFF012356),
                fontSize: 14.sp,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w500,
                fontStyle: FontStyle.italic,
              ),
            ),
            SizedBox(height: 16.h),
            Text(
              "We respect your privacy and are committed to protecting your personal information.",
              style: TextStyle(
                color: const Color(0xFF012356),
                fontSize: 14.sp,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 24.h),
            _buildSection(
              "1. Information We Collect",
              "We may collect basic information such as your name, email address, profile details, and usage data when you create an account or use the platform.",
            ),
            _buildSection(
              "2. How We Use Your Information",
              "Your information is used to provide AI coaching services, manage accounts, process payments, improve platform performance, and communicate important updates.",
            ),
            _buildSection(
              "3. AI Data Usage",
              "The AI system operates using approved training datasets. User conversations may be processed to improve service quality but are not sold to third parties.",
            ),
            _buildSection(
              "4. Data Protection",
              "We take reasonable security measures to protect your personal data from unauthorized access or misuse.",
            ),
            _buildSection(
              "5. Third-Party Services",
              "We may use trusted third-party services for payments or hosting. These providers handle data according to their own privacy policies.",
            ),
            _buildSection(
              "6. Your Rights",
              "You may request access, correction, or deletion of your personal data by contacting us.",
            ),
            _buildSection(
              "7. Policy Updates",
              "We may update this Privacy Policy from time to time. Continued use of the platform means you accept the updated policy.",
            ),
            SizedBox(height: 40.h),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(String title, String content) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              color: const Color(0xFF012356),
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
              fontFamily: 'Inter',
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            content,
            style: TextStyle(
              color: const Color(0xFF012356).withValues(alpha: 0.8),
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              fontFamily: 'Inter',
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
