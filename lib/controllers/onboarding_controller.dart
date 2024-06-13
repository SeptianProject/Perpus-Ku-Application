class OnBoard {
  final String image, title, description;

  OnBoard({
    required this.image,
    required this.title,
    required this.description,
  });
}

final List<OnBoard> content = [
  OnBoard(
    image: "assets/onboarding1.png",
    title: "Selamat Datang di Aplikasi Perpus-Ku",
    description:
        "Temukan ragam buku-buku inspiratif dari berbagai genre, siap menyambut setiap langkah petualangan literasi Anda.",
  ),
  OnBoard(
    image: "assets/onboarding2.png",
    title: "Baca di Mana Saja dan Kapan Saja",
    description:
        "Dengan akses mudah ke koleksi buku digital kami, membaca menjadi lebih mudah dan nyaman dari sebelumnya, kapan pun Anda inginkan.",
  ),
  OnBoard(
    image: "assets/onboarding3.png",
    title: "Temukan Buku yang Anda Cari",
    description:
        "Temukan ragam buku-buku inspiratif dari berbagai genre, siap menyambut setiap langkah petualangan literasi Anda.",
  ),
];
