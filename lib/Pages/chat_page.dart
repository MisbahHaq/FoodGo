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
  final TextEditingController messageController = TextEditingController();

  void sendMessage(String message) {
    setState(() {
      messages.add({'text': message, 'isUser': true});
      isTyping = true;
    });

    getResponse(message);
  }

  Future<void> getResponse(String message) async {
    final response = await http.post(
      Uri.parse(
        'YOUR_CHATBOT_API_URL_HERE',
      ), // Replace with your chatbot API URL
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
      body: Stack(
        children: [
          // Background Image Pattern
          Align(
            alignment: Alignment.topRight,
            child: Image.asset(
              'assets/images/Pattern.png',
              width: 300,
              fit: BoxFit.cover,
            ),
          ),

          // Back button and Notification Icon
          Positioned(
            top: 50,
            left: 20,
            child: Text(
              "Chat",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          // Main Chat Body
          Padding(
            padding: const EdgeInsets.only(top: 80.0),
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: messages.length,
                    itemBuilder: (context, index) {
                      var message = messages[index];
                      return Align(
                        alignment:
                            message['isUser']
                                ? Alignment.centerRight
                                : Alignment.centerLeft,
                        child: Container(
                          margin: EdgeInsets.symmetric(
                            vertical: 5,
                            horizontal: 10,
                          ),
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color:
                                message['isUser']
                                    ? Colors.redAccent
                                    : Colors.grey[200],
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Text(
                            message['text'],
                            style: TextStyle(
                              color:
                                  message['isUser']
                                      ? Colors.white
                                      : Colors.black,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                // Typing Indicator
                isTyping
                    ? Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          CircularProgressIndicator(
                            strokeWidth: 2,
                            color: Colors.redAccent,
                          ),
                          SizedBox(width: 10),
                          Text(
                            "Food Runs typing...",
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    )
                    : SizedBox.shrink(),
                // Message Input Box
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: messageController,
                          decoration: InputDecoration(
                            hintText: "Type a message...",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            filled: true,
                            fillColor: Colors.grey[100],
                          ),
                        ),
                      ),
                      SizedBox(width: 8),
                      CircleAvatar(
                        backgroundColor: Colors.redAccent,
                        child: IconButton(
                          icon: Icon(Icons.send, color: Colors.white),
                          onPressed: () {
                            if (messageController.text.isNotEmpty) {
                              sendMessage(messageController.text);
                              messageController.clear();
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
