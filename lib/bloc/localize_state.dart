part of 'localize_bloc.dart';

class LocalizeState {}

final class LocalizeInitial extends LocalizeState {}

class LoadingChangeLanguage extends LocalizeState {}

class SuccessChangeLanguage extends LocalizeState {
  String language;
  SuccessChangeLanguage(this.language);
}

class FailChangeLanguage extends LocalizeState {}
