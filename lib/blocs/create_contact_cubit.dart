import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:patterns_bloc/model/contact_model.dart';


import '../services/http_service.dart';
import 'create_contact_state.dart';

class CreateContactCubit extends Cubit<CreateContactState>  {
  CreateContactCubit() : super(CreateContactInit());


  void apiPostCreate(Contact contact) async{
    print(contact.toJson());
    emit(CreateContactLoading());
    final response = await Network.POST(Network.API_CREATE, Network.paramsCreate(contact));
    print(response);
    if (response != null) {
      emit(CreateContactLoaded(isCreated: true));
    } else {
      emit(CreateContactError(error: "Couldn't create post"));
    }
  }
}