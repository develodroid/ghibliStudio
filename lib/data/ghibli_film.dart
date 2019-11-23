class Film {
  final String id;
  final String title;
  final String description;
  final String director;
  final String producer;
  final String releaseDate;
  final String rtScore;
  final List<dynamic> people;
  final List<dynamic> species;
  final List<dynamic> locations;
  final List<dynamic> vehicles;
  final String url;

  Film({this.id, this.title, this.description, this.director,
    this.producer, this.releaseDate, this.rtScore, this.people, this.species,
    this.locations, this.vehicles, this.url});

  factory Film.fromJson(Map<String, dynamic> json) {
    return  Film(
        id: json['id'],
        title: json['title'],
        description: json['description'],
        director: json['director'],
        producer: json['producer'],
        releaseDate: json['release_date'],
        rtScore: json['rt_score'],
        people: json['people'],
        species: json['species'],
        locations: json['locations'],
        vehicles: json['vehicles'],
        url: json['url']
    );
  }
}