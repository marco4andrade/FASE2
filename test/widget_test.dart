import 'package:flutter_test/flutter_test.dart';

import 'package:step2/main.dart';

void main() {
  testWidgets('App loads without errors', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    
    expect(find.text('Fase 2 Store API'), findsOneWidget);
    expect(find.text('Imprimir Productos en Consola'), findsOneWidget);
    expect(find.text('Imprimir Categorías en Consola'), findsOneWidget);
    expect(find.text('Imprimir Usuarios en Consola'), findsOneWidget);
  });
}
