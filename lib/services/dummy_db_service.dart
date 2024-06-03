import 'package:social_networking_project/models/post.dart';
import 'package:social_networking_project/services/dummy_post_list.dart';
import 'package:social_networking_project/services/i_db_service.dart';

class DummyDbService extends IDbService {
  @override
  Future<List<Post>> getAllPosts() async {
    await Future.delayed(const Duration(seconds: 3));
    List<Post> postList =
        dummyPostJsonList.map((e) => Post.fromJson(e)).toList();
    return await Future.value(postList);
  }

  @override
  Future<Post> getPostById({required int id}) async {
    Map<String, dynamic> filteredMapById =
        dummyPostJsonList.firstWhere((element) => element['id'] == id);

    Post filteredPostById = Post.fromJson(filteredMapById);
    return await Future.value(filteredPostById);
  }

  @override
  Future<List<Post>> getPostsByFilter({required String filter}) async {
    List<Map<String, dynamic>> filteredMapByFilter = dummyPostJsonList
        .where((element) => (element['title'] as String).contains(filter))
        .toList();
    List<Post> filteredPostByFilter =
        filteredMapByFilter.map((e) => Post.fromJson(e)).toList();

    return await Future.value(filteredPostByFilter);
  }

  @override
  Future<void> createPost({required Post post}) async {
    Map<String, dynamic> mapPostToBeAdded = post.toJson();
    dummyPostJsonList.add(mapPostToBeAdded);

    return await Future.delayed(const Duration(seconds: 2));
  }

  @override
  Future<void> deletePost({required Post post}) async {
    //Map<String, dynamic> postMapToBeDeleted = post.toJson();
    dummyPostJsonList.removeWhere((element) => element['id'] == post.id);

    return await Future.delayed(const Duration(seconds: 1));
  }

  @override
  void updatePost({required int id, required Post post}) async {
    // dummyPostsList[index] = post;
    Map<String, dynamic> postMapToBeUpdated = post.toJson();

    int indexOfPostToBeUpdated =
        dummyPostJsonList.indexWhere((element) => element['id'] == post.id);

    dummyPostJsonList[indexOfPostToBeUpdated] = postMapToBeUpdated;

    return await Future.delayed(const Duration(seconds: 1));
  }
}
