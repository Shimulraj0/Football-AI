import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../global_widgets/custom_back_button.dart';
import '../controllers/performance_reports_controller.dart';

class PerformanceReportsView extends GetView<PerformanceReportsController> {
  const PerformanceReportsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEEF5FF),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(),
              const SizedBox(height: 24),
              _buildHeroCard(),
              const SizedBox(height: 16),
              _buildAiSummaryCard(),
              const SizedBox(height: 24),
              _buildSectionTitle('Team Averages'),
              const SizedBox(height: 16),
              _buildTeamAverages(),
              const SizedBox(height: 24),
              _buildSectionTitle('Top Performers'),
              const SizedBox(height: 16),
              _buildTopPerformersList(),
              const SizedBox(height: 24),
              _buildSectionTitle('Individual Player Reports'),
              const SizedBox(height: 16),
              _buildIndividualReportsList(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      children: [
        const CustomBackButton(),
        const Expanded(
          child: Center(
            child: Text(
              'Performance Reports',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Color(0xFF00204A),
              ),
            ),
          ),
        ),
        const SizedBox(width: 48), // Balance for back button
      ],
    );
  }

  Widget _buildHeroCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF00204A),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Performance Reports',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 4),
          const Text(
            'Team and individual progress analytics',
            style: TextStyle(color: Colors.white70, fontSize: 14),
          ),
          const SizedBox(height: 16),
          ElevatedButton.icon(
            onPressed: controller.shareReport,
            icon: const Icon(Icons.ios_share, size: 20),
            label: const Text('Share Report'),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF4EEeb2), // Teal color
              foregroundColor: const Color(0xFF00204A),
              elevation: 0,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAiSummaryCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF4EEeb2).withOpacity(0.9),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: const [
              Icon(Icons.trending_up, color: Colors.white, size: 24),
              SizedBox(width: 8),
              Text(
                'AI Summary',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          const Text(
            '"Midfielders improved 15% in ball control this week.\nDefense coordination needs focus. Overall team\nattendance is excellent at 93%."',
            style: TextStyle(color: Colors.white, fontSize: 14, height: 1.4),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600, // Reduced from w700 to match design better
        color: Color(0xFF00204A),
      ),
    );
  }

  Widget _buildTeamAverages() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: controller.teamAverages.entries.map((entry) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      entry.key,
                      style: TextStyle(color: Colors.grey[600], fontSize: 16),
                    ),
                    Text(
                      controller.teamAveragesDisplay[entry.key] ?? '',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF00204A),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: LinearProgressIndicator(
                    value: entry.value,
                    minHeight: 12,
                    backgroundColor: Colors.grey[200],
                    valueColor: const AlwaysStoppedAnimation<Color>(
                      Color(0xFF00C853),
                    ),
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildTopPerformersList() {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: controller.topPerformers.length,
      separatorBuilder: (_, __) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        final player = controller.topPerformers[index];
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: const Color(0xFFB9F6EA), // Very light teal background
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Container(
                width: 32,
                height: 32,
                decoration: const BoxDecoration(
                  color: Color(0xFF00C853),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    '${player['rank']}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      player['name'],
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF00204A),
                      ),
                    ),
                    Text(
                      player['role'],
                      style: TextStyle(fontSize: 13, color: Colors.grey[700]),
                    ),
                  ],
                ),
              ),
              Text(
                player['score'],
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF00C853), // Green text
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildIndividualReportsList() {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: controller.individualReports.length,
      separatorBuilder: (_, __) => const SizedBox(height: 16),
      itemBuilder: (context, index) {
        final player = controller.individualReports[index];
        final stats = player['stats'] as Map<String, String>;

        return Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.grey.withOpacity(0.1)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${player['name']}  -  ${player['role']}',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF00204A),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: stats.entries.map((entry) {
                  return Column(
                    children: [
                      Text(
                        entry.key,
                        style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        entry.value,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF00204A),
                        ),
                      ),
                    ],
                  );
                }).toList(),
              ),
            ],
          ),
        );
      },
    );
  }
}
