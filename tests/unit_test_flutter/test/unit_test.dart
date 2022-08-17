

import 'package:flutter_test/flutter_test.dart';

import 'change_counter.dart';
import 'person_class.dart';

void main() {
  ChangeCounter changeCounter = ChangeCounter();

  late Person person;
  setUp(() {
    changeCounter.counter = 2;
    changeCounter.increment();

    person = Person(
      idade: 25,
      nome: 'Guilherme',
    );
  });

  group('Testing Person class', () {
    test('Testing name and age', () {
      expect(person.idade, equals(25));
      expect(person.nome, equals('Guilherme'));
    });

    test('Testing yearsToRetirement method', () {
      expect(person.yearsToRetirement(), equals(37));
    });

    test('Testing changeNameMethod', () {
      person.changeName('Júlia');
      expect(person.nome, equals('Júlia'));
    });

    test('Testing changeIdade method', () {
      person.changeIdade(17);
      expect(person.idade, equals(17));
    });
  });


  group('Testing ChangeCounter class', () {
    test('Testing ChangeCounter initial value', () {
      expect(changeCounter.counter, equals(3));
    },);

    test('Testing ChangeCounter increment method', () {
      changeCounter.increment();

      expect(changeCounter.counter, equals(4));
    });

    test('Testing ChangeCounter decrement method', () {
      changeCounter.decrement();

      expect(changeCounter.counter, lessThanOrEqualTo(3));
    });
  });
}
