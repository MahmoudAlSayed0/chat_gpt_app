// ignore_for_file: deprecated_member_use

import 'package:chat_gpt_app/core/data/models/request_state.dart';
import 'package:chat_gpt_app/core/presentation/cubit/chat/chat_cubit.dart';
import 'package:chat_gpt_app/utils/app_icons.dart';
import 'package:chat_gpt_app/utils/my_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../components/chat_message_widget.dart';
import '../components/chat_screen_header.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  ChatScreenState createState() => ChatScreenState();
}

class ChatScreenState extends State<ChatScreen> {
  TextEditingController messageController = TextEditingController();
  ScrollController scrollController = ScrollController();
  @override
  void dispose() {
    messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChatCubit, ChatState>(
      listener: (context, state) {
        if (state.requestState == RequestState.error) {
          mySnackBar(state.errorMessage, context);
        }
      },
      builder: (context, state) {
        final cubit = ChatCubit.get(context);
        return PopScope(
          onPopInvoked: (didPop) async {
            await context.read<ChatCubit>().clearAndSave();

            // RouteManager.pop();
          },
          child: Scaffold(
              body: Column(
            children: <Widget>[
              45.verticalSpace,
              const ChatScreenHeader(),
              Expanded(
                child: state.messages.isEmpty
                    ? Center(
                        child: Text(
                          'Ask anything, get your answer',
                          style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                              color: Theme.of(context)
                                  .colorScheme
                                  .primary
                                  .withOpacity(.4)),
                        ),
                      )
                    : ListView.builder(
                        controller: scrollController,
                        itemCount: state.messages.length,
                        itemBuilder: (context, index) => ChatMessageWidget(
                            isUser: state.messages[index].isUser,
                            message: state.messages[index].content),
                      ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: TextField(
                  controller: messageController,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(8.r),
                    suffixIcon: state.requestState == RequestState.loading
                        ? null
                        : InkWell(
                            onTap: () async {
                              var text = messageController.text;
                              messageController.clear();

                              await cubit.sendMessage(text);
                              await Future.delayed(
                                  const Duration(milliseconds: 200));
                              if (state.messages.length > 1) {
                                await scrollController.animateTo(
                                  scrollController.position.maxScrollExtent,
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.easeOut,
                                );
                              }
                            },
                            child: Padding(
                              padding: EdgeInsets.all(8.r),
                              child: SvgPicture.asset(AppIcons.send),
                            ),
                          ),
                    filled: true,
                    fillColor:
                        Theme.of(context).colorScheme.primary.withOpacity(.1),
                    /*  enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        // color: Colors.teal, // Border color
                        width: 2.0, // Border width
                      ),
                    ), */
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.primary),
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.primary),
                      borderRadius: BorderRadius.circular(8.r),
                      // Border radius
                    ),
                  ),
                ),
              ),
              40.verticalSpace
            ],
          )),
        );
      },
    );
  }
}
