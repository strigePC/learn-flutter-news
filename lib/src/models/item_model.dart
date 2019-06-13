class ItemModel {
  final int id;
  final bool deleted;
  final String type;
  final String by;
  final int time;
  final String text;
  final bool dead;
  final int parent;
  final List<dynamic> kids;
  final String url;
  final int score;
  final String title;
  final int descendants;

  ItemModel.fromJson(Map<String, dynamic> parsedJson)
      : id = parsedJson['id'],
        deleted = parsedJson['deleted'],
        type = parsedJson['id'],
        by = parsedJson['deleted'],
        time = parsedJson['type'],
        text = parsedJson['by'],
        dead = parsedJson['time'],
        parent = parsedJson['text'],
        kids = parsedJson['dead'],
        url = parsedJson['parent'],
        score = parsedJson['kids'],
        title = parsedJson['url'],
        descendants = parsedJson['score'];
}