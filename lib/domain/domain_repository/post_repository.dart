import 'package:flutter_clean_architecture/domain/domain_model/post.dart';

abstract class PostRepository {
  Future<List<Post>> getAllPosts();

  Future<List<Post>> getPost(int page);
}
