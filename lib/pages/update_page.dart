import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:patterns_bloc/views/view_of_update.dart';

import '../blocs/update_contact_cubit.dart';
import '../blocs/update_contact_state.dart';
import '../model/contact_model.dart';

class UpdatePage extends StatelessWidget {
  Contact? contact;

  UpdatePage({this.contact});

  TextEditingController fullNameController = new TextEditingController();
  TextEditingController phoneController = new TextEditingController();

  _finish(BuildContext context) {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      Navigator.pop(context, "result");
    });
  }

  @override
  Widget build(BuildContext context) {
    fullNameController.text = contact!.fullName;
    phoneController.text = contact!.phone;

    return BlocProvider(
      create: (context) => UpdateContactCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Update a Post"),
        ),
        body: BlocBuilder<UpdateContactCubit, UpdateContactState>(
          builder: (BuildContext context, UpdateContactState state) {
            if(state is UpdateContactLoading){
              String fullName = fullNameController.text.toString();
              String phone = phoneController.text.toString();
              Contact contact = Contact(id: this.contact!.id, fullName: fullName, phone: phone,);
              return viewOfUpdate(true,context,contact, fullNameController, phoneController);
            }
            if(state is UpdateContactLoaded){
              _finish(context);
            }
            if(state is UpdateContactError){

            }
            return viewOfUpdate(false,context,contact!, fullNameController, phoneController);
          },
        ),
      ),
    );
  }

}