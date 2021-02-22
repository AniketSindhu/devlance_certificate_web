import 'package:cloud_firestore/cloud_firestore.dart';

class Certificate {
  String name;
  String projectName;
  String work;
  String uniqueId;
  DateTime issuedOn;
  Certificate(
      {this.name, this.projectName, this.uniqueId, this.work, this.issuedOn});
  factory Certificate.fromDocument(DocumentSnapshot doc) {
    return Certificate(
        name: doc['name'],
        projectName: doc['project_name'],
        work: doc['work'],
        uniqueId: doc['uniqueId'],
        issuedOn: doc['issuedOn'].toDate());
  }

  Map<String, dynamic> toForm() {
    return {
      'name': name,
      'project_name': projectName,
      'work': work,
      'uniqueId': uniqueId,
      'issuedOn': issuedOn
    };
  }
}
