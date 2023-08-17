class Article {
  final String title;
  final String image;
  final String location;
  final String author;
  final int likes;
  final int comments;
  final int shares;
  bool isLiked = false;

  Article(this.title, this.image, this.comments, this.likes, this.isLiked,
      this.location, this.shares, this.author);
}

List<Article> articles = [
  Article(
      'Japan\'s second largest metropolitan area',
      'https://images.asiahighlights.com/allpicture/2018/09/4ece33d8850f4fdd9a020ffd_cut_600x800_315.jpg',
      100,
      32000,
      true,
      'Osaka Japan',
      50,
      'Hussain Mustafa'),
  Article(
      'Known as the sleepless town for obvious reasons',
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSECGh7qBKYuS7evPlNrZX_ymcuiTcDMYGs9DskMf-zhvauuUAKLg9lL0vKPjvSBxs_aiQ&usqp=CAU',
      300,
      50000,
      true,
      'Kabuikicho Japan',
      1250,
      'Tim Salvatore'),
  Article(
      'Japan\'s second largest metropolitan area',
      'https://www.travelandleisure.com/thmb/VscfMXHNO6uBpaX2cuIW1q2ZtA8=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/tokyo-japan-TOKYOTG0621-52012ff551dc46c4a87ac8e3151307a4.jpg',
      200,
      10000,
      true,
      'Tokyo Japan',
      1000,
      'Ely Marya'),
];
