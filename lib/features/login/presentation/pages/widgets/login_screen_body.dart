import 'package:esteshary_doctor/core/widgets/show_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:esteshary_doctor/core/app_export.dart';
import 'package:esteshary_doctor/core/utils/extension/widget.dart';
import 'package:esteshary_doctor/features/login/presentation/manager/login_cubit.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/widgets/custom_app_bottom.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';

class LoginScreenBody extends StatelessWidget {
  const LoginScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: BlocConsumer<LoginCubit, LoginState>(
            listener: (context, state) {
              if (state is LoginErrState) {
                showToast(text: state.message, state: ToastStates.error);
              }
              if (state is LoginSuccessState) {
                showToast(text: state.message, state: ToastStates.success);
              }
            },
            builder: (context, state) {
              var cubit = LoginCubit.get(context);
              return Form(
                key: cubit.key,
                child: Column(
                  children: [
                    Image.asset(
                      AppAssets.splach,
                      width: 200,
                      height: 200,
                    ),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            AppStrings.login,
                            style: CustomTextStyles.bodyLargeBlack900Bold20,
                          ),
                          20.height,
                          Text(
                            AppStrings.email,
                            style: CustomTextStyles.bodyMediumGrey600,
                          ),
                          10.height,
                          CustomTextFormField(
                            hintText: AppStrings.email,
                            controller: cubit.email,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return AppStrings.pleaseEmail;
                              } else if (value.validateEmail == false) {
                                return AppStrings.pleaseEmailTrue;
                              }
                              return null;
                            },
                          ),
                          10.height,
                          Text(
                            AppStrings.password,
                            style: CustomTextStyles.bodyMediumGrey600,
                          ),
                          10.height,
                          CustomTextFormField(
                            textInputType: TextInputType.visiblePassword,
                            hintText: AppStrings.password,
                            controller: cubit.pass,
                            suffix: cubit.lookPass
                                ? Icon(Icons.remove_red_eye_outlined).onTap(() {
                                    cubit.lookPassChange();
                                  })
                                : Icon(Icons.visibility_off_outlined).onTap(() {
                                    cubit.lookPassChange();
                                  }),
                            obscureText: cubit.lookPass,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return AppStrings.pleasePassword;
                              } else if (value.length < 6) {
                                return AppStrings.shortPassword;
                              }
                              return null;
                            },
                          ),
                          20.height,
                          state is LoginLoadingGetDataState
                              ? Center(child: CircularProgressIndicator())
                              : CustomAppBottom(
                                  label: AppStrings.login,
                                  onPressed: () {
                                    if (cubit.key.currentState!.validate()) {
                                      cubit.login(context);
                                    }
                                  },
                                )
                        ]),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
