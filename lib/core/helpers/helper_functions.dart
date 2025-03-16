import 'dart:ui';

import 'package:intl/intl.dart';

String formatDate(String? dateString) {
  if (dateString == null || dateString.isEmpty) return "Unknown";

  DateTime parsedDate = DateTime.parse(dateString);
  return DateFormat("MMMM d, yyyy").format(parsedDate);
}

const Color genreAction = Color(0xFF15D2BC);
const Color genreThriller = Color(0xFFE26CA5);
const Color genreSciFi = Color(0xFF564CA3);
const Color genreFiction = Color(0xFFCD9D0F);
const Color genreDefault = Color(0xFF757575);

Map<String, Color> genreColors = {
  "Action": genreAction,
  "Thriller": genreThriller,
  "Science Fiction": genreSciFi,
  "Fiction": genreFiction,
};

Map<int, String> genreNames = {
  28: "Action",
  53: "Thriller",
  878: "Science Fiction",
  10765: "Fiction",
};
Color getGenreColor(int genreId) {
  String genreName = genreNames[genreId] ?? "Unknown";
  return genreColors[genreName] ?? genreDefault;
}

