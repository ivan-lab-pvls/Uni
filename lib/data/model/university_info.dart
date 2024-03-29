class UniversityInfo {
  String name;
  String address;
  String description;
  int rating;
  List<String> pros;
  List<String> cons;
  List<Specialty> specialties;
  String cost;
  String duration;

  UniversityInfo({
    required this.name,
    required this.address,
    required this.description,
    this.rating = 0,
    this.pros = const [],
    this.cons = const [],
    this.specialties = const [],
    this.cost = '',
    this.duration = '',
  });

  Map<String, dynamic> toJson() => {
        'name': name,
        'address': address,
        'description': description,
        'rating': rating,
        'pros': pros,
        'cons': cons,
        'cost': cost,
        'duration': duration,
        'specialties': specialties.map((s) => s.toJson()).toList(),
      };

  factory UniversityInfo.fromJson(Map<String, dynamic> json) => UniversityInfo(
        name: json['name'],
        address: json['address'],
        description: json['description'],
        rating: json['rating'],
        pros: List<String>.from(json['pros']),
        cons: List<String>.from(json['cons']),
        cost: json['cost'],
        duration: json['duration'],
        specialties: (json['specialties'] as List)
            .map((s) => Specialty.fromJson(s))
            .toList(),
      );
}

class Specialty {
  String name;
  int priority;

  Specialty({required this.name, this.priority = 0});

  Map<String, dynamic> toJson() => {
        'name': name,
        'priority': priority,
      };

  factory Specialty.fromJson(Map<String, dynamic> json) => Specialty(
        name: json['name'],
        priority: json['priority'],
      );
}
