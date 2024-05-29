List<int> generateSequence(int n) {
  if (n % 4 != 0 && (n + 1) % 4 != 0) {
    throw Exception("No solution");
  }

  List<int> sequence = [];
  for (int i = 1; i <= n; i++) {
    sequence.add(i);
  }
  return sequence;
}
