class Api_data {
  Info? info;
  List<Results> results = [];

  Api_data({this.info, this.results = const []});
  factory Api_data.fromjson(Map<String, dynamic> jsonData) {
    return Api_data(
        results: jsonData['results'] != null
            ? Results.datafromapi(jsonData['results'])
            : [],
        info:
            jsonData['info'] != null ? Info.fromjson(jsonData['info']) : null);
  }
}

class Results {
  String gender = '';
  Name? name;
  Location? location;
  String email = '';
  Results({
    this.location,
    this.email = '',
    this.gender = '',
    this.name,
  });
  factory Results.fromjson(Map<String, dynamic> jsonData) {
    return Results(
        email: jsonData['email'],
        gender: jsonData['gender'],
        // location: jsonData['location'],
        name:
            jsonData['name'] != null ? Name.fromjson(jsonData['name']) : null);
  }

  static List<Results> datafromapi(List results) {
    List<Results> listdata = [];
    for (int i = 0; i < results.length; i++) {
      listdata.add(Results.fromjson(results[i]));
    }
    return listdata;
  }
}

class Location {
  Street? street;
  String city = '';
  String state = '';
  String country = '';
  int postcode = 0;
}

class Street {
  int number = 0;
  String name = '';
  Street({this.name = '', this.number = 0});
}

class Name {
  String title = '';
  String first = '';
  String last = '';
  Name({this.title = '', this.first = '', this.last = ''});
  factory Name.fromjson(Map<String, dynamic> jesonData) {
    return Name(
        title: jesonData['title'],
        first: jesonData["first"],
        last: jesonData['last']);
  }
}

class Info {
  String seed = '';
  int results = 0;
  int page = 0;
  String version = '';

  Info({this.seed = '', this.version = '', this.results = 0, this.page = 0});

  factory Info.fromjson(Map<String, dynamic> jsonData) {
    return Info(seed: jsonData['seed']);
  }
}
