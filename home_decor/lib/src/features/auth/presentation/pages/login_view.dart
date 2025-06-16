import 'package:flutter/material.dart';
import 'package:home_decor/src/features/Auth/presentation/widgets/login_method.dart';
import 'package:home_decor/src/features/Auth/presentation/widgets/login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: LoginViewBody(),
            ),
            SliverFillRemaining(
              hasScrollBody: false,
              child: LoginMethod(),
            ),
          ],
        ),
      ),
    );
  }
}
