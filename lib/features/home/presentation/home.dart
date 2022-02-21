import 'package:flutter/material.dart';
import 'package:osp/features/home/presentation/home_bloc.dart';
import 'package:osp/features/home/presentation/home_body.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => HomeBloc()..initialize(),
      child: HomeBody(),
    );
  }


}