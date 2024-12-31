import 'package:flutter/material.dart';
import 'package:retailer/Config/Colors.dart';

class GoalsPage extends StatelessWidget {
  final Color yellowColor = const Color(0xffFFC107);
  final Color grayColor = const Color(0xff757575);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // Daily, Weekly, Monthly
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Goals',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          backgroundColor: yellowColor,
          bottom: TabBar(
            indicatorColor: Colors.black,
            labelColor: Colors.black,
            unselectedLabelColor: grayColor,
            tabs: const [
              Tab(text: "Daily"),
              Tab(text: "Weekly"),
              Tab(text: "Monthly"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildGoalsView(context, "Daily", 50, 100),
            _buildGoalsView(context, "Weekly", 350, 700),
            _buildGoalsView(context, "Monthly", 1500, 3000),
          ],
        ),
      ),
    );
  }

  Widget _buildGoalsView(BuildContext context, String title, double achieved, double target) {
    double progress = achieved / target;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "$title Goals",
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          _buildProgressCard("Achieved", achieved, target, progress),
          const SizedBox(height: 32),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              foregroundColor: AppColors.buttons,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            onPressed: () {
              _showAddGoalDialog(context, title);
            },
            child: const Text(
              "Add Goal",
              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProgressCard(String label, double achieved, double target, double progress) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "$label: UGX ${achieved.toStringAsFixed(0)} / UGX ${target.toStringAsFixed(0)}",
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            LinearProgressIndicator(
              value: progress,
              color: yellowColor,
              backgroundColor: grayColor.withOpacity(0.3),
            ),
            const SizedBox(height: 8),
            Text(
              "${(progress * 100).toStringAsFixed(1)}% Completed",
              style: TextStyle(color: grayColor, fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }

  void _showAddGoalDialog(BuildContext context, String title) {
    final _amountController = TextEditingController();
    final _descriptionController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Add $title Goal"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _amountController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: "Target Amount"),
              ),
              TextField(
                controller: _descriptionController,
                decoration: const InputDecoration(labelText: "Description"),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text("Cancel"),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: AppColors.buttons,
              ),
              onPressed: () {
                // Add logic to save the goal
                Navigator.of(context).pop();
              },
              child: const Text("Add"),
            ),
          ],
        );
      },
    );
  }
}
