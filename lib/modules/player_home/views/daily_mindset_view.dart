import 'package:flutter/material.dart';
import '../../../global_widgets/base_scaffold.dart';

class DailyMindsetView extends StatelessWidget {
  const DailyMindsetView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      title: "Daily Mindset Tip",
      body: const Center(
        child: Text(
          "Coming Soon", // Placeholder content
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
    );
  }
}
