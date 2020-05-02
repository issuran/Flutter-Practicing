import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Chat extends StatefulWidget {
  static const String id = "CHAT";

  final FirebaseUser user;

  const Chat({Key key, this.user}) : super(key: key);

  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final Firestore _firestore = Firestore.instance;

  TextEditingController messageController = TextEditingController();
  ScrollController scrollController = ScrollController();
  
  Future<void> callback() async {
    if (messageController.text.length > 0) {
      await _firestore.collection('messages').add({
        'text': messageController.text,
        'from': widget.user.email,
        'date': DateTime.now().toIso8601String().toString(),
    });
      messageController.clear();
      scrollController.animateTo(scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Hero(
          tag: 'logo',
          child: Container(
            height: 40.0,
            child: Image.asset("assets/image/logo.png"),
          ),
        ),
        title: Text("Flutter Chat"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              _auth.signOut();
              Navigator.of(context).popUntil((route) => route.isFirst);
            },
          )
        ],
      ),

      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: _firestore
                    .collection('messages')
                    .orderBy('date')
                    .snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData)
                    return Center(
                      child: CircularProgressIndicator(),
                    );

                  List<DocumentSnapshot> docs = snapshot.data.documents;
                  List<Widget> messages = docs.map((doc) => Message(
                    from: doc.data['from'],
                    text: doc.data['text'],
                    me: widget.user.email == doc.data['from']
                  )).toList();
                  return ListView(
                    controller: scrollController,
                    children: <Widget>[
                      ...messages,
                    ],
                  );
                },
              ),
            ),
            Container(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextField(
                        onSubmitted: (value) => callback(),
                        decoration: InputDecoration(
                          hintText: "Type your message...",
                        ),
                        controller: messageController,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 12.0, left: 0.0),
                    child: SendButton(
                      text: "Send",
                      callback: callback,
                      color: Colors.amber,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SendButton extends StatelessWidget {
  final String text;
  final VoidCallback callback;
  final Color color;

  const SendButton({Key key, this.text, this.callback, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      color: color,
      onPressed: callback,
      child: Text(text),
    );
  }
}

class Message extends StatelessWidget {

  final String from;
  final String text;

  final bool me;

  const Message({Key key, this.from, this.text, this.me}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Column(
          crossAxisAlignment:
          me ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: <Widget>[
            Material(
              color: me ? Colors.teal : Colors.red,
              borderRadius: BorderRadius.circular(12.0),
              elevation: 8.0,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 3.0, horizontal: 6.0),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                      text,
                    style: TextStyle(fontSize: 14.0),
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
