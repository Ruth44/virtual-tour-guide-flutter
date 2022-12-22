import 'package:virtual_tour_guide_manager/util/validators/validators.dart';
import 'package:test/test.dart';

void main() {
  group('Testing email validation', () {
    test('Test empty invalid email', () {
      var invalidEmailValidationResult = Validators.validateEmail('');

      expect(invalidEmailValidationResult, 'Email is required! Can\'t be null');
    });

    test('Test empty invalid email', () {
      var invalidEmailValidationResult = Validators.validateEmail(null);

      expect(invalidEmailValidationResult, 'Email is required! Can\'t be null');
    });
    test('Test nonempty invalid email', () {
      var invalidEmailValidationResult = Validators.validateEmail('aa');

      expect(invalidEmailValidationResult, 'Invalid email address.');
    });
    test('Test nonempty valid email', () {
      var validEmailValidationResult =
          Validators.validateEmail('abc@gmail.com');

      expect(validEmailValidationResult, null);
    });
  });

  group('Testing password validation', () {
    test('Test empty invalid password', () {
      var invalidPasswordValidationResult = Validators.validatePassword('');

      expect(invalidPasswordValidationResult, 'Password is required!');
    });

    test('Test nonempty invalid password', () {
      var invalidPasswordValidationResult = Validators.validatePassword('aa');

      expect(invalidPasswordValidationResult,
          'Password must be at least 8 characters and contain a number, a  special character, a capital and a small letter.');
    });

    test('Test nonempty valid password', () {
      var validPasswordValidationResult =
          Validators.validatePassword('12345678Aa!');

      expect(validPasswordValidationResult, null);
    });
  });

  group('Testing name field validation', () {
    test('Test empty invalid name', () {
      var invalidNameValidationResult = Validators.validateName('');

      expect(invalidNameValidationResult, 'Name is required! Can\'t be null');
      // expect(invalidNameValidationResult, 'Name is required! Can\'t be null');
    });

    test('Test nonempty invalid name, with numbers', () {
      var invalidNameValidationResult = Validators.validateName('1234');

      expect(invalidNameValidationResult, 'Invalid name.');
    });
    test('Test valid name', () {
      var validNameValidationResult = Validators.validateName('Abebe');

      expect(validNameValidationResult, null);
    });
  });
}
