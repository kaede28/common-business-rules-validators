class CPF {

  static const List<int> _invalid = [ 11111111111,22222222222,33333333333,44444444444,55555555555,66666666666,77777777777,88888888888,99999999999 ];

  CPF(this._cpf) {

    _validate();

  }

  _validate() {

    if (! _has11Digits) {

      throw FormatException("must be 11 digits");      

    }

    if (! _containsNumericValuesOnly) {

      throw FormatException("must contain characters 0-9 only.");      

    }

     if (! _isValid) {

      throw FormatException("CPF $_cpf verification failed.");      

    }

  }

  String _cpf;

  bool get isValid =>
    _has11Digits && _containsNumericValuesOnly && _isValid;

  bool get _has11Digits =>
    _cpf != null && _cpf.length == 11;

  bool get _containsNumericValuesOnly {

    final RegExp validator = RegExp(r'[0-9]{11}');

    return validator.hasMatch(_cpf);

  }

  int _createVerificationDigit(List<int> digits) {

    int baseNumber = 0;

    for (var i = 0; i < digits.length; i++) {

      baseNumber += digits[i] * ((digits.length + 1) - i);

    }

    int verificationDigit = baseNumber * 10 % 11;

    return verificationDigit >= 10 ? 0 : verificationDigit;

}

  bool get _isValid {

    List<int> sanitizedCPF = _cpf

      .split('')
      .map((String digit) => int.parse(digit))
      .toList();

    return ! _invalid.contains(int.parse(sanitizedCPF.join())) &&

      sanitizedCPF[9] == _createVerificationDigit(sanitizedCPF.getRange(0, 9).toList()) &&
      sanitizedCPF[10] == _createVerificationDigit(sanitizedCPF.getRange(0, 10).toList());
  
  }

}

extension Cpf on String {

  bool get isCPF {

    CPF cpf;

    try {

      cpf = CPF(this);

    }

    on FormatException {

      return false;

    }

    return cpf.isValid;

  }

  String get asCPF {

    var token = this;

    if (! token.isCPF) {

      throw FormatException('$token is not a CPF');

    }

    return '${token.substring(0,3)}.${token.substring(3,6)}.${token.substring(6,9)}-${token.substring(9,11)}';

  }

}