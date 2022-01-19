import 'package:flutter_clean_architecture/data/data_source/remote/post_remote_data_source.dart';
import 'package:flutter_clean_architecture/domain/domain_model/post.dart';
import 'package:flutter_clean_architecture/domain/domain_repository/post_repository.dart';

class PostRepositoryImpl implements PostRepository {
  final PostRemoteDataSource _dataSource;
  final int pageLimit = 10;

  PostRepositoryImpl(this._dataSource);

  @override
  Future<List<Post>> getAllPosts() async {
    return await _dataSource.getAllPosts();
  }

  @override
  Future<List<Post>> getPost(int page) async {
    return await _dataSource.getPosts(page, pageLimit);
  }
}
