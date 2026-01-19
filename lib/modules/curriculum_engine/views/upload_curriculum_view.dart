import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../global_widgets/custom_bottom_nav_bar.dart';
import '../../../../routes/app_routes.dart';

class UploadCurriculumView extends StatelessWidget {
  const UploadCurriculumView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              _buildHeader(),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                          vertical: 30,
                          horizontal: 20,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFFEAF2F8),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: const Color(0xFFD0DCEB)),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.description_outlined,
                              size: 32,
                              color: Color(0xFF00204A),
                            ),
                            const SizedBox(height: 12),
                            const Text(
                              "Browse to upload curriculum",
                              style: TextStyle(
                                color: Color(0xFF00204A),
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: CustomBottomNavBar(
              selectedIndex: 0,
              onItemTapped: (index) {
                switch (index) {
                  case 0:
                    Get.offNamed(AppRoutes.technicalDirectorHome);
                    break;
                  case 1:
                    Get.toNamed(AppRoutes.aiCommunication);
                    break;
                  case 2:
                    Get.toNamed(AppRoutes.settings);
                    break;
                }
              },
            ),
          ),
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
                "Upload Curriculum",
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
}
