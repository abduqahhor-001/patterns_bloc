import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:patterns_bloc/blocs/update_contact_state.dart';

import '../model/contact_model.dart';
import '../services/http_service.dart';

class UpdateContactCubit extends Cubit<UpdateContactState>  {
  UpdateContactCubit() : super(UpdateContactInit());


  void apiPostUpdate(Contact contact) async{

    print(contact.toJson());
    emit(UpdateContactLoading());
    final response = await Network.PUT(Network.API_UPDATE + contact.id.toString(), Network.paramsUpdate(contact));
    print(response);
    if (response != null) {
      emit(UpdateContactLoaded(isUpdated: true));
    } else {
      emit(UpdateContactError(error: "Couldn't update Contact"));
    }
  }
}