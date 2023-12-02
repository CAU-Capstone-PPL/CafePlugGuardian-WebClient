class DateModel {
  final int year, month, day;

  DateModel({required this.year, required this.month, required this.day});

  DateModel.fromJson(Map<String, dynamic> json)
      : year = json['year'],
        month = json['month'],
        day = json['day'];

  @override
  String toString() {
    return '$year-${_formatTwoDigit(month)}-${_formatTwoDigit(day)}';
  }

  String _formatTwoDigit(int number) {
    return number.toString().padLeft(2, '0');
  }
}
