import 'package:blog/store/actions/blog_action.dart';
import 'package:blog/store/states/blog_state.dart';

blogReducer(BlogState prevState, SetBlogState action) {
  final payload = action.blogState;

  return prevState.copyWith(
    currentData: payload.currentData,
  );
}
