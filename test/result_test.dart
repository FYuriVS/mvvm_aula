import 'package:flutter_test/flutter_test.dart';
import 'package:mvvm/core/result/result.dart';

void main() {
  group(
    'Should test Ok result',
    () {
      test(
        "Should crete a Ok result",
        () {
          final result = Result.ok("Ok");
          expect(result.asOk.value, "Ok");
        },
      );
      test(
        "Should crete a Error result",
        () {
          final result = Result.error(Exception("Ocorreu um erro..."));
          expect(result.asError.error, isA<Exception>());
        },
      );
      test(
        "Should crete a Ok result with extension",
        () {
          final result = "Ok".ok();
          expect(result.asOk.value, "Ok");
        },
      );
      test(
        "Should crete a Error result with extension",
        () {
          final result = Exception("Ocorreu um erro...").error();
          expect(result.asError.error, isA<Exception>());
        },
      );
    },
  );
}
