void main() {
  List<int> a = [1, 2, 3];
  a.add(4);
  a.add(5);
  a.add(6);

  // cascade operator!
  a..add(7)..add(8)..add(9);

  print(a); // [1, 2, 3, 4, 5, 6, 7, 8, 9]
}
