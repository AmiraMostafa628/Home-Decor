import 'package:flutter/material.dart';
import 'package:home_decor/src/features/Auth/presentation/widgets/sign_up_view_body.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
       child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: SignUpViewBody(),
          )
        ],
      )),
    );
  }
}
