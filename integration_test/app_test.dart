import 'package:uia/screens/main_screens/booking/screens/extend_booking/extend_booking.dart';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:uia/main.dart' as app;
void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Тест', (WidgetTester tester) async {
    app.main();
    await tester.pumpAndSettle();

    await Future.delayed(const Duration(seconds: 2));

    final loginButton = find.byKey(const ValueKey('login_button'));
    await tester.tap(loginButton);
    await tester.pumpAndSettle();

    final phoneField = find.byKey(const ValueKey('phone_field'));
    await tester.enterText(phoneField, '7077070707');
    await tester.pumpAndSettle();

    final sendSmsButton = find.byKey(const ValueKey('send_sms_button'));
    await tester.tap(sendSmsButton);
    await tester.pumpAndSettle();

    final nameField = find.byKey(const ValueKey('name_field'));
    await tester.enterText(nameField, 'yernar');
    await tester.pumpAndSettle();

    final registrationButton = find.byKey(const ValueKey('registration_button'));
    await tester.tap(registrationButton);
    await tester.pumpAndSettle();
    
    
    final reservetionButton = find.byKey(const ValueKey('reservetion_button'));
    await tester.tap(reservetionButton.first);
    await tester.pumpAndSettle();

    final apartmentReservetion = find.byKey(const ValueKey('booking_button'));
    await tester.tap(apartmentReservetion);
    await tester.pumpAndSettle();

    final payButton = find.byKey(const ValueKey('pay_button'));
    await tester.tap(payButton);
    await tester.pumpAndSettle();

    final myBookingButton = find.byKey(const ValueKey('my_booking_button'));
    await tester.tap(myBookingButton);
    await tester.pumpAndSettle();

    final bookingDetailsButton = find.byKey(const ValueKey('booking_details_button'));
    await tester.tap(bookingDetailsButton);
    await tester.pumpAndSettle();

    final extendBooking = find.byKey(const ValueKey('extend_booking_button'));
    await tester.tap(extendBooking);
    await tester.pumpAndSettle();

    customDatePicker = (context) async => DateTime(2025, 4, 15);

    final checkInDateButton = find.byKey(const ValueKey('check_in_date_button'));
    await tester.tap(checkInDateButton);
    await tester.pumpAndSettle();

    final saveBookingButton = find.byKey(const ValueKey('save_button'));
    await tester.tap(saveBookingButton);
    await tester.pumpAndSettle();

    final profile = find.byKey(const ValueKey('profile'));
    await tester.tap(profile);
    await tester.pumpAndSettle();

    final edit = find.byKey(const ValueKey('edit'));
    await tester.tap(edit);
    await tester.pumpAndSettle();

    final nameEditField = find.byKey(const ValueKey('name_field'));
    await tester.enterText(nameEditField, 'Ернар Алмасулы');
    await tester.pumpAndSettle();

    final editSave = find.byKey(const ValueKey('edit_save_button'));
    await tester.tap(editSave);
    await tester.pumpAndSettle();


    await Future.delayed(const Duration(seconds: 10));

  });
  
}
