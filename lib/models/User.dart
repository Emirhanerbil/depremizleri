class User {
  final String id;
  final String name;
  final String surname;
  final String title;
  final String content;
  int likes;
  bool isliked;
  final List<String> comments;

  User(this.id, this.name, this.surname, this.title, this.content,
      this.comments, this.likes, this.isliked);
}
