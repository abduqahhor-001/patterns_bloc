import 'package:equatable/equatable.dart';
import 'package:patterns_bloc/model/contact_model.dart';


abstract class ListContactState extends Equatable {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class ListPostInit extends ListContactState {}

class ListPostLoading extends ListContactState {}

class ListPostLoaded extends ListContactState {
  final List<Contact> contact;
  final bool isDeleted;

  ListPostLoaded( this.contact, this.isDeleted);
}

class ListPostError extends ListContactState {
  final error;

  ListPostError({this.error});
}