import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  List<Map<String, dynamic>> messages = [];
  bool isTyping = false;
  final TextEditingController _messageController = TextEditingController();

  void sendMessage(String message) {
    setState(() {
      messages.add({'text': message, 'isUser': true});
      isTyping = true;
    });

    getResponse(message);
  }

  Future<void> getResponse(String message) async {
    final response = await http.post(
      Uri.parse('YOUR_CHATBOT_API_URL_HERE'), // Replace with your API endpoint
      body: jsonEncode({'message': message}),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      setState(() {
        messages.add({'text': data['response'], 'isUser': false});
      });
    } else {
      setState(() {
        messages.add({
          'text': "Sorry, I couldn't understand that.",
          'isUser': false,
        });
      });
    }

    setState(() {
      isTyping = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Chatbot')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              reverse: true,
              itemCount: messages.length,
              itemBuilder: (context, index) {
                var message = messages[index];
                return Align(
                  alignment:
                      message['isUser']
                          ? Alignment.centerRight
                          : Alignment.centerLeft,
                  child: Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    decoration: BoxDecoration(
                      color: message['isUser'] ? Colors.blue : Colors.grey[300],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      message['text'],
                      style: TextStyle(
                        color: message['isUser'] ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          if (isTyping)
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("Bot is typing..."),
            ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: InputDecoration(hintText: "Type a message..."),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {
                    if (_messageController.text.isNotEmpty) {
                      sendMessage(_messageController.text);
                      _messageController.clear();
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
