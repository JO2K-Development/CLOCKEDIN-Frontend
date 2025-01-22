import 'package:flutter/material.dart';
import 'package:flutter_app/core/utils/command.dart';
import 'package:flutter_app/core/utils/constants/dimentions.dart';
import 'package:flutter_app/core/utils/formatters/users_formatters.dart';
import 'package:flutter_app/core/widgets/my_avatar.dart';
import 'package:flutter_app/core/widgets/my_beveled_container.dart';
import 'package:flutter_app/core/widgets/my_divider_with_text.dart';
import 'package:flutter_app/core/widgets/my_error.dart';
import 'package:flutter_app/ui/employee_profile/view_model/employee_profile_provider.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EmployeeProfilePage extends StatelessWidget {
  const EmployeeProfilePage({super.key, required this.viewModel});

  final EmployeeProfileProvider viewModel;
  
  @override
  Widget build(BuildContext context) {
    
    return ListenableBuilder(
      listenable: viewModel.load,
      builder: (context, child) { 
        if (viewModel.load.running){
          return const Center(
                child: CircularProgressIndicator(),
          );
        }

        if (viewModel.load.error){
          return ErrorMessage(title: AppLocalizations.of(context).profile_errorTitle);
        }

        final String name = UsersFormatter.toFullName(viewModel.currentUser);
        final String picUrl = viewModel.currentUser!.profilePictureUrl ?? '';
        print(picUrl);
        return Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Gap(Dimentions.sizeXXL),
            MyAvatar(picUrl, sizeDegree: 2),
            Gap(Dimentions.sizeM),
            Text(AppLocalizations.of(context).profile_settings,
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                    )),
            Gap(Dimentions.sizeM),
            DividerWithText(
                child: GestureDetector(
              onTap: () {
                print("Edit profile");
              },
              child: Text(name, style: Theme.of(context).textTheme.titleLarge),
            )),
            Gap(Dimentions.sizeXXL),
            Flexible(
              child: MyBeveledContainer(
                onlyTop: true,
                
                child: Container(
                  // height: ,
                  width: double.infinity,
                  child: Column(
                    children: [
                      
                      Spacer(),
                      Text(AppLocalizations.of(context).profile_privacy,
                          style: Theme.of(context).textTheme.labelMedium),
                      Gap(Dimentions.sizeL),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      );}
    );
  }
}
