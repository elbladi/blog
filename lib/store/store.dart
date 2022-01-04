import 'package:blog/store/actions/blog_action.dart';
import 'package:blog/store/reducers/blog_reducer.dart';
import 'package:blog/store/states/blog_state.dart';
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';

AppState appReducer(AppState state, dynamic action) {
  if (action is SetBlogState) {
    final newBlogState = blogReducer(state.blogState, action);
    return state.copyWith(blogState: newBlogState);
  }

  return state;
}

@immutable
class AppState {
  final BlogState blogState;

  AppState({
    required this.blogState,
  });

  AppState copyWith({
    BlogState? blogState,
  }) {
    return AppState(
      blogState: blogState ?? this.blogState,
    );
  }
}

class Redux {
  static Store<AppState> _store = Store<AppState>(
    appReducer,
    initialState: AppState(
      blogState: BlogState.initial(),
    ),
  );

  static Store<AppState> get store => _store;

  static Future<void> init() async {
    final blogStateInitial = BlogState.initial();

    _store = Store<AppState>(
      appReducer,
      initialState: AppState(
        blogState: blogStateInitial,
      ),
    );
  }
}
