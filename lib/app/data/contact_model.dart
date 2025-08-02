class Contact {
  final String title;
  final String subtitle;
  final String? url;
  final String icon;
  Contact({
    required this.title,
    required this.subtitle,
    this.url,
    required this.icon,
  });

  factory Contact.fromJson(Map<String, dynamic> json) {
    return Contact(
      title: json['title'],
      subtitle: json['subtitle'],
      url: json['url'],
      icon: json['icon'],
    );
  }
}
