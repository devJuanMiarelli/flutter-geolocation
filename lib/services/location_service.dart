import 'package:geolocator/geolocator.dart';

/**
  Verificação de Serviço e Permissão: O código primeiro verifica se 
  o serviço de localização está habilitado e se o aplicativo tem as 
  permissões necessárias para acessar a localização.
  
  Obtenção da Localização: Se o serviço estiver habilitado e as permissões 
  concedidas, o código obtém a posição atual do usuário (latitude e longitude).
 */

class LocationService {
  Future<Position> getCurrentLocation() async {
    // Verifica se o serviço de localização está habilitado.
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw Exception('Geolocation service disabled.');
    }

    // Verifica se o aplicativo tem permissão para acessar a localização.
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw Exception('Geolocation permission denied.');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      throw Exception('Geolocation permissions permanently denied.');
    }
    // Retorna a posição atual do usuário.
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }
}
