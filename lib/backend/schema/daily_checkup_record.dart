import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DailyCheckupRecord extends FirestoreRecord {
  DailyCheckupRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "message_du_jour" field.
  String? _messageDuJour;
  String get messageDuJour => _messageDuJour ?? '';
  bool hasMessageDuJour() => _messageDuJour != null;

  // "photos_repas" field.
  List<String>? _photosRepas;
  List<String> get photosRepas => _photosRepas ?? const [];
  bool hasPhotosRepas() => _photosRepas != null;

  // "humeur_du_jour" field.
  String? _humeurDuJour;
  String get humeurDuJour => _humeurDuJour ?? '';
  bool hasHumeurDuJour() => _humeurDuJour != null;

  // "date_checkup" field.
  DateTime? _dateCheckup;
  DateTime? get dateCheckup => _dateCheckup;
  bool hasDateCheckup() => _dateCheckup != null;

  // "conseil_du_jour" field.
  String? _conseilDuJour;
  String get conseilDuJour => _conseilDuJour ?? '';
  bool hasConseilDuJour() => _conseilDuJour != null;

  // "humeur_number" field.
  int? _humeurNumber;
  int get humeurNumber => _humeurNumber ?? 0;
  bool hasHumeurNumber() => _humeurNumber != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _messageDuJour = snapshotData['message_du_jour'] as String?;
    _photosRepas = getDataList(snapshotData['photos_repas']);
    _humeurDuJour = snapshotData['humeur_du_jour'] as String?;
    _dateCheckup = snapshotData['date_checkup'] as DateTime?;
    _conseilDuJour = snapshotData['conseil_du_jour'] as String?;
    _humeurNumber = castToType<int>(snapshotData['humeur_number']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('daily_checkup')
          : FirebaseFirestore.instance.collectionGroup('daily_checkup');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('daily_checkup').doc(id);

  static Stream<DailyCheckupRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => DailyCheckupRecord.fromSnapshot(s));

  static Future<DailyCheckupRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => DailyCheckupRecord.fromSnapshot(s));

  static DailyCheckupRecord fromSnapshot(DocumentSnapshot snapshot) =>
      DailyCheckupRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static DailyCheckupRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      DailyCheckupRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'DailyCheckupRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is DailyCheckupRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createDailyCheckupRecordData({
  String? messageDuJour,
  String? humeurDuJour,
  DateTime? dateCheckup,
  String? conseilDuJour,
  int? humeurNumber,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'message_du_jour': messageDuJour,
      'humeur_du_jour': humeurDuJour,
      'date_checkup': dateCheckup,
      'conseil_du_jour': conseilDuJour,
      'humeur_number': humeurNumber,
    }.withoutNulls,
  );

  return firestoreData;
}

class DailyCheckupRecordDocumentEquality
    implements Equality<DailyCheckupRecord> {
  const DailyCheckupRecordDocumentEquality();

  @override
  bool equals(DailyCheckupRecord? e1, DailyCheckupRecord? e2) {
    const listEquality = ListEquality();
    return e1?.messageDuJour == e2?.messageDuJour &&
        listEquality.equals(e1?.photosRepas, e2?.photosRepas) &&
        e1?.humeurDuJour == e2?.humeurDuJour &&
        e1?.dateCheckup == e2?.dateCheckup &&
        e1?.conseilDuJour == e2?.conseilDuJour &&
        e1?.humeurNumber == e2?.humeurNumber;
  }

  @override
  int hash(DailyCheckupRecord? e) => const ListEquality().hash([
        e?.messageDuJour,
        e?.photosRepas,
        e?.humeurDuJour,
        e?.dateCheckup,
        e?.conseilDuJour,
        e?.humeurNumber
      ]);

  @override
  bool isValidKey(Object? o) => o is DailyCheckupRecord;
}
