import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wisata_ticketing/core/core.dart';
import 'package:wisata_ticketing/features/authentication/presentation/cubit/auth_cubit.dart';
import 'package:wisata_ticketing/features/main/main_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  void initState() {
    super.initState();
    context.read<AuthCubit>().getUser();
  }

  @override
  Widget build(BuildContext context) {
    bool isLoading = false;
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    final double height = MediaQuery.of(context).size.height;

    void onClickLogin() {
      isLoading = true;

      final email = emailController.text.trim();
      final password = passwordController.text.trim();

      context.read<AuthCubit>().login(email: email, password: password);
    }

    void navigateToMainPage() {
      context.pushReplacement(const MainPage());
    }

    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        state.maybeWhen(
            initial: () {
              isLoading = true;
            },
            userLoaded: (user) {
              if (user != null) {
                navigateToMainPage();
              }
            },
            errorLogin: (message) {
              isLoading = false;
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(message)));
            },
            loggedIn: (response) {
              isLoading = false;

              emailController.clear();
              passwordController.clear();

              navigateToMainPage();
            },
            orElse: () {});
      },
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
              body: Stack(
            children: [
              SizedBox(
                height: height * 0.3,
                child: Center(
                    child:
                        Assets.images.logoWhite.image(height: Sizing.lessHuge)),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: SingleChildScrollView(
                  child: ClipRRect(
                    borderRadius: Sizing.borderRadiusTop(Sizing.large),
                    child: ColoredBox(
                      color: AppColors.white,
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: Sizing.lessLarge,
                          top: Sizing.veryLarge,
                          right: Sizing.lessLarge,
                          bottom: Sizing.lessLarge,
                        ),
                        child: Wrap(
                          runSpacing: Sizing.large,
                          children: [
                            CustomTextField(
                              controller: emailController,
                              label: 'Email',
                              isOutlineBorder: true,
                            ),
                            CustomTextField(
                              controller: passwordController,
                              label: 'Password',
                              isOutlineBorder: true,
                              obscureText: true,
                            ),
                            Button.filled(
                              onPressed: onClickLogin,
                              label: 'Login',
                              disabled: isLoading,
                            ),
                            const SpaceHeight(Sizing.veryHuge),
                            Center(
                              child: Assets.images.logoCwb
                                  .image(height: Sizing.veryLarge),
                            ),
                            const SpaceHeight(Sizing.veryHuge),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          )),
        );
      },
    );
  }
}
