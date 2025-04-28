class Profile {
  final String id;
  final String name;
  final String? phone;
  final bool isServiceProvider;
  final String? avatarUrl;
  final String? bio;
  final List<String>? services;
  final String? location;
  final DateTime createdAt;

  Profile({
    required this.id,
    required this.name,
    this.phone,
    required this.isServiceProvider,
    this.avatarUrl,
    this.bio,
    this.services,
    this.location,
    required this.createdAt,
  });

  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
      id: json['id'],
      name: json['name'],
      phone: json['phone'],
      isServiceProvider: json['is_service_provider'] ?? false,
      avatarUrl: json['avatar_url'],
      bio: json['bio'],
      services: json['services'] != null 
        ? List<String>.from(json['services']) 
        : null,
      location: json['location'],
      createdAt: DateTime.parse(json['created_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'phone': phone,
      'is_service_provider': isServiceProvider,
      'avatar_url': avatarUrl,
      'bio': bio,
      'services': services,
      'location': location,
      'created_at': createdAt.toIso8601String(),
    };
  }
}