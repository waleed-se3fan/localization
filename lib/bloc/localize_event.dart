part of 'localize_bloc.dart';

class LocalizeEvent {}

class ChangeLanguageEvent extends LocalizeEvent {
  String langauge;
  ChangeLanguageEvent(this.langauge);
}
