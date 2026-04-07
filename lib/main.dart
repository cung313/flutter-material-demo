import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material Widgets Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController nameController = TextEditingController();
  bool isNotificationOn = false;
  bool likesFlutter = false;
  String gender = 'Nam';

  void showSavedMessage() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Đã lưu thông tin: ${nameController.text.isEmpty ? "Chưa nhập tên" : nameController.text}',
        ),
      ),
    );
  }

  void showInfoDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Thông báo'),
        content: const Text('Bạn đã bấm FloatingActionButton!'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Đóng'),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Material Widgets Demo'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: showInfoDialog,
        child: const Icon(Icons.add),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Card(
              elevation: 3,
              child: ListTile(
                leading: const Icon(Icons.person),
                title: const Text('Thông tin sinh viên'),
                subtitle: const Text('Demo Card + ListTile'),
                trailing: const Icon(Icons.arrow_forward_ios),
              ),
            ),
            const SizedBox(height: 16),

            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: 'Nhập họ tên',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.badge),
              ),
            ),
            const SizedBox(height: 16),

            SwitchListTile(
              title: const Text('Bật thông báo'),
              value: isNotificationOn,
              onChanged: (value) {
                setState(() {
                  isNotificationOn = value;
                });
              },
            ),

            CheckboxListTile(
              title: const Text('Tôi thích học Flutter'),
              value: likesFlutter,
              onChanged: (value) {
                setState(() {
                  likesFlutter = value ?? false;
                });
              },
            ),

            RadioListTile<String>(
              title: const Text('Nam'),
              value: 'Nam',
              groupValue: gender,
              onChanged: (value) {
                setState(() {
                  gender = value!;
                });
              },
            ),
            RadioListTile<String>(
              title: const Text('Nữ'),
              value: 'Nữ',
              groupValue: gender,
              onChanged: (value) {
                setState(() {
                  gender = value!;
                });
              },
            ),

            const SizedBox(height: 16),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: showSavedMessage,
                child: const Text('Lưu thông tin'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}