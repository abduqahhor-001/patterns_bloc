import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:patterns_bloc/blocs/list_contact_cubit.dart';
import 'package:patterns_bloc/blocs/list_contatact_state.dart';
import 'package:patterns_bloc/model/contact_model.dart';

import '../views/view_of_home.dart';


class HomePage extends StatefulWidget {
  static final String id = "home_page";

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Contact> items = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<ListContactCubit>(context).apiPostList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("BloC"),
        ),
        body: BlocBuilder<ListContactCubit, ListContactState>(
          builder: (BuildContext context, ListContactState state) {
            if (state is ListPostError) {
              return viewOfHome(items, true);
            }
            if (state is ListPostLoaded) {
              items = state.contact;
              return viewOfHome(items, false);
            }
            return viewOfHome(items, true);
          },
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          onPressed: () {
            BlocProvider.of<ListContactCubit>(context).callCreatePage(context);
          },
          child: Icon(Icons.add),
        ));
  }
}