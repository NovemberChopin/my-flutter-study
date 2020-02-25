import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

const String _name = 'js';

class FriendlyChat extends StatefulWidget {
  FriendlyChat({Key key}) : super(key: key);

  @override
  _FriendlyChatState createState() => _FriendlyChatState();
}

class _FriendlyChatState extends State<FriendlyChat> {
  final List<ChatMessage> _messages = <ChatMessage>[];
  final TextEditingController _textEditingController = new TextEditingController();
  bool isComposing = false;  // 输入框是否存在数值

  void _handleSubmited(String text) {
    _textEditingController.clear();
    setState(() {
      isComposing = false;
    });
    if (text.length > 0) {
      ChatMessage message = new ChatMessage(text: text);
      setState(() {
        _messages.insert(0, message);
      });
    }
  }

  Widget _buildTextComposer() {
    return IconTheme(
      data: IconThemeData(color: Theme.of(context).accentColor),
      child: Container(
        // 创建具有对称的垂直和水平偏移量的insets。
        margin: EdgeInsets.symmetric(horizontal: 8),
        child: Row(
          children: <Widget>[
            Expanded(
              child: TextField(
                autofocus: true,
                controller: _textEditingController,
                onChanged: (String text) {
                  setState(() {
                    isComposing = text.length > 0;
                  });
                },
                onSubmitted: _handleSubmited,
                decoration: InputDecoration.collapsed(hintText: 'Send a message'),
              ),
            ),
            IconButton(
              icon: Icon(Icons.send),
              onPressed: isComposing ? () => _handleSubmited(_textEditingController.text) : null
            ),
          ],
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    // debugPaintSizeEnabled = true;
    return Scaffold(
      appBar: AppBar(title: Text('Friendly Chat App'),),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              reverse: true,
              padding: EdgeInsets.all(8.0),
              itemBuilder: (_, int index) => _messages[index],
              itemCount: _messages.length,
            ),
          ),
          Divider(height: 1,),
          Container(
            child: _buildTextComposer(),
          )
        ],
      ),
    );
  }
}

class ChatMessage extends StatelessWidget {
  final String text;
  ChatMessage({this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 16.0),
            child: CircleAvatar(child: Text(_name[0]),),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(_name, style: Theme.of(context).textTheme.subtitle1),
                Container(
                  margin: EdgeInsets.only(top: 5.0),
                  child: Text(text),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}