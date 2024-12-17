import 'package:flutter/material.dart';
import 'package:flutter_app/core/controllers/app_init_user_data_provider.dart';
import 'package:flutter_app/core/utils/constants/dimentions.dart';
import 'package:flutter_app/core/widgets/my_avatar.dart';
import 'package:flutter_app/core/widgets/my_beveled_container.dart';
import 'package:flutter_app/core/widgets/my_divider_with_text.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EmployeeProfilePage extends StatelessWidget {
  const EmployeeProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    String name =
        "${Provider.of<AppInitUserDataProvider>(context).appInitUserData!.firstName!} ${Provider.of<AppInitUserDataProvider>(context).appInitUserData!.lastName!}";
    String picUrl = Provider.of<AppInitUserDataProvider>(context).appInitUserData!.profilePictureUrl!;
    
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
          Gap(Dimentions.sizeXL),
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
    );
  }
}
