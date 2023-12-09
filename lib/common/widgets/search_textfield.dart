import 'package:flutter/material.dart';
import 'package:klimbb_project_task/common/app_colors/app_colors.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.sharedInstance.textFieldBg,
          borderRadius: BorderRadius.circular(10)),
      child: TextFormField(
        style: TextStyle(color: AppColors.sharedInstance.lightGrey),
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.sharedInstance.lightGrey),
            borderRadius: BorderRadius.circular(8),
          ),
          labelText: "Search song, playslist, artist...",
          focusColor: AppColors.sharedInstance.lightGrey,
          labelStyle: TextStyle(color: AppColors.sharedInstance.lightGrey),
          prefixIcon: Icon(
            Icons.search,
            color: AppColors.sharedInstance.lightGrey,
          ),
          fillColor: AppColors.sharedInstance.textFieldBg,
          border: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.sharedInstance.lightGrey),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }
}
