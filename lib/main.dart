import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/data/data_repository/post_repository_impl.dart';
import 'package:flutter_clean_architecture/data/data_source/remote/post_remote_data_source.dart';
import 'package:flutter_clean_architecture/presentation/screen/home_screen.dart';
import 'package:flutter_clean_architecture/presentation/view_model/home_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) =>
              HomeViewModel(PostRepositoryImpl(PostRemoteDataSource())),
        )
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}
