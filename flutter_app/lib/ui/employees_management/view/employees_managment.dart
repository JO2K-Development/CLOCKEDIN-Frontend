import 'package:flutter/material.dart';
import 'package:flutter_app/core/utils/constants/dimentions.dart';
import 'package:flutter_app/core/utils/formatters/users_formatters.dart';
import 'package:flutter_app/core/widgets/my_avatar.dart';
import 'package:flutter_app/core/widgets/my_beveled_container.dart';
import 'package:flutter_app/core/widgets/my_divider.dart';
import 'package:flutter_app/core/widgets/section_title.dart';
import 'package:flutter_app/domain/model_classes/employee_brief_model/employee_brief_model.dart';
import 'package:flutter_app/ui/employees_management/view_model/employees_managment.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EmployeesManagmentPage extends StatelessWidget {
  const EmployeesManagmentPage({super.key, required this.viewModel});

  final EmployeesManagmentProvider viewModel;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
        listenable: viewModel.load,
        builder: (context, child) {
          if (viewModel.load.running) {
            return Center(child: CircularProgressIndicator());
          }

          return Column(
            children: [
              Column(
                children: [
                  SectionTitle(
                    AppLocalizations.of(context)
                        .org_members_management_your_members,
                    description: AppLocalizations.of(context)
                        .org_members_management_brief,
                    // style: Theme.of(context).textTheme.titleMedium!
                  ),
                ],
              ),
              // Gap(Dimentions.sizeM),
              Expanded(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: Dimentions.size1),
                  child: MyBeveledContainer(
                    radius: 30,
                    onlyTop: true,
                    isBackGPrimary: true,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: Dimentions.sizeXS,
                          left: Dimentions.sizeXS,
                          right: Dimentions.sizeXS),
                      child: Column(
                        children: [
                          searchBarRow(viewModel, context),
                          Gap(Dimentions.sizeM),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: Dimentions.sizeXS),
                              child: MyBeveledContainer(
                                  radius: 30,
                                  onlyTop: true,
                                  child:
                                      Expanded(child: employeeList(viewModel))),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        });
  }

  Widget employeeList(EmployeesManagmentProvider provider) {
    return ListView.builder(
      itemCount: provider.employeeBriefModels!.length,
      itemBuilder: (context, index) {
        Widget wrapped;
        // divides into sections of positions
        if (index == 0 ||
            (provider.employeeBriefModels![index].position !=
                provider.employeeBriefModels![index - 1].position)) {
          wrapped = Column(
            children: [
              Gap(Dimentions.sizeXL),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: Dimentions.sizeXL),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    provider.employeeBriefModels![index].position!,
                    style: Theme.of(context)
                        .textTheme
                        .labelSmall!
                        .copyWith(color: Theme.of(context).colorScheme.primary),
                  ),
                ),
              ),
              EmployeeBrief(provider.employeeBriefModels![index]),
            ],
          );
        } else {
          wrapped = EmployeeBrief(provider.employeeBriefModels![index]);
        }
        return Column(
          children: [
            // MyDivider(indentPercent: 0.07,),
            wrapped,
          ],
        );
      },
    );
  }

  Widget searchBarRow(EmployeesManagmentProvider provider, BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: Dimentions.sizeS),
          child: SearchBar(
            constraints: BoxConstraints(maxWidth: 310, minHeight: 50),
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
        ),
        Spacer(),
        ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(25)) ,
          child: Container(
              width: 50,
              height: 50,
              color: Theme.of(context).scaffoldBackgroundColor,
              child: Icon(
                Icons.filter_alt_outlined,
                size: Dimentions.sizeL,
                color: Theme.of(context).textTheme.titleLarge!.color,
              )),
        ),
      ],
    );
  }
}

class EmployeeBrief extends StatelessWidget {
  final EmployeeBriefModel employeeBriefModel;
  const EmployeeBrief(this.employeeBriefModel, {super.key});

  @override
  Widget build(BuildContext context) {

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
        Text(UsersFormatter.toFullName(employeeBriefModel),
            style: Theme.of(context).textTheme.labelMedium!),
        // Gap(Dimentions.sizeS),
        Text(
          employeeBriefModel.additionalInfo ?? "",
          style: Theme.of(context)
              .textTheme
              .labelSmall!
              .copyWith(color: Theme.of(context).colorScheme.primary),
        ),
      ],
    );
  }
}


