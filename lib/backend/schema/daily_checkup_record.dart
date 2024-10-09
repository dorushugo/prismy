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

  // "photos_du_jour" field.
  List<String>? _photosDuJour;
  List<String> get photosDuJour => _photosDuJour ?? const [];
  bool hasPhotosDuJour() => _photosDuJour != null;

  // "experience_jour" field.
  int? _experienceJour;
  int get experienceJour => _experienceJour ?? 0;
  bool hasExperienceJour() => _experienceJour != null;

  // "meteo_jour" field.
  int? _meteoJour;
  int get meteoJour => _meteoJour ?? 0;
  bool hasMeteoJour() => _meteoJour != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _messageDuJour = snapshotData['message_du_jour'] as String?;
    _photosRepas = getDataList(snapshotData['photos_repas']);
    _dateCheckup = snapshotData['date_checkup'] as DateTime?;
    _conseilDuJour = snapshotData['conseil_du_jour'] as String?;
    _humeurNumber = castToType<int>(snapshotData['humeur_number']);
    _photosDuJour = getDataList(snapshotData['photos_du_jour']);
    _experienceJour = castToType<int>(snapshotData['experience_jour']);
    _meteoJour = castToType<int>(snapshotData['meteo_jour']);
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
  DateTime? dateCheckup,
  String? conseilDuJour,
  int? humeurNumber,
  int? experienceJour,
  int? meteoJour,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'message_du_jour': messageDuJour,
      'date_checkup': dateCheckup,
      'conseil_du_jour': conseilDuJour,
      'humeur_number': humeurNumber,
      'experience_jour': experienceJour,
      'meteo_jour': meteoJour,
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
        e1?.dateCheckup == e2?.dateCheckup &&
        e1?.conseilDuJour == e2?.conseilDuJour &&
        e1?.humeurNumber == e2?.humeurNumber &&
        listEquality.equals(e1?.photosDuJour, e2?.photosDuJour) &&
        e1?.experienceJour == e2?.experienceJour &&
        e1?.meteoJour == e2?.meteoJour;
  }

  @override
  int hash(DailyCheckupRecord? e) => const ListEquality().hash([
        e?.messageDuJour,
        e?.photosRepas,
        e?.dateCheckup,
        e?.conseilDuJour,
        e?.humeurNumber,
        e?.photosDuJour,
        e?.experienceJour,
        e?.meteoJour
      ]);

  @override
  bool isValidKey(Object? o) => o is DailyCheckupRecord;
}
