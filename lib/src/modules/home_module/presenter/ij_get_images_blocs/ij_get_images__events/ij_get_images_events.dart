// ignore_for_file: public_member_api_docs, sort_constructors_first
abstract class IJGetImagesEvents {}

class InitializeSearch implements IJGetImagesEvents {
  InitializeSearch({this.searchCollection});
  String? searchCollection;
}