import 'package:flutter/material.dart';
import 'package:flutter_app/core/utils/constants/dimentions.dart';
import 'package:flutter_app/core/widgets/my_app_bar.dart';
import 'package:flutter_app/core/widgets/my_beveled_container.dart';
import 'package:flutter_app/core/widgets/my_button_short.dart';
import 'package:flutter_app/core/widgets/my_divider.dart';
import 'package:flutter_app/core/widgets/my_text_input.dart';
import 'package:flutter_app/core/widgets/plain_text_intput_decoration_wrapper.dart';
import 'package:flutter_app/core/widgets/section_title.dart';
import 'package:flutter_app/routing/routes.dart';
import 'package:flutter_app/ui/auth/choose_account_type/view_model/choose_account_type_provider.dart';
import 'package:flutter_app/ui/auth/data_filling/view/image_picker.dart';
import 'package:flutter_app/ui/auth/data_filling/view_model/data_filling_provider.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class ChooseAccountTypePage extends StatelessWidget {
  const ChooseAccountTypePage({super.key, required this.viewModel});

  final ChooseAccountTypeProvider viewModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        // title: 'Data Filling',
      ),
      body: ListenableBuilder(
      listenable: viewModel.joinCompany,
      builder: (context, child) {
        if (viewModel.joinCompany.completed) {
          viewModel.joinCompany.clearResult();
          context.push(Routes.calendar); // maybe this shouldnt even be here (maybe the router.dart/_redirect does this autoamtically)
        }

        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(Dimentions.sizeM),
            child: Column(
              children: [
                // Gap(Dimentions.sizeXL),
                SectionTitle(AppLocalizations.of(context).data_filling_title, bulletPoints: [AppLocalizations.of(context).data_filling_section_bullet_1, AppLocalizations.of(context).data_filling_section_bullet_2],),
                Gap(Dimentions.sizeXL),
                ProfileImageSelector(viewModel: viewModel),
                Gap(Dimentions.sizeXL),
                formWidget(viewModel),
          
              ],
            ),
          ),
        );
      
      }
    ));
  }
}

class formWidget extends StatelessWidget {
  final ChooseAccountTypeProvider viewModel;

  const formWidget(this.viewModel, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: viewModel.joinCompany,
      builder: (context, child) {
        if (viewModel.joinCompany.completed){
          viewModel.joinCompany.clearResult();
          context.push(Routes.clockInOut); //TODO: this for sure is wrong (there should be a set main page)
        }

        return MyBeveledContainer(
          child: Column(
            children: [
              Gap( Dimentions.sizeL),
                   
          
          if (viewModel.joinCompany.error)
          Padding(
            padding: const EdgeInsets.only(top: Dimentions.sizeXL),
            child: 
            Text(
              // AppLocalizations.of(context).data_filling_error,
              viewModel.joinCompany.result.toString(),
            style: Theme.of(context).textTheme.bodyLarge!),
          ),
          
            ],
          ),
        );
      }
    );
  }

  Widget _row({name, position, url, onTap}) {
    return ListTile(
      title: Text(name),
      subtitle: Text(position),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(url),
      ),
      trailing: Icon(Icons.arrow_forward_ios),
      onTap: onTap,
    );
  }
}

