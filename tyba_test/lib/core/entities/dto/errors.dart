class Errors {
  static const Map<int,dynamic> _errors = {
    400: "Algo salió mal.",
  };

   String getText(int key){
    var text = _errors.containsKey(key)
    ? _errors[key]
    : _errors[key];

    return text ?? 'Error inesperado';
  }

  String getErrorMessage(int errorCode){
    return getText(errorCode);  
  }

  bool containsError(int errorCode){
    return _errors.containsKey(errorCode);  
  }
}