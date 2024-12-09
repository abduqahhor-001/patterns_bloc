import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:patterns_bloc/views/view_of_create.dart';

import '../blocs/create_contact_cubit.dart';
import '../blocs/create_contact_state.dart';



class CreatePage extends StatelessWidget {

  TextEditingController titleController = new TextEditingController();
  TextEditingController bodyController = new TextEditingController();

  _finish(BuildContext context) {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      Navigator.pop(context, "result");
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CreateContactCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Add Post"),
        ),
        body: BlocBuilder<CreateContactCubit, CreateContactState>(
          builder: (BuildContext context, CreateContactState state) {
            if(state is CreateContactLoading){
              return viewOfCreate(true,context,titleController,bodyController);
            }
            if(state is CreateContactLoaded){
              _finish(context);
            }
            if(state is CreateContactError){

            }
            return viewOfCreate(false,context,titleController,bodyController);
          },
        ),
      ),
    );
  }
}