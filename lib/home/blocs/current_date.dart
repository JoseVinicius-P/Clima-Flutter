class CurrentDate{

  String getCurrentDateFormatted(){
    var currentDate = DateTime.now();
    return '${getStringWeekDay(currentDate.weekday)}, ${currentDate.day} ${getStringMonth(currentDate.month)}';
  }

  String getStringWeekDay(int weekDay){
    var weekdayString = '';
    switch (weekDay){
      case 1:
        weekdayString = 'Seg';
        break;
      case 2:
        weekdayString = 'Ter';
        break;
      case 3:
        weekdayString = 'Qua';
        break;
      case 4:
        weekdayString = 'Qui';
        break;
      case 5:
        weekdayString = 'Sex';
        break;
      case 6:
        weekdayString = 'Sab';
        break;
      case 7:
        weekdayString = 'Dom';
        break;
    }

    return weekdayString;
  }

  String getStringMonth(int month){
    var monthString = '';
    switch (month){
      case 1:
        monthString = 'jan';
        break;
      case 2:
        monthString = 'fev';
        break;
      case 3:
        monthString = 'mar';
        break;
      case 4:
        monthString = 'abr';
        break;
      case 5:
        monthString = 'mai';
        break;
      case 6:
        monthString = 'jun';
        break;
      case 7:
        monthString = 'jul';
        break;
      case 8:
        monthString = 'ago';
        break;
      case 9:
        monthString = 'set';
        break;
      case 10:
        monthString = 'out';
        break;
      case 11:
        monthString = 'nov';
        break;
      case 12:
        monthString = 'dez';
        break;
    }

    return monthString;
  }
}