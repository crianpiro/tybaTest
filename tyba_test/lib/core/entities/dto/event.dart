
import 'package:tyba_test/core/entities/dto/payload_event.dart';

class Event<T> {
  String status;
  int statusCode;
  String message;
  PayloadEvent<T>? payload;
  
  Event(
    this.status,
    this.statusCode,
    this.message,
    this.payload,
  );

  factory Event.fromJson(List<dynamic> json) => Event(
        "200",
        200,
        "Successful transaction",
        PayloadEvent.fromJson(json),
      );
}