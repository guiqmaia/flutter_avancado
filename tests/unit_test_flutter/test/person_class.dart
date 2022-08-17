class Person {
  String nome;
  int idade;
  Person({
    required this.nome,
    required this.idade,
  });

  int yearsToRetirement() {
    return 62 - idade;
  }

  void changeName(String name) {
    nome = name;
  }

  void changeIdade(int newAge) {
    idade = newAge;
  }
}
