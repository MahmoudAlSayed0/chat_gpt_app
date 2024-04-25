import 'package:flutter_bloc/flutter_bloc.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit(super.initialState);

  void toggleTheme() {
    if (state is LightTheme) {
      emit(DarkTheme());
    } else {
      emit(LightTheme());
    }
  }
}
