import 'package:cloud_firestore/cloud_firestore.dart';

class DocumentWebModel {
  String? scheduleNumber;
  String? impectionNumber;
  String? policeNumber;
  String? vin;
  String? engineNumber;
  String? bodyNumber;
  String? model;
  String? jobType;
  String? houmeter;
  String? kilometer;
  String? priority;
  String? customer;
  String? foreman;
  Timestamp? startDate;
  Timestamp? endDate;
  String? remark;
  String? status;
  Timestamp? createdTime;
  String? documentID;

  DocumentWebModel({
    this.scheduleNumber,
    this.impectionNumber,
    this.policeNumber,
    this.vin,
    this.engineNumber,
    this.bodyNumber,
    this.model,
    this.jobType,
    this.houmeter,
    this.kilometer,
    this.priority,
    this.customer,
    this.foreman,
    this.startDate,
    this.endDate,
    this.remark,
    this.status,
    this.createdTime,
    this.documentID,
  });

  DocumentWebModel.fromJson(Map<String, dynamic> json) {
    scheduleNumber = json['scheduleNumber'];
    impectionNumber = json['impectionNumber'];
    policeNumber = json['policeNumber'];
    vin = json['vin'];
    engineNumber = json['engineNumber'];
    bodyNumber = json['bodyNumber'];
    model = json['model'];
    jobType = json['jobType'];
    houmeter = json['houmeter'];
    kilometer = json['kilometer'];
    priority = json['priority'];
    customer = json['customer'];
    foreman = json['foreman'];
    startDate = json['startDate'];
    endDate = json['endDate'];
    remark = json['remark'];
    status = json['status'];
    createdTime = json['createdTime'];
    documentID = json['documentID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['scheduleNumber'] = scheduleNumber;
    data['impectionNumber'] = impectionNumber;
    data['policeNumber'] = policeNumber;
    data['vin'] = vin;
    data['engineNumber'] = engineNumber;
    data['bodyNumber'] = bodyNumber;
    data['model'] = model;
    data['jobType'] = jobType;
    data['houmeter'] = houmeter;
    data['kilometer'] = kilometer;
    data['priority'] = priority;
    data['customer'] = customer;
    data['foreman'] = foreman;
    data['startDate'] = startDate;
    data['endDate'] = endDate;
    data['remark'] = remark;
    data['status'] = status;
    data['createdTime'] = createdTime;
    data['documentID'] = documentID;

    return data;
  }
}
