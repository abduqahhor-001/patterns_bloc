
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:patterns_bloc/blocs/list_contact_cubit.dart';
import 'package:patterns_bloc/model/contact_model.dart';

Widget itemOfPost(BuildContext context,Contact contact) {
  return Container(
    margin:const EdgeInsets.only(bottom: 10),
    decoration: BoxDecoration(

      border: Border.all(width: 1, color: Colors.black),
      borderRadius: BorderRadius.circular(25),
    ),

    child: Slidable(


      startActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: (ctx){},
            borderRadius: BorderRadius.circular(25),
            backgroundColor: Colors.green,
            foregroundColor: Colors.white,
            icon: Icons.edit,
            label: 'Update',
          ),
        ],
      ),
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: (context) {
              BlocProvider.of<ListContactCubit>(context).apiPostDelete(contact);},
            borderRadius: BorderRadius.circular(25),
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Delete',
          ),
        ],
      ),
      child: ListTile(

        title: Text(contact.fullName,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        subtitle: Text(contact.phone , style: const TextStyle(fontSize: 14)),
        isThreeLine: true,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      ),
    ),
  );
}

