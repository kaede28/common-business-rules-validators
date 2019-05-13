import 'package:common_business_rules_validators/controller.dart';

import 'package:test/test.dart';

void main() {

  group('CEP', () {

    const List<String> validCEPs = [
      
      '13604186',
      '01000000',
      '99999999'
    
    ];
    
    const List<String> invalidCEPs = [
      
      '13604-186',
      '13.604-186',
      '13.604186',
      '13604',
      '',
      null,
      '1000000',
      '00000000'
      
    ];      

    for (String stub in validCEPs) {

      test("CEP ${stub.isEmpty ? 'empty' : stub} is valid", () async {
        
        expect(CEP(stub).isValid,true);

      });

    }
    
    for (String stub in invalidCEPs) {

      test("CEP $stub is invalid", () async {
        
        expect(() => CEP(stub), throwsFormatException, reason: 'Invalid postal code');

      });
      
    }

  });

  group('CNPJ', () {

    const List<String> validCNPJs = [
      
      '08342124000167',
      
    ];
    
    const List<String> invalidCNPJs = [
      
      '08342124000168',
      '08.342.124/0001-67',      
      '',
      null,
      
    ];      

    for (String stub in validCNPJs) {

     test("CNPJ ${stub.isEmpty ? 'empty' : stub} is valid", () async {
        
        expect(CNPJ(stub).isValid,true);

      });

    }
    
    for (String stub in invalidCNPJs) {

      test("CNPJ $stub is invalid", () async {
        
        expect(() => CNPJ(stub), throwsFormatException, reason: 'Invalid CNPJ');

      });
      
    }

  });

  group('CPF', () {

    const List<String> validCPFs = [
      
      '31392975808',
      
    ];
    
    const List<String> invalidCPFs = [
      
      '31392975807',
      '313.929.758-08',      
      '',
      null,
      
    ];      

    for (String stub in validCPFs) {

      test("CPF ${stub.isEmpty ? 'empty' : stub} is valid", () async {
        
        expect(CPF(stub).isValid,true);

      });

    }
    
    for (String stub in invalidCPFs) {

      test("CPF $stub is invalid", () async {
        
        expect(() => CPF(stub), throwsFormatException, reason: 'Invalid CPF');
        
      });
      
    }

  });

}