class InterpreterWeatherCode{
  static String getDescriptionWeather(int weathercode){
    switch (weathercode){
      case 0:
      case 1:
        return 'Céu limpo';
      case 2:
        return 'Pouco Nublado';
      case 3:
        return 'Nublado';
      case 45:
      case 48:
        return 'Neblina';
      case 51:
      case 53:
      case 56:
        return 'Chuvisco';
      case 55:
      case 57:
      case 61:
        return 'Garoa';
      case 63:
        return 'Chuva';
      case 65:
      case 80:
        return 'Pancadas de Chuva';
      case 71:
      case 73:
      case 75:
      case 77:
      case 85:
      case 86:
        return 'Neve';
      case 81:
      case 82:
      case 95:
      case 96:
      case 99:
        return 'Tempestade';
      default:
        return 'Céu limpo';

    }
  }

  static String getImgNameWeather(int weathercode, bool isNight){
    switch (weathercode){
      case 0:
      case 1:
        if(isNight){
          return 'clean_night.png';
        }else{
          return 'clean.png';
        }
      case 2:
        if(isNight){
          return 'partlycloudy_night.png';
        }else{
          return 'partlycloudy.png';
        }
      case 3:
        return 'overcast.png';
      case 45:
      case 48:
        return 'overcast.png';
      case 51:
      case 53:
      case 55:
      case 56:
      case 57:
      case 61:
        if(isNight){
          return 'cludy_night.png';
        }else{
          return 'cludy.png';
        }
      case 71:
      case 73:
      case 75:
      case 77:
      case 85:
      case 86:
        return 'snow.png';
      case 63:
      case 65:
      case 80:
      case 81:
        return 'rain.png';
      case 82:
      case 95:
      case 96:
      case 99:
        return 'thunderstorm.png';
      default:
        return 'sunny.png';
    }
  }
}