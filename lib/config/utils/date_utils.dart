import 'package:intl/intl.dart';

class AppDateUtils {
  static String formatDate(String? timestamp) {
    if (timestamp == null) return 'Fecha no disponible';

    try {
      final date = DateTime.fromMillisecondsSinceEpoch(int.parse(timestamp));
      final now = DateTime.now();
      final today = DateTime(now.year, now.month, now.day);
      final tomorrow = today.add(const Duration(days: 1));
      final yesterday = today.subtract(const Duration(days: 1));

      if (date.isAtSameMomentAs(today)) {
        return 'Hoy';
      } else if (date.isAtSameMomentAs(tomorrow)) {
        return 'Mañana';
      } else if (date.isAtSameMomentAs(yesterday)) {
        return 'Ayer';
      } else {
        return DateFormat('EEEE, d MMMM yyyy', 'es').format(date);
      }
    } catch (e) {
      return 'Fecha inválida';
    }
  }

  static String formatDateTime(String? timestamp) {
    if (timestamp == null) return 'Fecha no disponible';

    try {
      final date = DateTime.fromMillisecondsSinceEpoch(int.parse(timestamp));
      return DateFormat('EEEE, d MMMM yyyy HH:mm', 'es').format(date);
    } catch (e) {
      return 'Fecha inválida';
    }
  }

  static String formatTime(String? timestamp) {
    if (timestamp == null) return 'Hora no disponible';

    try {
      final date = DateTime.fromMillisecondsSinceEpoch(int.parse(timestamp));

      // Si los minutos son 0, mostrar solo la hora
      if (date.minute == 0) {
        return DateFormat('h a', 'es').format(date);
      }

      // Si no, mostrar hora y minutos
      return DateFormat('h:mm a', 'es').format(date);
    } catch (e) {
      return timestamp;
    }
  }

  static bool isToday(String? timestamp) {
    if (timestamp == null) return false;

    try {
      final date = DateTime.fromMillisecondsSinceEpoch(int.parse(timestamp));
      final now = DateTime.now();
      return date.year == now.year &&
          date.month == now.month &&
          date.day == now.day;
    } catch (e) {
      return false;
    }
  }
}
