import 'package:flutter/material.dart';
import '../../../../global_widgets/base_scaffold.dart';
import '../../../../core/utils/size_utils.dart';

class TermsConditionView extends StatelessWidget {
  const TermsConditionView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      showHeader: true,
      showBottomNav: true,
      title: "Terms & Conditions",
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
              "By using this platform, you agree to these Terms and Conditions.",
              style: TextStyle(
                color: const Color(0xFF012356),
                fontSize: 14.sp,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 24.h),
            _buildSection(
              "1. Platform Use",
              "This platform provides AI-based soccer guidance for coaches, players, and parents. The advice is for educational purposes only and does not replace professional coaching or medical advice.",
            ),
            _buildSection(
              "2. User Accounts",
              "You must provide accurate information when registering. You are responsible for your account security. We may suspend accounts that violate these terms.",
            ),
            _buildSection(
              "3. AI Guidance",
              "All responses are AI-generated based on client-provided training materials. We do not guarantee results and are not responsible for injuries or outcomes from applying the advice.",
            ),
            _buildSection(
              "4. Digital Products",
              "Purchased digital products are for personal use only. Sharing, copying, or reselling content is strictly prohibited.",
            ),
            _buildSection(
              "5. Payments & Membership",
              "Some features may require payment or subscription. Prices and features may change with notice.",
            ),
            _buildSection(
              "6. Intellectual Property",
              "All platform content, including training materials and AI responses, is protected and may not be reproduced without permission.",
            ),
            _buildSection(
              "7. Limitation of Liability",
              "The platform is provided “as is.” Users are responsible for how they use the information provided.",
            ),
            _buildSection(
              "8. Changes to Terms",
              "We may update these terms at any time. Continued use means you accept the updated terms.",
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
