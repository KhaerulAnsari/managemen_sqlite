// ignore_for_file: prefer_const_declarations

final String tableDocument = 'data';

class DocumentFields {
  static final List<String> values = [
    id,
    scheduleNumber,
    impectionNumber,
    policeNumber,
    vin,
    engineNumber,
    bodyNumber,
    model,
    jobType,
    houmeter,
    kilometer,
    priority,
    customer,
    foreman,
    timeStartDate,
    timeEndDate,
    remark,
    status,
    time,
  ];

  static final String id = '_id';
  static final String scheduleNumber = 'scheduleNumber';
  static final String impectionNumber = 'impectionNumber';
  static final String policeNumber = 'policeNumber';
  static final String vin = 'vin';
  static final String engineNumber = 'engineNumber';
  static final String bodyNumber = 'bodyNumber';
  static final String model = 'model';
  static final String jobType = 'jobType';
  static final String houmeter = 'houmeter';
  static final String kilometer = 'kilometer';
  static final String priority = 'priority';
  static final String customer = 'customer';
  static final String foreman = 'foreman';
  static final String timeStartDate = 'startdate';
  static final String timeEndDate = 'enddate';
  static final String remark = 'remark';
  static final String status = 'status';
  static final String time = 'time';
}

class Document {
  final int? id;
  final String? scheduleNumber;
  final String? impectionNumber;
  final String? policeNumber;
  final String? vin;
  final String? engineNumber;
  final String? bodyNumber;
  final String? model;
  final String? jobType;
  final String? houmeter;
  final String? kilometer;
  final String? priority;
  final String? customer;
  final String? foreman;
  final DateTime? startDate;
  final DateTime? endDate;
  final String? remark;
  final String? status;
  final DateTime? createdTime;

  Document({
    this.id,
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
  });

  Document copy({
    final int? id,
    final String? scheduleNumber,
    final String? impectionNumber,
    final String? policeNumber,
    final String? vin,
    final String? engineNumber,
    final String? bodyNumber,
    final String? model,
    final String? jobType,
    final String? houmeter,
    final String? kilometer,
    final String? priority,
    final String? customer,
    final String? foreman,
    final DateTime? startDate,
    final DateTime? endDate,
    final String? remark,
    final String? status,
    final DateTime? createdTime,
  }) =>
      Document(
        id: id ?? this.id,
        scheduleNumber: scheduleNumber ?? this.scheduleNumber,
        impectionNumber: impectionNumber ?? this.impectionNumber,
        policeNumber: policeNumber ?? this.policeNumber,
        vin: vin ?? this.vin,
        engineNumber: engineNumber ?? this.engineNumber,
        bodyNumber: bodyNumber ?? this.bodyNumber,
        model: model ?? this.model,
        jobType: jobType ?? this.jobType,
        houmeter: houmeter ?? this.houmeter,
        kilometer: kilometer ?? this.kilometer,
        priority: priority ?? this.priority,
        customer: customer ?? this.customer,
        foreman: foreman ?? this.foreman,
        startDate: startDate ?? this.startDate,
        endDate: endDate ?? this.endDate,
        remark: remark ?? this.remark,
        status: status ?? this.status,
        createdTime: createdTime ?? this.createdTime,
      );

  static Document fromJson(Map<String, Object?> json) => Document(
        id: json[DocumentFields.id] as int?,
        scheduleNumber: json[DocumentFields.scheduleNumber] as String,
        impectionNumber: json[DocumentFields.impectionNumber] as String,
        policeNumber: json[DocumentFields.policeNumber] as String,
        vin: json[DocumentFields.vin] as String,
        engineNumber: json[DocumentFields.engineNumber] as String,
        bodyNumber: json[DocumentFields.bodyNumber] as String,
        model: json[DocumentFields.model] as String,
        jobType: json[DocumentFields.jobType] as String,
        houmeter: json[DocumentFields.houmeter] as String,
        kilometer: json[DocumentFields.kilometer] as String,
        priority: json[DocumentFields.priority] as String,
        customer: json[DocumentFields.customer] as String,
        foreman: json[DocumentFields.foreman] as String,
        startDate: DateTime.parse(json[DocumentFields.timeStartDate] as String),
        endDate: DateTime.parse(json[DocumentFields.timeEndDate] as String),
        remark: json[DocumentFields.remark] as String,
        status: json[DocumentFields.status] as String,
        createdTime: DateTime.parse(json[DocumentFields.time] as String),
      );

  // CHANGE
  Map<String, Object?> toJson() => {
        DocumentFields.id: id,
        DocumentFields.scheduleNumber: scheduleNumber,
        DocumentFields.impectionNumber: impectionNumber,
        DocumentFields.policeNumber: policeNumber,
        DocumentFields.vin: vin,
        DocumentFields.engineNumber: engineNumber,
        DocumentFields.bodyNumber: bodyNumber,
        DocumentFields.model: model,
        DocumentFields.jobType: jobType,
        DocumentFields.houmeter: houmeter,
        DocumentFields.kilometer: kilometer,
        DocumentFields.priority: priority,
        DocumentFields.customer: customer,
        DocumentFields.foreman: foreman,
        DocumentFields.timeStartDate: startDate!.toIso8601String(),
        DocumentFields.timeEndDate: endDate!.toIso8601String(),
        DocumentFields.remark: remark,
        DocumentFields.status: status,
        DocumentFields.time: createdTime!.toIso8601String(),
      };
}
