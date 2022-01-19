import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/presentation/view_model/home_view_model.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      _updateUi(1);
    });
  }

  Future<void> _updateUi(int page) async {
    final viewModel = context.read<HomeViewModel>();
    viewModel.fetch(page);
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<HomeViewModel>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("클린 아키텍처 예제"),
      ),
      body: viewModel.isLoading == true
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    // shrinkWrap: true,
                    itemCount: viewModel.posts.length,
                    itemBuilder: (BuildContext context, int i) {
                      return Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Card(
                          child: ListTile(
                            title: Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                      text: '${viewModel.posts[i].id}  ',
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  TextSpan(
                                    text: viewModel.posts[i].title.length < 8
                                        ? viewModel.posts[i].title
                                        : viewModel.posts[i].title
                                            .substring(0, 8),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.arrow_back_ios)),
                      ...List.generate(
                              viewModel.posts.length, (index) => index + 1)
                          .map((page) => Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0),
                                child: Text('$page'),
                              ))
                          .toList()
                          .sublist(0, 4),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.arrow_forward_ios)),
                    ])
              ],
            ),
    );
  }
}

// TextButton(
// onPressed: () {
// viewModel.fetch(page);
// },
// child: Text('$page'))
