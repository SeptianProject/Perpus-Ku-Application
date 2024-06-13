// ignore_for_file: public_member_api_docs, sort_constructors_first
class Book {
  final String id;
  final String name;
  final String tglPinjam;
  final String tglKembali;

  Book({
    required this.id,
    required this.name,
    required this.tglPinjam,
    required this.tglKembali,
  });
  @override
  String toString() {
    return "id=$id";
  }
}
