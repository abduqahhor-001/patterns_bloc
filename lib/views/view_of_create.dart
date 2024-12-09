
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:patterns_bloc/blocs/create_contact_cubit.dart';

import '../model/contact_model.dart';


Widget viewOfCreate(bool isLoading, BuildContext context, TextEditingController fullNameController, TextEditingController phoneController){
  return Container(
    padding: EdgeInsets.all(30),
    child: Stack(
      children: [
        Column(
          children: [
            TextField(
              controller: fullNameController,
              decoration: InputDecoration(
                  hintText: "fullname",
                  hintStyle: TextStyle(color: Colors.grey)),
            ),
            TextField(
              controller: phoneController,
              decoration: InputDecoration(
                  hintText: "phone",
                  hintStyle: TextStyle(color: Colors.grey)),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                Contact contact = Contact(  fullName: fullNameController.text.toString(), phone: phoneController.text, id:"1");
                BlocProvider.of<CreateContactCubit>(context).apiPostCreate(contact);
              },

              child: Text(
                "Create a Post",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),

        isLoading ? Center(
          child: CircularProgressIndicator(),
        ): SizedBox.shrink(),
      ],
    ),
  );
}