import 'package:blog/store/states/blog_state.dart';
import 'package:flutter/material.dart';

@immutable
class SetBlogState {
  final BlogState blogState;

  SetBlogState(this.blogState);
}
