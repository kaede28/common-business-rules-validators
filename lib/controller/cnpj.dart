class CNPJ {

  CNPJ(this._cnpj) {

    _validate();

  }

  String format() =>
    '${_cnpj.substring(0,2)}.${_cnpj.substring(2,5)}.${_cnpj.substring(5,8)}/${_cnpj.substring(8,12)}-${_cnpj.substring(12,14)}';

  String _cnpj;

  _validate() {

    if (! _has14Digits) {

      throw FormatException("must be 14 digits");      

    }

    if (! _containsNumericValuesOnly) {

      throw FormatException("must contain characters 0-9 only.");      

    }

     if (! _isValid) {

      throw FormatException("CNPJ $_cnpj verification failed.");      

    }

  }

  bool get isValid =>
    _has14Digits && _containsNumericValuesOnly && _isValid;

  bool get _has14Digits =>
    _cnpj != null && _cnpj.length == 14;

  bool get _containsNumericValuesOnly {

    final RegExp validator = RegExp(r'[0-9]{14}');

    return validator.hasMatch(_cnpj);

  }

  int createVerificationDigit(List<int> digits) {
  
    int baseNumber = 0;

    List<int> firstBlock = digits.getRange(0, digits.length - 8).toList();
    List<int> secondBlock = digits.getRange(digits.length - 8, digits.length).toList();

    for (var digit = 0; digit < firstBlock.length; digit++) {

      baseNumber += firstBlock[digit] * ((firstBlock.length + 1) - digit);

    }

    for (var digit = 0; digit < secondBlock.length; digit++) {

      baseNumber += secondBlock[digit] * ((secondBlock.length + 1) - digit);

    }

    int verificationBase = baseNumber % 11;

    return verificationBase < 2 ? 0 : 11 - verificationBase;
  
  }

  bool get _isValid {

    List<int> sanitizedCNPJ = _cnpj

      .replaceAll(new RegExp(r'\.|-|\/'), '')
      .split('')
      .map((String digit) => int.parse(digit))
      .toList();
    
    return 

      sanitizedCNPJ[12] == createVerificationDigit(sanitizedCNPJ.getRange(0, 12).toList()) &&
      sanitizedCNPJ[13] == createVerificationDigit(sanitizedCNPJ.getRange(0, 13).toList());
  
  }

}

extension Cnpj on String {

  bool get isCNPJ {

    CNPJ cnpj;

    try {

      cnpj = CNPJ(this);

    }

    on FormatException {

      return false;

    }

    return cnpj.isValid;

  }

  String get asCNPJ {

    var token = this;

    if (! token.isCNPJ) {

      return null;

    }

    return '${token.substring(0,2)}.${token.substring(2,5)}.${token.substring(5,8)}/${token.substring(8,12)}-${token.substring(12,14)}';

  }

}
