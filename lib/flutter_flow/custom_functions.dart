import 'dart:math' as math;

import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import '../backend/backend.dart';
import '../../auth/auth_util.dart';

bool hasUploadedMedia(String mediaPath) {
  return mediaPath != null && mediaPath.isNotEmpty;
}

bool isOwner(
  PostsRecord posts,
  DocumentReference currentUser,
) {
  return posts.user == currentUser;
}

int likes(PostsRecord post) {
  return post.likes.length;
}
