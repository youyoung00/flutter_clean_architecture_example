import 'package:flutter/cupertino.dart';
import 'package:flutter_clean_architecture/domain/domain_model/post.dart';
import 'package:flutter_clean_architecture/domain/domain_repository/post_repository.dart';

class HomeViewModel with ChangeNotifier {
  final PostRepository _postRepository;

  List<Post> posts = [];
  int currentPage = 1;
  bool isLoading = false;

  HomeViewModel(this._postRepository);

  Future<void> fetch(int page) async {
    isLoading = true;
    notifyListeners();

    posts = await _postRepository.getAllPosts();
    currentPage = page;

    isLoading = false;
    notifyListeners();
  }
}
