final String tableBuildings = 'Buildings';

class BuildingFields {
  static final List<String> values = [
    id, title, latitude, longtitude,description
  ];

  static final String id = '_id';
  static final String title = 'title';
  static final String latitude = 'latitude';
  static final String longtitude = 'longtitude';
  static final String description = 'description';
}

class Building {
  final int? id;

   String? title;
   double? latitude;
   double? longtitude;
   String? description;

  Building({
    required this.id,
    this.title,
    this.latitude,
    this.longtitude,
    this.description
  });

  Building copy({
    int? id,
    String? title,
    double? latitude,
    double? longtitude,
    String? description
  }) =>
      Building(
        id: id ?? this.id,
        title: title ?? this.title,
        latitude: latitude ?? this.latitude,
        longtitude: longtitude ?? this.longtitude,
        description : description??this.description
      );

  static Building fromJson(Map<String, Object?> json) => Building(
        id: json[BuildingFields.id] as int?,
        title: json[BuildingFields.title] as String,
        latitude: json[BuildingFields.latitude] as double,
        longtitude: json[BuildingFields.longtitude] as double,
        description : json[BuildingFields.description] as String,
      );

  Map<String, Object?> toJson() => {
        BuildingFields.id: id,
        BuildingFields.title: title,
        BuildingFields.latitude: latitude,
        BuildingFields.longtitude: longtitude,
        BuildingFields.description: description,
      };
}