class TimeModel {
  final int hours, minutes;

  TimeModel({required this.hours, required this.minutes});

  TimeModel.fromJson(Map<String, dynamic> json)
      : hours = json['hours'],
        minutes = json['minutes'];

  @override
  String toString() {
    return '${_formatTwoDigit(hours)}:${_formatTwoDigit(minutes)}';
  }

  String _formatTwoDigit(int number) {
    return number.toString().padLeft(2, '0');
  }
}
