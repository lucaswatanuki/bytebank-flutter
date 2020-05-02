class Transferencia {
  final int id;
  final double valor;
  final int numeroConta;

  Transferencia(
    this.id,
    this.numeroConta,
    this.valor,
  );

  @override
  String toString() {
    return 'Transferencia{id: $id, valor: $valor, numeroConta: $numeroConta}';
  }
}
