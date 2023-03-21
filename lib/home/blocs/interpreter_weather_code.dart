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
        return 'Tempestade';
      default:
        return ' ';

    }
  }

  static String getImgNameWeather(int weathercode){
    switch (weathercode){
      case 0:
      case 1:
        return 'sunny.png';
      case 2:
        return 'partlycloudy.png';
      case 3:
        return 'overcast.png';
      case 45:
      case 48:
        return 'overcast.png';
      case 51:
      case 53:
      case 56:
        return 'cludy.png';
      case 55:
      case 57:
      case 61:
        return 'cludy.png';
      case 63:
        return 'rain.png';
      case 65:
      case 80:
        return 'rain.png';
      case 71:
      case 73:
      case 75:
      case 77:
      case 85:
      case 86:
        return 'overcast.png';
      case 81:
      case 82:
        return 'rain.png';
      default:
        return ' ';
    }
  }
}