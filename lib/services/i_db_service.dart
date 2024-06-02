import 'package:social_networking_project/models/post.dart';

abstract class IDbService {
  Future<List<Post>> getAllPosts();
  Future<Post> getPostById({required int id});
  Future<List<Post>> getPostsByFilter({required String filter});

  Future<void> createPost({required Post post});
  void updatePost({required int id, required Post post});
  void deletePost({required Post post});
}
