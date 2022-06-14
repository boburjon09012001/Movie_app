import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:movia_app/view_model/main_viewmodel.dart';
import 'package:movia_app/view_ui/pages/home_page.dart';
import 'package:provider/provider.dart';


void main(){
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MainViewModel()),
      ],
      child: MyApp(),
    ),
  );

}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      theme: ThemeData(
        primaryColor: Color(0xFF070D2D),
      ),
      debugShowCheckedModeBanner:false,
        home: MyHomePage()
    );
  }
}
