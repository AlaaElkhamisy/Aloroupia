import 'package:aloroupia/core/manager/colors/app_colors.dart';
import 'package:aloroupia/core/manager/styles/app_text_styles.dart';
import 'package:aloroupia/features/ai_generate/presentation/views/widgets/custom_elvated_icon_btn.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ClearHistoryIconBtn extends StatelessWidget {
  const ClearHistoryIconBtn({super.key, this.onPressed});
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    // List<AiMessagingModel> generatedImages =
    //     BlocProvider.of<FetchAllGeneratedImagesCubit>(context).generatedImages!;
    return IconButton(
      padding: EdgeInsets.only(bottom: 20, right: 20),
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              backgroundColor: Colors.transparent,
              content: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: AppColors.appYellowC.withOpacity(0.33),
                  borderRadius: BorderRadius.circular(20),
                ),
                width: 300,
                height: 250,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 50,
                  children: [
                    Text(
                      textAlign: TextAlign.center,
                      'Are you sure you want to delete all history?',
                      style: AppTextStyles.headLinesStyle(context).copyWith(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomElevatedIconButton(
                          label: 'Yes',
                          icon: Icon(CupertinoIcons.trash, color: Colors.white),
                          bgColor: Colors.black,
                          onPressed: onPressed,
                        ),
                        CustomElevatedIconButton(
                          label: 'No',
                          icon: Icon(Icons.cancel, color: Colors.white),
                          bgColor: Colors.black,
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
      icon: Icon(CupertinoIcons.trash, color: Colors.grey),
    );
  }
}
