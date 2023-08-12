// ignore_for_file: camel_case_types
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../bloc_screen/CategoryCubit.dart';
import '../bloc_states/CategoryState.dart';

class web_screen extends StatefulWidget {

  const web_screen({Key? key}) : super(key: key);

  @override
  State<web_screen> createState() => _web_screenState();
}

class _web_screenState extends State<web_screen> {
  late final WebViewController controller;
  @override
  void initState(){
    super.initState();
    controller=WebViewController()..loadRequest(Uri.parse(context.read<CategoryCubit>().Url));

  }
  @override
  Widget build(BuildContext context) {

    final cubit=context.read<CategoryCubit>();
    return BlocBuilder<CategoryCubit,CategoryState>(
        builder: (context, state) {
          return SafeArea(
            child: Scaffold(
              backgroundColor: cubit.colorscreen,
              body:cubit.Url==null?Center(child: CircularProgressIndicator(),):
              WebViewWidget(
                controller: controller,
              ),
            ),
          );
        }
    );
  }
}