import 'package:flutter/material.dart';
import 'package:scrollable_code/ChatMessage.dart';
import 'package:scrollable_code/chat_text.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  List<ChatMessage> messages = [];
  final ScrollController scrollController = ScrollController();

  final data = [
    ChatMessage(
      messageType: 'text',
      messageText:
          'Lorem Impsum.. Lorem Impsum.. Lorem Impsum.. Lorem Impsum.. Lorem Impsum..',
      isSelected: false,
      didVideoEnded: false,
    ),
    ChatMessage(
      messageType: 'video',
      messageText:
          'Lorem Impsum.. Lorem Impsum.. Lorem Impsum.. Lorem Impsum.. Lorem Impsum..',
      isSelected: false,
      didVideoEnded: false,
    ),
    ChatMessage(
      messageType: 'text',
      messageText:
          'Lorem Impsum.. Lorem Impsum.. Lorem Impsum.. Lorem Impsum.. Lorem Impsum..',
      isSelected: false,
      didVideoEnded: false,
    ),
    ChatMessage(
      messageType: 'video',
      messageText:
          'Lorem Impsum.. Lorem Impsum.. Lorem Impsum.. Lorem Impsum.. Lorem Impsum..',
      isSelected: false,
      didVideoEnded: false,
    ),
    ChatMessage(
      messageType: 'text',
      messageText:
          'Lorem Impsum.. Lorem Impsum.. Lorem Impsum.. Lorem Impsum.. Lorem Impsum..',
      isSelected: false,
      didVideoEnded: false,
    )
  ];

  @override
  void initState() {
    super.initState();
    initData();
  }

  initData() async {
    for (var element in data) {
      await Future.delayed(const Duration(seconds: 1));
      messages.add(element);
      scrollTo();
      setState(() {});
    }
  }

  scrollTo() {
    scrollController.animateTo(scrollController.position.maxScrollExtent,
        duration: const Duration(seconds: 1), curve: Curves.linear);
    Scrollable.ensureVisible(context);
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: ListView.builder(
            shrinkWrap: true,
            controller: scrollController,
            scrollDirection: Axis.vertical,
            itemCount: messages.length,
            itemBuilder: (_, index) {
              return Container(
                margin: (messages[index].sentBy == "receiver")
                    ? messages[index].messageType == "slider"
                        ? const EdgeInsets.only(right: 25)
                        : const EdgeInsets.only(right: 65)
                    : const EdgeInsets.only(left: 65),
                padding: EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                child: Align(
                  alignment: (messages[index].sentBy == "receiver"
                      ? Alignment.topLeft
                      : Alignment.topRight),
                  child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                            color:
                                (messages[index].messageType == "questions" &&
                                        messages[index].isSelected == false)
                                    ? Colors.white
                                    : Colors.transparent),
                        color: ((messages[index].sentBy == "receiver")
                            ? const Color(0xff393457)
                            : (messages[index].messageType == "questions" &&
                                    messages[index].isSelected == false)
                                ? Colors.transparent
                                : messages[index].messageType == "userInput"
                                    ? const Color(0xff393457)
                                    : Colors.yellowAccent),
                        borderRadius: (messages[index].sentBy == "receiver")
                            ? const BorderRadius.only(
                                topLeft: Radius.circular(24),
                                topRight: Radius.circular(24),
                                bottomRight: Radius.circular(24))
                            : const BorderRadius.only(
                                topLeft: Radius.circular(24),
                                topRight: Radius.circular(24),
                                bottomLeft: Radius.circular(24)),
                      ),
                      padding: const EdgeInsets.only(
                          left: 16, right: 16, top: 14, bottom: 14),
                      child: BuildChatTextWidget(
                          message: messages[index], index: index)),
                ),
              );
            }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => initData(),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
