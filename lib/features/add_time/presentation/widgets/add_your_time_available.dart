import 'package:esteshary_doctor/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:esteshary_doctor/core/app_export.dart';
import 'package:esteshary_doctor/core/utils/app_strings.dart';
import '../../../../core/widgets/custom_app_bottom.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../../../../core/widgets/show_toast.dart';
import '../manager/doctor_cubit.dart';
import 'days_check_box_list_view.dart';

class AddYourTimeAvailable extends StatelessWidget {
  const AddYourTimeAvailable({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DoctorCubit, DoctorState>(
      builder: (context, state) {
        var cubit = DoctorCubit().get(context);
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
              // DayCheckBoxListView(cubit: cubit),
              Row(
                children: [
                  FilledButton(
                    onPressed: () {
                      showDatePicker(
                              context: context,
                              firstDate: DateTime(2024),
                              lastDate: DateTime(2030))
                          .then((value) {
                        if (value != null) {
                          cubit.addRequestDay = value;
                          print(value.format());
                          cubit.dayName();
                        }
                      });
                    },
                    child: Text("اختر اليوم"),
                  ),
                  10.width,
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: AppColors.primary,
                    ),
                    child: context.read<DoctorCubit>().day2 == null
                        ? Text("اليوم",
                            style: CustomTextStyles.bodyMediumBlack20001)
                        : Text(
                            "${context.read<DoctorCubit>().day2} ${context.read<DoctorCubit>().addRequestDay!.format()} ",
                            style: CustomTextStyles.bodyMediumBlack20001,
                          ),
                  ),
                ],
              ),
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
                      onPressed: () {
                        if (cubit.key.currentState!.validate() &&
                            cubit.addRequestDay != null) {
                          cubit.addDoctorTimer();
                        }
                        if (cubit.addRequestDay == null) {
                          showToast(
                              text: "برجاء اختيار اليوم من فضلك",
                              state: ToastStates.error,
                          );
                        }
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
