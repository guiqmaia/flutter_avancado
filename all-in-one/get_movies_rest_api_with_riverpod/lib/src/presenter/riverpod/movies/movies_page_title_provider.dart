import 'package:hooks_riverpod/hooks_riverpod.dart';

final moviesPageTitleProvider = StateNotifierProvider<TitleNotifier, String>((ref) {
  return TitleNotifier();
});

class TitleNotifier extends StateNotifier<String> {
  TitleNotifier() : super('Daily');

  void changeTrendings(String timeWindow) {
    if (timeWindow == 'Daily') {
      state = 'Weekly';
    } else if (timeWindow == 'Weekly'){
      state = 'Daily';
    }
  }
}
