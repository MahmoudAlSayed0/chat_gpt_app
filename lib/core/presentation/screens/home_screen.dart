// ignore_for_file: deprecated_member_use

import 'dart:developer';

import 'package:chat_gpt_app/app/router.dart';
import 'package:chat_gpt_app/core/presentation/cubit/chat/chat_cubit.dart';
import 'package:chat_gpt_app/utils/appcolors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../components/chat_history_widget.dart';
import '../components/home_button_list.dart';
import '../components/new_chat_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.light
          ? AppColors.white
          : AppColors.black,
      body: Column(
        children: <Widget>[
          60.verticalSpace,
          const NewChatButton(),
          BlocBuilder<ChatCubit, ChatState>(
            builder: (context, state) {
              if (state.idList.isEmpty) {
                return const Expanded(
                  child: Text('empty'),
                );
              } else {
                return Expanded(
                  child: state.fetchingData
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : ListView.builder(
                          itemCount: state.recentChats.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                context
                                    .read<ChatCubit>()
                                    .setAsCurrentChat(state.recentChats[index]);
                                log(state.recentChats[index].toString());
                                RouteManager.goTo(RouteManager.chat);
                              },
                              child: ChatHistoryWidget(
                                title: state.recentChats[index].entries.first
                                    .value.first.content,
                              ),
                            );
                          },
                        ),
                );
              }
            },
          ),
          const HomeButtonList()
        ],
      ),
    );
  }
}
