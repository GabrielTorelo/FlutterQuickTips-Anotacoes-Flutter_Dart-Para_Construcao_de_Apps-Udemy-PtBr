class Transaction {
  final String id; // Atributo final
  final String title; // Atributo final
  final double amount; // Atributo final
  final DateTime date; // Atributo final

  // Para definir um construtor como "const", todos os atributos devem ser "final"
  const Transaction({
    required this.id,
    required this.title,
    required this.amount,
    required this.date,
  });
}
