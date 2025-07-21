import 'package:fakenewsdetection/Backend/api_fetch.dart';
import 'package:flutter/material.dart';

class DetectionScreen extends StatefulWidget {
  const DetectionScreen({super.key});

  @override
  State<DetectionScreen> createState() => _DetectionScreenState();
}

class _DetectionScreenState extends State<DetectionScreen> {
  final TextEditingController _controller = TextEditingController();
  String? result;
  bool isLoading = false;

  Future<void> handleCheckNews() async {
    setState(() => isLoading = true);

    try {
      final prediction = await ApiService.predictNews(_controller.text);
      setState(() => result = prediction);
    } catch (e) {
      setState(() => result = 'Error: ${e.toString()}');
    }

    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detect News')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Text(
              "Paste news content below:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _controller,
              maxLines: 6,
              decoration: InputDecoration(
                hintText: "Type or paste your news article...",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: isLoading ? null : handleCheckNews,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
              ),
              child: isLoading
                  ? const CircularProgressIndicator(color: Colors.white)
                  : const Text("Check News", style: TextStyle(fontSize: 16)),
            ),
            const SizedBox(height: 20),
            if (result != null)
              Card(
                color: result!.contains("Real")
                    ? Colors.green[100]
                    : Colors.red[100],
                elevation: 4,
                margin: const EdgeInsets.only(top: 12),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Text(
                    result!,
                    style: TextStyle(
                      fontSize: 20,
                      color: result!.contains("Real")
                          ? Colors.green[900]
                          : Colors.red[900],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}
