import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../global_widgets/base_scaffold.dart';

class CommunicationSummaryView extends StatelessWidget {
  const CommunicationSummaryView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      headerContent: _buildHeader(),
      body: ListView(
        padding: const EdgeInsets.all(20.0),
        children: [
          _buildStatRow(),
          const SizedBox(height: 24),
          _buildFeedbackList(),
          const SizedBox(height: 80),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.only(
        top: 60.0,
        left: 20.0,
        right: 20.0,
        bottom: 30.0,
      ),
      decoration: const BoxDecoration(
        color: Color(0xFF00204A),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: Row(
        children: [
          InkWell(
            onTap: () => Get.back(),
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.arrow_back,
                color: Color(0xFF00204A),
                size: 24,
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: Text(
                "Communication Summary", // Typo in design 'Summery', corrected to 'Summary'
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(width: 40),
        ],
      ),
    );
  }

  Widget _buildStatRow() {
    return Column(
      children: [
        _buildStatTile("Total Feedback", "32"),
        const SizedBox(height: 12),
        _buildStatTile("Unresolved", "5"),
        const SizedBox(height: 12),
        _buildStatTile("Negative Feedback", "4"),
      ],
    );
  }

  Widget _buildStatTile(String label, String value) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: BoxDecoration(
        color: const Color(0xFFE0E7F1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(
              color: Color(0xFF00204A),
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              color: Color(0xFF00204A),
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFeedbackList() {
    return Column(
      children: [
        _buildFeedbackItem(
          name: "Jason Myers",
          role: "Assistant Coach",
          time: "2h ago",
          message: "The U10 boys struggled with defensive structure today...",
          avatarColor: Colors.blueAccent,
        ),
        const Divider(height: 32),
        _buildFeedbackItem(
          name: "Mary Walker",
          role: "Parent",
          time: "5h ago",
          message: "My Child has been unhappy with playing time.",
          avatarColor: Colors.orangeAccent,
          isNegative:
              true, // Context implies potential negative, though UI design doesn't visually distinguish heavily besides text
        ),
        const Divider(height: 32),
        _buildFeedbackItem(
          name: "Jake Hudson",
          role: "Player",
          time: "1d ago",
          message: "I've been improving goal-scoring lately.",
          avatarColor: Colors.greenAccent,
        ),
      ],
    );
  }

  Widget _buildFeedbackItem({
    required String name,
    required String role,
    required String time,
    required String message,
    required Color avatarColor,
    bool isNegative = false,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 20,
          backgroundColor: avatarColor,
          // In real app, use NetworkImage or AssetImage
          child: Text(name[0], style: const TextStyle(color: Colors.white)),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: const TextStyle(
                          color: Color(0xFF00204A),
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        role,
                        style: TextStyle(color: Colors.grey[600], fontSize: 12),
                      ),
                    ],
                  ),
                  Text(
                    time,
                    style: TextStyle(color: Colors.grey[500], fontSize: 12),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                message,
                style: const TextStyle(color: Color(0xFF00204A), fontSize: 14),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
