import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:uia/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Тест кнопки Войти на экране онбординга', (WidgetTester tester) async {
    app.main(); // Запуск приложения
    await tester.pumpAndSettle(); // Ждём полной отрисовки

    // Ищем кнопку по ключу
    final loginButton = find.byKey(const ValueKey('login_button'));

    // Проверяем, что кнопка есть
    expect(loginButton, findsOneWidget);

    // Нажимаем на кнопку
    await tester.tap(loginButton);
    await tester.pumpAndSettle(); // Ждём переход

    // Здесь можно проверить, что открылся нужный экран
    // expect(find.byType(EnterPhoneNumberScreen), findsOneWidget);
  });
}
