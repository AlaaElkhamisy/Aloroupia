import 'package:aloroupia/core/manager/colors/app_colors.dart';
import 'package:aloroupia/core/manager/responsive/size_config.dart';
import 'package:aloroupia/core/manager/styles/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OtpFormItem extends StatelessWidget {
  const OtpFormItem({super.key, this.onSaved});
  final void Function(String?)? onSaved;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 68,
      height: 64,
      child: TextFormField(
        onSaved: onSaved,
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          }
        },
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
          LengthLimitingTextInputFormatter(1),
        ],
        style: AppTextStyles.headLinesStyle(context).copyWith(
          fontSize: SizeConfig.width(context, 0.065), //30
        ),
        decoration: InputDecoration(
          hintText: '0',
          hintStyle: AppTextStyles.headLinesStyle(context).copyWith(
            fontSize: SizeConfig.width(context, 0.065), //30
            color: Colors.grey.shade300,
          ),
          border: _buildFieldBorder(),
          focusedBorder: _buildFieldBorder(),
          enabledBorder: _buildFieldBorder(),
        ),
      ),
    );
  }

  OutlineInputBorder _buildFieldBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: AppColors.appYellowC, width: 3),
    );
  }
}
