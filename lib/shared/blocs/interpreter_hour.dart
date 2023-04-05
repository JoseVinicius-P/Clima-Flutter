class InterpreterHour{
  static bool isNight(int hour){
    if((hour >= 19 && hour <= 23) || (hour >= 00 && hour <= 5)){
      return true;
    }else{
      return false;
    }
  }
}