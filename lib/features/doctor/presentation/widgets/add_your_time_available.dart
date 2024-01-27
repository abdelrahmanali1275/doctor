import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:esteshary_doctor/core/app_export.dart';
import 'package:esteshary_doctor/core/utils/app_strings.dart';
import 'package:esteshary_doctor/features/doctor/presentation/manager/doctor_cubit.dart';

import '../../../../core/widgets/custom_app_bottom.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../../../../core/widgets/show_toast.dart';
import 'days_check_box_list_view.dart';

class AddYourTimeAvailable extends StatelessWidget {
  const AddYourTimeAvailable({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    return BlocConsumer<DoctorCubit, DoctorState>(
      builder: (context, state) {

        var cubit = DoctorCubit().get(context);

=======
    return BlocBuilder<DoctorCubit, DoctorState>(
      builder: (context, state) {
        var cubit = DoctorCubit().get(context);
>>>>>>> origin/main
        return Container(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppStrings.timeAvailable,
                style: CustomTextStyles.bodyLargeBlack900,
              ),
              5.height,
              const Divider(
                endIndent: 2,
                indent: 2,
              ),
              5.height,
<<<<<<< HEAD
              DayCheckBoxListView(cubit: cubit),
              20.height,
              Form(
                key: cubit.key,
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppStrings.from,
                          style: CustomTextStyles.bodyLargeBlack900,
                        ),
                        CustomTextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "برجاء ادخال الوقت";
                            }
                            return null;
                          },
                          width: 165.w,
                          controller: cubit.fromController,
                          textInputType: TextInputType.datetime,
                          onTap: () async {
                            TimeOfDay? date;
                            FocusScope.of(context)
                                .requestFocus(new FocusNode());
                            date = (await showTimePicker(
                              context: context,
                              initialTime: TimeOfDay.now(),
                            ).then((value) {
                              if (value != null) {
                                print("${value.hour}:${value.minute}");
                                cubit.fromController.text =
                                    value.format(context);
                                cubit.toController.text = cubit
                                    .addMinutesToTime(value, 30)
                                    .format(context);
                              }
                              return null;
                            }));

                            // cubit.fromController.text =
                            //     date!.format(context).toString();
                          },
                        ),
                      ],
                    ),
                    20.width,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppStrings.to,
                          style: CustomTextStyles.bodyLargeBlack900,
                        ),
                        CustomTextFormField(
                          onTap: () async {
                            FocusScope.of(context)
                                .requestFocus(new FocusNode());
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "برجاء ادخال الوقت";
                            }
                            return null;
                          },
                          width: 165.w,
                          controller: cubit.toController,
                          textInputType: TextInputType.datetime,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              20.height,
              state is AddDoctorTimerLoading
                  ? Center(child: CircularProgressIndicator())
                  : CustomAppBottom(
                      label: AppStrings.save,
                      onPressed: () async{
                        if (cubit.key.currentState!.validate()) {
                          await cubit.addDoctorTimer();
                        }

                      }),
=======
               DayCheckBoxListView(cubit: cubit),
              20.height,
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppStrings.from,
                        style: CustomTextStyles.bodyLargeBlack900,
                      ),
                      CustomTextFormField(
                        width: 165.w,
                        controller: cubit.fromController,
                        textInputType: TextInputType.datetime,
                        onTap: () async {
                          TimeOfDay? date;
                          FocusScope.of(context).requestFocus(new FocusNode());
                          date = (await showTimePicker(
                            context: context,
                            initialTime: TimeOfDay.now(),
                          ));
                          cubit.fromController.text =
                              date!.format(context).toString();
                        },
                      ),
                    ],
                  ),
                  20.width,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppStrings.to,
                        style: CustomTextStyles.bodyLargeBlack900,
                      ),
                      CustomTextFormField(
                        onTap: () async {
                          TimeOfDay? date;
                          FocusScope.of(context).requestFocus(new FocusNode());
                          date = (await showTimePicker(
                            context: context,
                            initialTime: TimeOfDay.now(),
                          ));
                          cubit.toController.text =
                              date!.format(context).toString();
                        },
                        width: 165.w,
                        controller: cubit.toController,
                        textInputType: TextInputType.datetime,
                      ),
                    ],
                  ),
                ],
              ),
              20.height,
              CustomAppBottom(
                  label: AppStrings.save,
                  onPressed: () {
                    cubit.doctorAddTime();
                  }),
            ],
          ),
        );
      },
      listener: (BuildContext context, DoctorState state) {
        if (state is AddDoctorTimerErr) {
          showToast(text: state.message, state: ToastStates.error);
        }
        if (state is AddDoctorTimerSuccess) {
          showToast(text: state.message, state: ToastStates.success);
        }
      },

    );
  }
}
