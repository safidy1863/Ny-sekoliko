import '/core/data/remote/dto/response_dto.dart';

class LoginSuccessDto extends ResponseDto {
  final Map<String, dynamic> user;
  final String token;

  LoginSuccessDto({
    required super.status,
    required this.user,
    required this.token,
});
}