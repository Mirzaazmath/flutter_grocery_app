
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// here we are creating the LoadingProvider that is used for loading
final loadingProvider=StateProvider<bool>((ref) => false);