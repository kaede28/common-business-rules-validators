import 'package:test/test.dart';
import 'package:validators/controller.dart';

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

            test("${stub.isEmpty ? 'empty' : stub} is valid", () async {

                expect(CEP(stub).isValid,true);

            });

        }

        for (String stub in invalidCEPs) {

            test("$stub is invalid", () async {

                expect(() => CEP(stub), throwsFormatException, reason: 'Invalid postal code');

            });

        }

        test("13604186 formats to 13.604-186", () async {

            expect('13.604-186', '13604186'.asCEP, reason: 'Invalid CEP format string');

        });

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

            test("${stub.isEmpty ? 'empty' : stub} is valid", () async {

                expect(CNPJ(stub).isValid,true);

            });

        }

        for (String stub in invalidCNPJs) {

            test("$stub is invalid", () async {

                expect(() => CNPJ(stub), throwsFormatException, reason: 'Invalid CNPJ');

            });

        }

        test("formatter", () async {

            expect('08.342.124/0001-67', '08342124000167'.asCNPJ, reason: 'Invalid CNPJ format string');

        });

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

            test("${stub.isEmpty ? 'empty' : stub} is valid", () async {

                expect(CPF(stub).isValid,true);

            });

        }

        for (String stub in invalidCPFs) {

            test("$stub is invalid", () async {

                expect(() => CPF(stub), throwsFormatException, reason: 'Invalid CPF');

            });

        }

        test("31392975808 formats to 313.929.758-08", () async {

            expect('313.929.758-08', '31392975808'.asCPF, reason: 'Invalid CPF format string');

        });

    });

}