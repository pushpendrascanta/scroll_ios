import 'package:flutter/material.dart';
import 'package:scrollable_code/ChatMessage.dart';

class BuildChatTextWidget extends StatelessWidget {
  BuildChatTextWidget({Key? key, required this.message, required this.index})
      : super(key: key);

  final ChatMessage message;
  final int index;
  late Size SizeConfig;
  @override
  Widget build(BuildContext context) {
    SizeConfig = MediaQuery.of(context).size;
    return buildChatTextWidget(message);
  }

  Widget buildChatTextWidget(ChatMessage messages) {
    if (messages.messageType == "video") {
      return Column(
        children: [
          InkWell(
              onTap: () => null,
              child: Stack(
                alignment: Alignment.bottomRight,
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        width: SizeConfig.width / 1.4,
                        height: SizeConfig.height / 4,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: Color(0xff555555),
                        ),
                      ),
                      //Play Icons buttons
                      Container(
                        width: 52,
                        height: 52,
                        decoration: const BoxDecoration(
                            color: Colors.yellowAccent, shape: BoxShape.circle),
                        child: const Icon(
                          Icons.play_arrow_sharp,
                          color: Colors.white,
                          size: 42,
                        ),
                      )
                    ],
                  ),
                ],
              )),
          const SizedBox(
            height: 10,
          ),
        ],
      );
    } else if (messages.messageType == "emoji") {
      return Image.network(messages.messageText!);
    } else {
      return Text(
        "${messages.messageText}",
        style: textStyleWithSatoshi(Colors.white, FontWeight.w500, 16.0),
      );
    }
  }
}

textStyleWithSatoshi(@required colors, @required fontWeight, @required fontSize,
    [decoration]) {
  return TextStyle(
      color: colors,
      fontWeight: fontWeight,
      fontSize: fontSize,
      decoration: decoration,
      fontFamily: "Satoshi",
      letterSpacing: 0.0);
}
