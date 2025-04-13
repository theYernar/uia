import 'apartment_data.dart';

class BookingData extends ApartmentData {
  final DateTime? checkInDate;
  final DateTime? checkOutDate;
  final int bookingNumber;
  

  BookingData({
      required super.imageUrl,
      required super.title,
      required super.description,
      required super.comment,
      required super.address,
      required super.rating,
      required super.price,
      required super.city,
      required this.checkInDate,
      required this.checkOutDate,
      required this.bookingNumber,
    });
}

List<BookingData> bookingApartmentData = [];
