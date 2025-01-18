import 'package:flutter/material.dart';
import 'package:flutter_app/core/utils/constants/dimentions.dart';
import 'package:flutter_app/core/utils/formatters/users_formatters.dart';
import 'package:flutter_app/core/widgets/my_avatar.dart';
import 'package:flutter_app/core/widgets/my_beveled_container.dart';
import 'package:flutter_app/core/widgets/my_divider.dart';
import 'package:flutter_app/core/widgets/section_title.dart';
import 'package:flutter_app/ui/employees_management/view_model/employees_managment.dart';
import 'package:flutter_app/domain/model_classes/employee_brief.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class OrgMembersManagmentPage extends StatelessWidget {
  const OrgMembersManagmentPage({super.key});

  @override
  Widget build(BuildContext context) {
    OrgMembersManagmentProvider provider =
        Provider.of<OrgMembersManagmentProvider>(context);
    if (provider.isLoading) {
      return Center(child: CircularProgressIndicator());
    }

    provider.employeeBriefModels.forEach((element) => print(element.firstName));
    return Column(
      children: [
        SectionTitle(
          AppLocalizations.of(context).org_members_management_your_members,
          description:
              AppLocalizations.of(context).org_members_management_brief,
          // style: Theme.of(context).textTheme.titleMedium!
        ),
        // Gap(Dimentions.sizeM),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: Dimentions.sizeM),
          child: Column(
            children: [
              searchBarRow(provider, context),
              Gap(Dimentions.sizeM),
              employeeList(provider)
            ],
          ),
        ),
      ],
    );
  }

  MyBeveledContainer employeeList(OrgMembersManagmentProvider provider) {
    return MyBeveledContainer(
      onlyTop: true,
        child: Column(
      children: [
        Gap(Dimentions.sizeM),
        // Padding(
        //   padding: const EdgeInsets.only(
        //       left: Dimentions.sizeM, top: Dimentions.sizeS),
        //   child: searchBarRow(provider, context),
        // ),
         SizedBox(
          height: 385,
          child: ListView.builder(
            itemCount: provider.employeeBriefModels.length,
            itemBuilder: (context, index) {
              if (index == 0 ||
                  (provider.employeeBriefModels[index].position !=
                      provider.employeeBriefModels[index - 1].position)) {
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: Dimentions.sizeXL),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child:
                            Text(provider.employeeBriefModels[index].position!, style: Theme.of(context).textTheme.labelSmall!.copyWith(
                              color: Theme.of(context).colorScheme.primary
                            ),),
                      ),
                    ),
                    EmployeeBrief(provider.employeeBriefModels[index]),
                  ],
                );
              }
              return EmployeeBrief(provider.employeeBriefModels[index]);
            },
          ),
        ),
      ],
    ));
  }

  Row searchBarRow(OrgMembersManagmentProvider provider, BuildContext context) {
    return Row(
      children: [
        SearchBar(
          constraints: BoxConstraints(maxWidth: 330, minHeight: 50),
          hintText: provider.isSearchActive
              ? ""
              : " ${AppLocalizations.of(context).org_members_management_hint_text}",
          padding:
              WidgetStateProperty.all(EdgeInsets.only(left: Dimentions.sizeM)),
          hintStyle: WidgetStatePropertyAll<TextStyle>(
            Theme.of(context).textTheme.bodySmall!,
          ),
          trailing: [
            InkWell(
                onTap: () {
                  provider.searchController.clear();
                },
                child: IconButton(
                    onPressed: () {
                      provider.searchController.clear();
                    },
                    icon: Icon(Icons.clear)))
          ],
          controller: provider.searchController,
          onTap: () {
            provider.setSearchActive(true);
          },
          onTapOutside: (event) {
            FocusScope.of(context).unfocus();
            provider.setSearchActive(false);
          },
        ),
        Flexible(
          child: Container(
              alignment: Alignment.center,
              child: Icon(
                Icons.filter_alt_outlined,
                size: Dimentions.sizeXL,
              )),
        )
      ],
    );
  }
}

class EmployeeBrief extends StatelessWidget {
  final EmployeeBriefModel employeeBriefModel;
  const EmployeeBrief(this.employeeBriefModel, {super.key});

  @override
  Widget build(BuildContext context) {
    print(employeeBriefModel.lastName);

    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: Dimentions.sizeL, vertical: Dimentions.sizeS),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(Dimentions.sizeS),
            child: Row(
              children: [
                MyAvatar(employeeBriefModel.profilePictureUrl ?? " "),
                Gap(Dimentions.sizeM),
                Expanded(child: textContent(context)),
              ],
            ),
          ),
          // MyDivider(indentPercent: 0,),
        ],
      ),
    );
  }

  Column textContent(BuildContext context) {
    return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(UsersFormatter.toFullName(employeeBriefModel), style: Theme.of(context).textTheme.labelMedium!),
                  // Gap(Dimentions.sizeS),
                  Text(employeeBriefModel.additionalInfo ?? "", style: Theme.of(context).textTheme.labelSmall!.copyWith(
                    color: Theme.of(context).colorScheme.primary
                  ),),
                ],
              );
  }
}
