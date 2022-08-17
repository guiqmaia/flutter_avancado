import 'package:intl/intl.dart';

String dateFormater(String releaseDate) {
  DateTime? dateTime = DateTime.tryParse(releaseDate);
  return dateTime != null ? DateFormat("dd 'de' MMM 'de' yyyy", 'pt_Br').format(dateTime) : 'Data desconhecida';
}
