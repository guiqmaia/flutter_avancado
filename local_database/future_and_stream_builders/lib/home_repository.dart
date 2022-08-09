class HomeRepository {
  Future<List<String>> getAllNames() async {
    await Future.delayed(const Duration(seconds: 2));
    return ['Ailton', 'Guilherme', 'Júlia', 'Teste'];
  }

  Stream<int> timedCounter(Duration interval, [int? maxCount]) async* {
    int index = 0;
    while (index != maxCount) {
      await Future.delayed(interval);
      yield index++;
    }
  }
}
