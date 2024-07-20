import 'package:bookly/constants.dart';
import 'package:bookly/core/utlis/app_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomBookDetialsAppBar extends StatelessWidget {
  const CustomBookDetialsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(onPressed: (){
          GoRouter.of(context).push(AppRouter.kHomeView);
        }, icon:const Icon(Icons.close,size: 30,color: secondryTextColor,)),
       const Spacer(),
        IconButton(onPressed: (){}, icon:const Icon(Icons.shopping_cart_outlined,size: 30,color: secondryTextColor,))
      ],
    );
  }
}