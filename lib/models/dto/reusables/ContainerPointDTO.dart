import 'package:custom_bloc_state_management/models/dto/BaseDTO.dart';

class ContainerPointDTO implements BaseDTO {
  ContainerPointDTO({required this.id, required this.token});

  final String token;
  final int id;
}
