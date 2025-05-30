import 'package:cloud_firestore/cloud_firestore.dart';


class BookingModel {
  final String userId;
  final String barberId;
  final int duration;
  final String paymentMethod;
  final DateTime createdAt;
  final DateTime date;
  final Map<String, double> serviceType;
  final List<DateTime> slotTime;
  final double amountPaid;
  final String status;
  final String serviceStatus;
  final String? bookingId;
  final double? refund;
  final String otp;
  final String transaction;
  final String invoiceId;
  final String slotDate;
  final List<String> slotId;
  

  BookingModel({
    this.bookingId,
    this.refund,
    required this.serviceStatus, 
    required this.userId,
    required this.barberId,
    required this.duration,
    required this.paymentMethod,
    required this.createdAt,
    required this.serviceType,
    required this.slotTime,
    required this.amountPaid,
    required this.status,
    required this.otp,
    required this.transaction,
    required this.invoiceId,
    required this.slotId,
    required this.slotDate,
    required this.date
  });

  factory BookingModel.fromMap(String bookingId, Map<String, dynamic> map) {
    return BookingModel(
      refund: (map['refund'] as num?)?.toDouble() ?? 0.0,
      bookingId: bookingId,
      invoiceId: map['invoice_id'] as String? ?? '',
      serviceStatus: map['service_status'] as String? ?? 'Pending',
      userId: map['userId'] as String? ?? '',
      barberId: map['barberId'] as String? ?? '',
      duration: map['duration'] is int ? map['duration'] : int.tryParse(map['duration'].toString()) ?? 0,
      paymentMethod: map['paymentMethod'] as String? ?? '',
      createdAt: (map['createdAt'] as Timestamp?)?.toDate() ?? DateTime.now(),
      date: (map['date'] as Timestamp?)?.toDate() ?? DateTime.now(),
      serviceType: (map['serviceType'] as Map?)?.map( (key, value) => MapEntry(key.toString(), (value is num) ? value.toDouble() : 0.0) ) ?? {},
      slotTime: (map['slotTime'] as List<dynamic>?)
              ?.map((ts) => (ts is Timestamp) ? ts.toDate() : DateTime.now())
              .toList() ??
          [],
      slotId: (map['slot_id'] as List<dynamic>?)
              ?.map((id) => id.toString())
              .toList() ??
      [],
      slotDate: map['slotDate'] as String? ?? '',
      amountPaid: (map['amountPaid'] as num?)?.toDouble() ?? 0.0,
      status: map['status'] as String? ?? 'Pending',
      otp: map['otp'] as String? ?? '',
      transaction: map['transaction'] as String? ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'date':date,
      'refund':refund,
      'invoice_id': invoiceId,
      'userId': userId,
      'barberId': barberId,
      'duration': duration,
      'paymentMethod': paymentMethod,
      'createdAt': Timestamp.fromDate(createdAt),
      'serviceType': serviceType,
      'slotTime': slotTime.map((dt) => Timestamp.fromDate(dt)).toList(),
      'slot_id': slotId,
      'slotDate':slotDate,
      'amountPaid': amountPaid,
      'status': status,
      'otp': otp,
      'transaction': transaction,
      'service_status': serviceStatus,
    };
  }
}