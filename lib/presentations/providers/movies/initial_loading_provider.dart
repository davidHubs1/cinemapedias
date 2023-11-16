import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers.dart';

///first loading
///

final firstLoadingProvider = Provider<bool>((ref) {
  final step1 = ref.watch(nowPlayinMoviesProvider).isEmpty;
  final step2 = ref.watch(popularesMoviesProvider).isEmpty;
  final step3 = ref.watch(upCommingPorvider).isEmpty;
  final step4 = ref.watch(topRatedProvider).isEmpty;

  if (step1 || step2 || step3 || step4) return true;

  return false;

  /// terminanos de cargar
});
