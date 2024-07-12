// chore: Update API page to fetch and display a random quote

class Quote {
  final String text;
  final String author;

  const Quote({required this.text, required this.author});

  factory Quote.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'text': String text,
        'author': String author,
      } =>
        Quote(text: text, author: author),
      _ => throw const FormatException('Failed to load album'),
    };
  }
}
