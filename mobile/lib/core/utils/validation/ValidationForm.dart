import 'package:form_validator/form_validator.dart';

class ValidationForm extends FormValidatorLocale {
  @override
  String email(String v) => 'Email invalide';

  @override
  String ip(String v) => 'Adresse IP invalide';

  @override
  String ipv6(String v) => 'Invalide IPv6';

  @override
  String maxLength(String v, int n) => 'La longueur du texte ne doit pas dépasser de $n caractères';

  @override
  String minLength(String v, int n) => 'Le champ doit contenir au moins $n caractères';

  @override
  String name() => 'Nom invalide';

  @override
  String phoneNumber(String v) => 'Numéro de téléphone invalide';

  @override
  String required() => 'Le champ ne doit pas être vide';

  @override
  String url(String v) => 'Le lien que vous avez saisi est invalide';

}