import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'sellers_record.g.dart';

abstract class SellersRecord
    implements Built<SellersRecord, SellersRecordBuilder> {
  static Serializer<SellersRecord> get serializer => _$sellersRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'Email_sellers')
  String get emailSellers;

  @nullable
  @BuiltValueField(wireName: 'Number_seller')
  int get numberSeller;

  @nullable
  @BuiltValueField(wireName: 'Name_seller')
  String get nameSeller;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(SellersRecordBuilder builder) => builder
    ..emailSellers = ''
    ..numberSeller = 0
    ..nameSeller = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Sellers');

  static Stream<SellersRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  SellersRecord._();
  factory SellersRecord([void Function(SellersRecordBuilder) updates]) =
      _$SellersRecord;

  static SellersRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createSellersRecordData({
  String emailSellers,
  int numberSeller,
  String nameSeller,
}) =>
    serializers.toFirestore(
        SellersRecord.serializer,
        SellersRecord((s) => s
          ..emailSellers = emailSellers
          ..numberSeller = numberSeller
          ..nameSeller = nameSeller));
