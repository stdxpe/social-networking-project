import 'package:social_networking_project/models/post_model.dart';
import 'package:social_networking_project/services/i_db_service.dart';

List<Post> dummyPostsList = [
  Post(
      id: 1,
      title: "PostTitle1",
      imageUrl:
          "https://wallpapers.com/images/featured-full/photography-vss4nqivnvgidouh.jpg"),
  Post(
      id: 2,
      title: "PostTitle2",
      imageUrl:
          "https://wallpapers.com/images/featured-full/odeya-rush-jsm0behnbcpkn1le.jpg"),
  Post(
      id: 3,
      title: "PostTitle3",
      imageUrl:
          "https://laguestlist.com/wp-content/uploads/2023/01/pexels-david-bartus-610293.jpg"),
  Post(
      id: 4,
      title: "PostTitle1",
      imageUrl:
          "https://w0.peakpx.com/wallpaper/359/388/HD-wallpaper-sea-jpg.jpg"),
  Post(
      id: 5,
      title: "PostTitle2",
      imageUrl:
          "https://c4.wallpaperflare.com/wallpaper/410/867/750/vector-forest-sunset-forest-sunset-forest-wallpaper-thumb.jpg"),
  Post(
      id: 6,
      title: "PostTitle3",
      imageUrl:
          "https://wallpapers.com/images/featured/hd-nature-ngdfb9h966h4z3le.jpg"),
];

class DummyDbService extends IDbService {
  @override
  Future<List<Post>> getAllPosts() async {
    return await Future.value(dummyPostsList);
  }

  @override
  Future<Post> getPostById({required int id}) async {
    return await Future.value(
        dummyPostsList.firstWhere((element) => element.id == id));
  }

  @override
  Future<List<Post>> getPostsByFilter({required String filter}) async {
    return await Future.value(dummyPostsList
        .where((element) => element.title.contains(filter))
        .toList());
  }

  @override
  Future<void> createPost({required Post post}) async {
    dummyPostsList.add(post);
    return await Future.delayed(const Duration(seconds: 1));
  }

  @override
  Future<void> deletePost({required Post post}) async {
    dummyPostsList.remove(post);
    return await Future.delayed(const Duration(seconds: 1));
  }

  @override
  Future<void> updatePost({required int index, required Post post}) async {
    dummyPostsList[index] = post;
    return await Future.delayed(const Duration(seconds: 1));
  }
}
