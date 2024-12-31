import 'package:flutter/material.dart';
import 'package:retailer/Config/Colors.dart';

class TodoListPage extends StatefulWidget {
  @override
  _TodoListPageState createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  final Color yellowColor = const Color(0xffFFC107);
  final Color grayColor = const Color(0xff757575);

  List<Map<String, dynamic>> tasks = [
    {"time": "8:00 AM", "title": "Breakfast with Tim", "completed": true},
    {"time": "11:30 AM", "title": "Interview at NBC", "completed": true},
    {"time": "14:00 PM", "title": "Team meeting", "completed": false},
    {"time": "15:20 PM", "title": "UI design challenge", "completed": false},
    {"time": "19:00 PM", "title": "Family Lunch", "completed": false},
  ];

  void _addTask(String time, String title) {
    setState(() {
      tasks.add({"time": time, "title": title, "completed": false});
    });
  }

  void _showAddTaskDialog() {
    final _timeController = TextEditingController();
    final _titleController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Add New Task"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _timeController,
                decoration: const InputDecoration(labelText: "Time"),
              ),
              TextField(
                controller: _titleController,
                decoration: const InputDecoration(labelText: "Title"),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () {
                if (_timeController.text.isNotEmpty &&
                    _titleController.text.isNotEmpty) {
                  _addTask(_timeController.text, _titleController.text);
                }
                Navigator.of(context).pop();
              },
              child: const Text("Add"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.buttons,
        elevation: 0,
        title: const Text(
          "Today's Schedule",
          style: TextStyle(color: AppColors.blacks, fontSize: 24, fontWeight: FontWeight.bold),
        ),
        centerTitle: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.calendar_today, color: AppColors.blacks),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Wednesday, October 23",
              style: TextStyle(color: Colors.white70, fontSize: 16),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  final task = tasks[index];
                  return Dismissible(
                    key: UniqueKey(),
                    direction: DismissDirection.endToStart,
                    onDismissed: (direction) {
                      setState(() {
                        tasks.removeAt(index);
                      });
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("${task['title']} deleted"),
                        ),
                      );
                    },
                    background: Container(
                      alignment: Alignment.centerRight,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      color: Colors.red,
                      child: const Icon(Icons.delete, color: Colors.white),
                    ),
                    child: _buildTaskItem(
                      task["time"],
                      task["title"],
                      task["completed"],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: yellowColor,
        child: const Icon(Icons.add, color: Colors.black),
        onPressed: _showAddTaskDialog,
      ),
    );
  }

  Widget _buildTaskItem(String time, String title, bool completed) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        leading: Text(
          time,
          style: TextStyle(
            color: grayColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        title: Text(
          title,
          style: TextStyle(
            color: completed ? grayColor.withOpacity(0.6) : Colors.black,
            decoration: completed ? TextDecoration.lineThrough : TextDecoration.none,
          ),
        ),
        trailing: Icon(
          Icons.check_circle,
          color: completed ? yellowColor : grayColor.withOpacity(0.4),
        ),
      ),
    );
  }
}
