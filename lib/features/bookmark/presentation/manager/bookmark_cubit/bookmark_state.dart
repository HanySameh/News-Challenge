part of 'bookmark_cubit.dart';

@immutable
abstract class BookmarkState {}

class HomeInitial extends BookmarkState {}

class AddToBookMarkedState extends BookmarkState {}

class BookMarkedState extends BookmarkState {}

class GetBookMarkedState extends BookmarkState {}

class RemoveBookMarkedState extends BookmarkState {}
