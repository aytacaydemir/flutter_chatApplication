import 'package:app_firebase/constants/colors.dart';
import 'package:app_firebase/constants/texts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

const usersArr = {
  'FpECvwcijreTjk61DvT5ZQUvopL2': 'Aytaç',
  '6zGCidmpDjYHDECPR9b7bg1Osri2': 'Ali',
};

class ConversationPage extends StatefulWidget {
  final String userId;
  final String conversationId;

  const ConversationPage(
      {super.key, required this.userId, required this.conversationId});

  @override
  State<ConversationPage> createState() => _ConversationPageState();
}

class _ConversationPageState extends State<ConversationPage> {
  final TextEditingController ctrl = TextEditingController();
  CollectionReference? _ref;

  ScrollController _scrollController = ScrollController();

  void scrollToBottom() {
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 1000),
      curve: Curves.easeIn,
    );
  }

  @override
  void initState() {
    _ref = FirebaseFirestore.instance
        .collection('chats/${widget.conversationId}/messages');

    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(usersArr[widget.userId]!),
        centerTitle: true,
      ),
      backgroundColor: ColorsTheme.primaryPage,
      body: Column(
        children: <Widget>[
          Expanded(
            child: StreamBuilder(
              stream: _ref!.orderBy('timeStamp', descending: false).snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                return !snapshot.hasData
                    ? const Center(
                        child: Text(ProjectTexts.txtBackGround),
                      )
                    : ListView(
                        controller: _scrollController,
                        children: snapshot.data!.docs
                            .map(
                              (document) => SingleChildScrollView(
                                reverse: true,
                                child: ListTile(
                                  title: Align(
                                    alignment:
                                        widget.userId == document['senderId']
                                            ? Alignment.centerRight
                                            : Alignment.centerLeft,
                                    child: Container(
                                      constraints: const BoxConstraints(
                                          maxWidth: 200, maxHeight: 55),
                                      padding: const EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                        borderRadius: widget.userId ==
                                                document['senderId']
                                            ? const BorderRadius.only(
                                                topLeft: Radius.circular(15),
                                                topRight: Radius.circular(15),
                                                bottomLeft: Radius.circular(15),
                                              )
                                            : const BorderRadius.only(
                                                topLeft: Radius.circular(15),
                                                topRight: Radius.circular(15),
                                                bottomRight:
                                                    Radius.circular(15),
                                              ),
                                        boxShadow: const [
                                          BoxShadow(
                                              blurRadius: 15.0,
                                              offset: Offset(10, 10),
                                              color: Colors.black87)
                                        ],
                                        gradient: LinearGradient(
                                          colors: widget.userId ==
                                                  document['senderId']
                                              ? [
                                                  const Color.fromARGB(
                                                      255, 138, 170, 166),
                                                  const Color.fromARGB(
                                                      255, 66, 168, 119)
                                                ]
                                              : [
                                                  const Color.fromARGB(
                                                      255, 195, 166, 201),
                                                  const Color.fromARGB(
                                                      255, 127, 109, 126),
                                                ],
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                        ),
                                      ),
                                      child: Center(
                                        child: Align(
                                          alignment: widget.userId ==
                                                  document['senderId']
                                              ? Alignment.centerRight
                                              : Alignment.centerLeft,
                                          child: ListTile(
                                            title: Text(
                                              document['message'],
                                              style:
                                                  const TextStyle(fontSize: 14),
                                            ),
                                            trailing: Text(
                                                DateFormat('Hm').format(
                                                    document['timeStamp']
                                                        .toDate()),
                                                style: const TextStyle(
                                                    fontSize: 10,
                                                    fontStyle:
                                                        FontStyle.italic)),
                                          ),

                                          /*
                                                    Text(DateFormat('Hm').format(
                                                        document['timeStamp']
                                                            .toDate()))*/
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                      );
              },
            ),
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  margin: const EdgeInsets.all(5),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.horizontal(
                      left: Radius.circular(20),
                      right: Radius.circular(20),
                    ),
                  ),
                  child: Row(
                    children: <Widget>[
                      const SizedBox(
                        height: 20,
                        width: 20,
                      ),
                      Expanded(
                        child: TextField(
                          onTap: () {
                            _scrollController.jumpTo(
                              100000 * 80.0,
                            );
                          },
                          controller: ctrl,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: ProjectTexts.txtFieldHint,
                          ),
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepPurple.shade100,
                        ),
                        child:
                            Icon(Icons.send, color: Colors.deepPurple.shade400),
                        onPressed: () async {
                          await _ref!.add({
                            'senderId': widget.userId,
                            'message': ctrl.text,
                            'timeStamp': DateTime.now(),
                          });

                          ctrl.text = '';
                          scrollToBottom();
                        },
                      ),
                      const SizedBox(
                        height: 20,
                        width: 10,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
