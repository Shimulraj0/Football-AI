import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/team_management_controller.dart';
import '../../controllers/home_controller.dart';
import '../../../../global_widgets/custom_back_button.dart';

// Actually CustomBottomNavBar is in global_widgets, need to import that.
import '../../../../global_widgets/custom_bottom_nav_bar.dart';

class TeamManagementView extends GetView<TeamManagementController> {
  const TeamManagementView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEEF5FF),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFF00204A),
        leadingWidth: 50,
        leading: const CustomBackButton(),
        title: const Text(
          "Team Management",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Header Smooth Edge
          Container(
            height: 35,
            decoration: const BoxDecoration(
              color: Color(0xFF00204A),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
          ),
          const SizedBox(height: 20),

          Expanded(
            child: ListView(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
              children: [
                _buildSummaryCard(context),
                const SizedBox(height: 20),
                Obx(
                  () => Column(
                    children: controller.players
                        .asMap()
                        .entries
                        .map(
                          (entry) => _buildPlayerCard(entry.value, entry.key),
                        )
                        .toList(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: () {
        if (Get.isRegistered<HomeController>()) {
          final homeController = Get.find<HomeController>();
          return Obx(
            () => CustomBottomNavBar(
              selectedIndex: homeController.selectedIndex.value,
              onItemTapped: homeController.changeTabIndex,
            ),
          );
        } else {
          return null;
        }
      }(),
    );
  }

  Widget _buildSummaryCard(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: const Color(0xFF00204A),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF00204A).withValues(alpha: 0.3),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Team Management",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 2),
          Obx(
            () => Text(
              "${controller.players.length} active players • Next session: Monday 4 PM",
              style: TextStyle(
                color: const Color.fromARGB(255, 255, 254, 254),
                fontSize: 14,
              ),
            ),
          ),
          const SizedBox(height: 12),
          ElevatedButton.icon(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => const AddPlayerDialog(),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF4CD964),
              foregroundColor: const Color(0xFF00204A),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
              minimumSize: const Size(120, 48),
            ),
            icon: const Icon(Icons.add, size: 26),
            label: const Text(
              "Add Player",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPlayerCard(Map<String, dynamic> player, int index) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.20),
            blurRadius: 10,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header: Name and Actions
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                player['name'],
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF00204A),
                ),
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      showDialog(
                        context: Get.context!,
                        builder: (context) =>
                            AddPlayerDialog(player: player, index: index),
                      );
                    },
                    icon: Image.asset(
                      'assets/icons/edit_icon.png',
                      width: 24,
                      height: 24,
                    ),
                    constraints: const BoxConstraints(),
                    padding: EdgeInsets.zero,
                    splashRadius: 20,
                  ),
                  const SizedBox(width: 12),
                  IconButton(
                    onPressed: () {
                      Get.find<TeamManagementController>().deletePlayer(index);
                      Get.snackbar(
                        "Delete Player",
                        "Deleted ${player['name']}",
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: Colors.red.withValues(alpha: 0.1),
                        colorText: Colors.red,
                        margin: const EdgeInsets.all(10),
                      );
                    },
                    icon: Image.asset(
                      'assets/icons/delete_icon.png',
                      width: 24,
                      height: 24,
                    ),
                    constraints: const BoxConstraints(),
                    padding: EdgeInsets.zero,
                    splashRadius: 20,
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 4),
          // Subtitle
          Text(
            "${player['age']} • ${player['role']} • ${player['team']}",
            style: TextStyle(
              fontSize: 13,
              color: const Color.fromARGB(255, 10, 10, 10),
            ),
          ),
          const SizedBox(height: 16),

          // Specs Row
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              // Attendance
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Attendance",
                      style: TextStyle(fontSize: 12, color: Color(0xFF050505)),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "${player['attendance']} %",
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF22C55E), // Green
                      ),
                    ),
                  ],
                ),
              ),

              // Stats Bars
              Expanded(
                flex: 3,
                child: Column(
                  children: [
                    _buildStatBar(
                      "Passing",
                      player['passing'],
                      const Color(0xFF22C55E),
                    ),
                    const SizedBox(height: 8),
                    _buildStatBar(
                      "Dribbling",
                      player['dribbling'],
                      Colors.blue,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatBar(String label, int value, Color color) {
    return Row(
      children: [
        SizedBox(
          width: 60,
          child: Text(
            label,
            style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
          ),
        ),
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: LinearProgressIndicator(
              value: value / 100,
              backgroundColor: Colors.grey.shade200,
              valueColor: AlwaysStoppedAnimation<Color>(color),
              minHeight: 6,
            ),
          ),
        ),
        const SizedBox(width: 8),
        Text(
          value.toString(),
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: Color(0xFF00204A),
          ),
        ),
      ],
    );
  }
}

class AddPlayerDialog extends StatefulWidget {
  final Map<String, dynamic>? player;
  final int? index;

  const AddPlayerDialog({super.key, this.player, this.index});

  @override
  State<AddPlayerDialog> createState() => _AddPlayerDialogState();
}

class _AddPlayerDialogState extends State<AddPlayerDialog> {
  late TextEditingController _nameController;
  late TextEditingController _ageController;
  String? _selectedPosition;
  String? _selectedTeam;

  final List<String> _positions = ['Forward', 'Midfielder', 'Goalkeeper'];
  final List<String> _teams = ['Team A', 'Team B'];

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.player?['name']);
    // Extract age number if format is "13 years"
    String age = widget.player?['age'] ?? '';
    if (age.contains(' ')) {
      age = age.split(' ')[0];
    }
    _ageController = TextEditingController(text: age);
    _selectedPosition = widget.player?['role'];
    _selectedTeam = widget.player?['team'];
  }

  @override
  void dispose() {
    _nameController.dispose();
    _ageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      backgroundColor: const Color(0xFFE0F7FA), // Light mint color
      insetPadding: const EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.index == null ? "Add New Player" : "Edit Player",
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: _buildTextField(
                    controller: _nameController,
                    hint: "Player Name",
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _buildTextField(
                    controller: _ageController,
                    hint: "Age",
                    isNumber: true,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: _buildDropdown(
                    value: _selectedPosition,
                    hint: "Position",
                    items: _positions,
                    onChanged: (val) => setState(() => _selectedPosition = val),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _buildDropdown(
                    value: _selectedTeam,
                    hint: "Team",
                    items: _teams,
                    onChanged: (val) => setState(() => _selectedTeam = val),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      if (_nameController.text.isNotEmpty &&
                          _ageController.text.isNotEmpty &&
                          _selectedPosition != null &&
                          _selectedTeam != null) {
                        if (widget.index == null) {
                          Get.find<TeamManagementController>().addPlayer(
                            _nameController.text,
                            _ageController.text,
                            _selectedPosition!,
                            _selectedTeam!,
                          );
                          Get.snackbar(
                            "Success",
                            "Player added successfully",
                            snackPosition: SnackPosition.BOTTOM,
                            backgroundColor: Colors.green.withValues(
                              alpha: 0.1,
                            ),
                            colorText: Colors.green,
                            margin: const EdgeInsets.all(10),
                          );
                        } else {
                          Get.find<TeamManagementController>().updatePlayer(
                            widget.index!,
                            _nameController.text,
                            _ageController.text,
                            _selectedPosition!,
                            _selectedTeam!,
                          );
                          Get.snackbar(
                            "Success",
                            "Player updated successfully",
                            snackPosition: SnackPosition.BOTTOM,
                            backgroundColor: Colors.green.withValues(
                              alpha: 0.1,
                            ),
                            colorText: Colors.green,
                            margin: const EdgeInsets.all(10),
                          );
                        }

                        Get.back();
                      } else {
                        Get.snackbar(
                          "Error",
                          "Please fill all fields",
                          snackPosition: SnackPosition.BOTTOM,
                          backgroundColor: Colors.red.withValues(alpha: 0.1),
                          colorText: Colors.red,
                          margin: const EdgeInsets.all(10),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF4CD964),
                      foregroundColor: const Color(0xFF00204A),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                    child: Text(
                      widget.index == null ? "Save Player" : "Update Player",
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => Get.back(),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFAAAAAA),
                      foregroundColor: Colors.black54,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                    child: const Text("Cancel"),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hint,
    bool isNumber = false,
  }) {
    return Container(
      height: 48,
      decoration: BoxDecoration(
        color: const Color(0xFFF0FDF4), // Very light green bg
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.black12),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: TextField(
        controller: controller,
        keyboardType: isNumber ? TextInputType.number : TextInputType.text,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hint,
          hintStyle: TextStyle(color: Colors.grey.shade600, fontSize: 14),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 0,
            vertical: 10,
          ),
        ),
      ),
    );
  }

  Widget _buildDropdown({
    required String? value,
    required String hint,
    required List<String> items,
    required ValueChanged<String?> onChanged,
  }) {
    return Container(
      height: 48,
      decoration: BoxDecoration(
        color: const Color(0xFFF0FDF4),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.black12),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: value,
          hint: Text(
            hint,
            style: TextStyle(color: Colors.grey.shade600, fontSize: 14),
          ),
          icon: const Icon(
            Icons.file_download_outlined,
            size: 20,
            color: Colors.black54,
          ),
          isExpanded: true,
          items: items.map((e) {
            return DropdownMenuItem(
              value: e,
              child: Text(e, style: const TextStyle(fontSize: 14)),
            );
          }).toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }
}
