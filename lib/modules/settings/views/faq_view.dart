import 'package:flutter/material.dart';
import '../../../../global_widgets/base_scaffold.dart';
import '../../../../core/utils/size_utils.dart';

class FaqView extends StatelessWidget {
  const FaqView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      showHeader: true,
      showBottomNav: true,
      title: "FAQ",
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: Column(
          children: [
            _buildFaqItem(
              "1. What is this platform?",
              "It is an AI-powered soccer coaching platform that provides personalized guidance for coaches, players, and parents.",
            ),
            _buildFaqItem(
              "2. Who can use it?",
              "Coaches, players, and parents can use the platform. Each role receives guidance tailored to their specific needs.",
            ),
            _buildFaqItem(
              "3. How does the AI work?",
              "The platform uses a role-based chatbot trained only on the client’s soccer training materials to provide practical and soccer-specific advice.",
            ),
            _buildFaqItem(
              "4. Is it trained on public data?",
              "No, the AI is trained exclusively on the client’s proprietary training content.",
            ),
            _buildFaqItem(
              "5. What makes it different?",
              "It delivers specialized soccer guidance, structured development advice, and role-based support instead of generic answers.",
            ),
            _buildFaqItem(
              "6. Is there a free version?",
              "Yes, there is a free version with basic Q&A access and a premium version with digital products and personalized AI recommendations.",
            ),
            _buildFaqItem(
              "7. How do digital products work?",
              "Users can purchase training guides, and after purchase, the AI provides detailed assistance based on that specific content.",
            ),
            _buildFaqItem(
              "8. Can parents use it easily?",
              "Yes, the Parent AI provides simple drills and mindset guidance to help support children at home.",
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFaqItem(String question, String answer) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10.r,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Theme(
        data: ThemeData().copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          title: Text(
            question,
            style: TextStyle(
              color: const Color(0xFF012356),
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              fontFamily: 'Inter',
            ),
          ),
          childrenPadding: EdgeInsets.fromLTRB(16.w, 0, 16.w, 16.h),
          iconColor: const Color(0xFF012356),
          collapsedIconColor: const Color(0xFF012356),
          children: [
            Text(
              answer,
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
      ),
    );
  }
}
