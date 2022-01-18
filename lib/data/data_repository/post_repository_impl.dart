import 'package:flutter_clean_architecture/domain/domain_model/post.dart';
import 'package:flutter_clean_architecture/domain/domain_repository/post_repository.dart';

class PostRepositoryImpl implements PostRepository {
  @override
  Future<List<Post>> getAllPosts() {
    // TODO: implement getAllPosts
    throw UnimplementedError();
  }

  @override
  Future<List<Post>> getPost(int page) {
    // TODO: implement getPost
    throw UnimplementedError();
  }
}
