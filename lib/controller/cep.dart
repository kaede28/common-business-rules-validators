import 'cnpj.dart';
import 'cpf.dart';

class CEP {

  CEP(this._cep) {

    _validate();

  }

  String _cep;

  _validate() {

    if (! _has8Digits) {

      throw FormatException('CEP should have exactly 8 digits');

    }

    else if (! _containsNumericValuesOnly) {

      throw FormatException('CEP should shave numeric values only');

    }

    else if (! _isWithinValidRange) {

      throw new FormatException('CEP should be within the following ranges: Acre: from 69900000 to 69999999,Alagoas: from 57000000 to 57999999,Amazonas: from 69000000 to 69299999 and from 69400000 to 69899999,Amapá: from 68900000 to 68999999,Bahia: from 40000000 to 48999999,Ceará: from 60000000 to 63999999,Distrito Federal: from 70000000 to 72799999 and from 73000000 to 73699999,Espírito Santo: from 29000000 to 29999999,Goiás: from 72800000 to 72999999 and from 73700000 to 76799999,Maranhão: from 65000000 to 65999999,Minas Gerais: from 30000000 to 39999999,Mato Grosso do Sul: from 79000000 to 79999999,Mato Grosso: from 78000000 to 78899999,Pará: from 66000000 to 68899999,Paraíba: from 58000000 to 58999999,Pernambuco: from 50000000 to 56999999,Piauí: from 64000000 to 64999999,Paraná: from 80000000 to 87999999,Rio de Janeiro: from 20000000 to 28999999,Rio Grande do Norte: from 59000000 to 59999999,Rondônia: from 76800000 to 76999999,Roraima: from 69300000 to 69399999,Rio Grande do Sul: from 90000000 to 99999999,Santa Catarina: from 88000000 to 89999999,Sergipe: from 49000000 to 49999999,São Paulo: from 01000000 to 19999999,Tocantins: from 77000000 to 77999999');

    }

  }

  bool get isValid =>
    _has8Digits && _containsNumericValuesOnly && _isWithinValidRange;

  bool get _has8Digits =>
    _cep != null && _cep.length == 8;

  bool get _containsNumericValuesOnly {

    final RegExp validator = RegExp(r'[0-9]{8}');

    return validator.hasMatch(_cep);

  }

  bool get _isWithinValidRange {

    final int cep = int.parse(_cep);

    return 

      cep >= 69900000 && cep <= 69999999 || // Acre(AC)
      cep >= 57000000 && cep <=	57999999 || // Alagoas(AL)
      cep >= 69000000 && cep <=	69299999 || // Amazonas(AM) 1
      cep >= 69400000 && cep <=	69899999 || // Amazonas(AM) 2
      cep >= 68900000 && cep <=	68999999 || // Amapá(AP)
      cep >= 40000000 && cep <=	48999999 || // Bahia(BA)
      cep >= 60000000 && cep <=	63999999 || // Ceará(CE)
      cep >= 70000000 && cep <=	72799999 || // Distrito Federal(DF) 1
      cep >= 73000000 && cep <=	73699999 || // Distrito Federal(DF) 2
      cep >= 29000000 && cep <=	29999999 || // Espírito Santo(ES)
      cep >= 72800000 && cep <=	72999999 || // Goiás(GO) 1
      cep >= 73700000 && cep <=	76799999 || // Goiás(GO) 2
      cep >= 65000000 && cep <=	65999999 || // Maranhão(MA)
      cep >= 30000000 && cep <=	39999999 || // Minas Gerais(MG)
      cep >= 79000000 && cep <=	79999999 || // Mato Grosso do Sul(MS)
      cep >= 78000000 && cep <=	78899999 || // Mato Grosso(MT)
      cep >= 66000000 && cep <=	68899999 || // Pará(PA)
      cep >= 58000000 && cep <=	58999999 || // Paraíba(PB)
      cep >= 50000000 && cep <=	56999999 || // Pernambuco(PE)
      cep >= 64000000 && cep <=	64999999 || // Piauí(PI)
      cep >= 80000000 && cep <=	87999999 || // Paraná(PR)
      cep >= 20000000 && cep <=	28999999 || // Rio de Janeiro(RJ)
      cep >= 59000000 && cep <=	59999999 || // Rio Grande do Norte(RN)
      cep >= 76800000 && cep <=	76999999 || // Rondônia(RO)
      cep >= 69300000 && cep <=	69399999 || // Roraima(RR)
      cep >= 90000000 && cep <=	99999999 || // Rio Grande do Sul(RS)
      cep >= 88000000 && cep <=	89999999 || // Santa Catarina(SC)
      cep >= 49000000 && cep <=	49999999 || // Sergipe(SE)
      cep >= 01000000 && cep <=	19999999 || // São Paulo(SP)
      cep >= 77000000 && cep <=	77999999;   // Tocantins(TO)
      
  }

}

extension Cep on String {

  bool get isCEP {

    CEP cep;

    try {

      cep = CEP(this);

    }

    on FormatException {

      return false;

    }

    return cep.isValid;

  }

  String get asCEP {

    var token = this;

    if (! token.isCEP) {

      throw FormatException('$token is not a CEP');

    }

    return '${token.substring(0,2)}.${token.substring(2,5)}-${token.substring(5,8)}';

  }

}