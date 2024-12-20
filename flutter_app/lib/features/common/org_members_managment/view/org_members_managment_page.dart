import 'package:flutter/material.dart';
import 'package:flutter_app/core/utils/constants/dimentions.dart';
import 'package:flutter_app/core/utils/formatters/users_formatters.dart';
import 'package:flutter_app/core/widgets/my_avatar.dart';
import 'package:flutter_app/core/widgets/my_beveled_container.dart';
import 'package:flutter_app/core/widgets/my_divider.dart';
import 'package:flutter_app/features/common/org_members_managment/controller/org_members_managment_provider.dart';
import 'package:flutter_app/features/common/org_members_managment/model/employee_brief_model.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:provider/provider.dart';

class OrgMembersManagmentPage extends StatelessWidget {
  const OrgMembersManagmentPage({super.key});

  @override
  Widget build(BuildContext context) {
    OrgMembersManagmentProvider provider = Provider.of<OrgMembersManagmentProvider>(context);
    if (provider.isLoading) {
      return Center(child: CircularProgressIndicator());
    }

    provider.employeeBriefModels.forEach((element) => print(element.firstName));
    return Column(
      children: [
        Gap(Dimentions.sizeXXL),
        MyBeveledContainer(
            child: Column(
              children: [
                Gap(Dimentions.sizeM),
                Padding(
                  padding: const EdgeInsets.only(left: Dimentions.sizeM, top: Dimentions.sizeS),
                  child: Row(
                    
                    children: [
                      SearchBar(constraints: BoxConstraints(maxWidth: 330, minHeight: 50),),
                      Flexible(
                        child: Container(
                          alignment: Alignment.center,
                          child: Icon(Icons.filter_alt_outlined, size: Dimentions.sizeXL,)),
                      )
                    ],
                  ),
                ),
                SizedBox(
                          height: 400,
                          child: ListView.builder(
                itemCount: provider.employeeBriefModels.length,
                itemBuilder: (context, index) {
                  return EmployeeBrief(provider.employeeBriefModels[index]);
                },
                          ),
                        ),
              ],
            ))
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
      padding: const EdgeInsets.symmetric(horizontal: Dimentions.sizeL, vertical: Dimentions.sizeS),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(Dimentions.sizeS),
            child: Row(
              children: [
                MyAvatar(employeeBriefModel.profilePictureUrl ?? " "),
                Gap(Dimentions.sizeM),
                Text(UsersFormatter.toFullName(employeeBriefModel))
              ],
            ),
          ),
          MyDivider(indentPercent: 0,),
        ],
      ),
    );
  }
}
