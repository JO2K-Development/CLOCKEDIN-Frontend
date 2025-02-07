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
import 'package:flutter_app/ui/auth/data_filling/view/image_picker.dart';
import 'package:flutter_app/ui/auth/data_filling/view_model/data_filling_provider.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class DataFillingPage extends StatelessWidget {
  const DataFillingPage({super.key, required this.viewModel});

  final DatafillingProvider viewModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        // title: 'Data Filling',
      ),
      body: ListenableBuilder(
      listenable: viewModel.send,
      builder: (context, child) {
        if (viewModel.send.completed) {
          viewModel.send.clearResult();
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
  final DatafillingProvider viewModel;

  const formWidget(this.viewModel, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: viewModel.send,
      builder: (context, child) {
        if (viewModel.send.completed){
          viewModel.send.clearResult();
          context.push(Routes.clockInOut); //TODO: this for sure is wrong (there should be a set main page)
        }

        return Column(
          children: [
            Gap( Dimentions.sizeL),
                            Padding(
        padding: const EdgeInsets.symmetric(horizontal:Dimentions.sizeL),
        child: MyTextField(viewModel.firstnameController, hintText: AppLocalizations.of(context).data_filling_f_name),
                            ),
                            Gap(Dimentions.sizeL),
                            Padding(
        padding: const EdgeInsets.symmetric(horizontal:Dimentions.sizeL),
        child: MyTextField(viewModel.lastnameController, hintText: AppLocalizations.of(context).data_filling_l_name),
                            ),
                            Gap(Dimentions.sizeS),
                            Align(
        alignment: Alignment.centerRight,
        child: viewModel.send.running
        ?
        CircularProgressIndicator()
        :
        Padding(
          padding: const EdgeInsets.all(Dimentions.size6),
          child: MyButtonShort(text:  AppLocalizations.of(context).send, onPressed: viewModel.send.execute,),
        ),
                            ),
                            if (viewModel.send.error)
        Padding(
          padding: const EdgeInsets.only(top: Dimentions.sizeXL),
          child: 
          Text(
            // AppLocalizations.of(context).data_filling_error,
            viewModel.send.result.toString(),
          style: Theme.of(context).textTheme.bodyLarge!),
        ),
        
          ],
        );
      }
    );
  }
}

