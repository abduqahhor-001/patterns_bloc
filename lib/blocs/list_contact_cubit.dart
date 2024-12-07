import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:patterns_bloc/model/contact_model.dart';

import '../services/http_service.dart';
import 'list_contatact_state.dart';




class ListContactCubit extends Cubit<ListContactState> {
  ListContactCubit() : super(ListPostInit());

  void apiPostList() async {
    emit(ListPostLoading());
    final response = await Network.GET(Network.API_LIST, Network.paramsEmpty());
    print(response);
    if (response != null) {
      emit(ListPostLoaded( Network.parsePostList(response), true));
    } else {
      emit(ListPostError(error: "Couldn't fetch posts"));
    }
  }

  void apiPostDelete(Contact contact) async {
    emit(ListPostLoading());
    final response = await Network.DEL(
        Network.API_DELETE + contact.id.toString(), Network.paramsEmpty());
    print(response);
    if (response != null) {
      apiPostList();
    } else {
      emit(ListPostError(error: "Couldn't delete post"));
    }
  }



}