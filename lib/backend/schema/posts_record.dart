import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'posts_record.g.dart';

abstract class PostsRecord implements Built<PostsRecord, PostsRecordBuilder> {
  static Serializer<PostsRecord> get serializer => _$postsRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'num_likes')
  int get numLikes;

  @nullable
  DocumentReference get user;

  @nullable
  String get username;

  @nullable
  @BuiltValueField(wireName: 'user_profile_pic')
  String get userProfilePic;

  @nullable
  @BuiltValueField(wireName: 'created_at')
  DateTime get createdAt;

  @nullable
  @BuiltValueField(wireName: 'video_post')
  String get videoPost;

  @nullable
  @BuiltValueField(wireName: 'Post_description')
  String get postDescription;

  @nullable
  @BuiltValueField(wireName: 'NumComments_post')
  int get numCommentsPost;

  @nullable
  bool get isOwner;

  @nullable
  BuiltList<DocumentReference> get likes;

  @nullable
  DocumentReference get postUser;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(PostsRecordBuilder builder) => builder
    ..numLikes = 0
    ..username = ''
    ..userProfilePic = ''
    ..videoPost = ''
    ..postDescription = ''
    ..numCommentsPost = 0
    ..isOwner = false
    ..likes = ListBuilder();

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('posts');

  static Stream<PostsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  PostsRecord._();
  factory PostsRecord([void Function(PostsRecordBuilder) updates]) =
      _$PostsRecord;

  static PostsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createPostsRecordData({
  int numLikes,
  DocumentReference user,
  String username,
  String userProfilePic,
  DateTime createdAt,
  String videoPost,
  String postDescription,
  int numCommentsPost,
  bool isOwner,
  DocumentReference postUser,
}) =>
    serializers.toFirestore(
        PostsRecord.serializer,
        PostsRecord((p) => p
          ..numLikes = numLikes
          ..user = user
          ..username = username
          ..userProfilePic = userProfilePic
          ..createdAt = createdAt
          ..videoPost = videoPost
          ..postDescription = postDescription
          ..numCommentsPost = numCommentsPost
          ..isOwner = isOwner
          ..likes = null
          ..postUser = postUser));
