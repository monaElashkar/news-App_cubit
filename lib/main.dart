import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc_screen/CategoryCubit.dart';
import 'screens/categories_screen.dart';

void main() {
  runApp(const MyApp(),);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: ((context) => CategoryCubit())
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: categoriesScreen(),
      ),
    );
  }
}
