import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'localize_event.dart';
part 'localize_state.dart';

class LocalizeBloc extends Bloc<LocalizeEvent, LocalizeState> {
  LocalizeBloc() : super(LocalizeInitial()) {
    on<LocalizeEvent>((event, emit) {});
    on<ChangeLanguageEvent>(changeLanguage);
  }

  String language = 'en';
  changeLanguage(ChangeLanguageEvent event, Emitter<LocalizeState> emit) {
    language = event.langauge;
    emit(SuccessChangeLanguage(language));
  }
}
