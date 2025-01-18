import 'package:flutter/material.dart';
import 'package:flutter_app/core/controllers/app_init_user_data_provider.dart';
import 'package:flutter_app/core/enums/access_identifiers.dart';
import 'package:flutter_app/core/utils/constants/views_showed_by_access_id.dart';
import 'package:flutter_app/core/widgets/my_app_bar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';


class LandingPage extends StatefulWidget {
  const LandingPage({super.key});
  
  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  List<Widget> _childPages = [];
  int currentIndex = 1;
  @override
  void initState() {
    super.initState();    
    _init();
  }

  void _init() async {
    List<AccessIdentifier> accessIdList = Provider.of<AppInitUserDataProvider>(context, listen: false).appInitUserData!.accessIdentifiers!;
    this._childPages = ViewsShownByAccessId.getViewsByAccessId(List.from(accessIdList));
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          // Custom icon
          // BottomNavigationBarItem(icon: SPIcon(assetName: 'logo-big.png', index: 0, currentIndex: currentIndex), label: 'home??'),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_month), label: AppLocalizations.of(context).calendar),
          BottomNavigationBarItem(icon: Icon(Icons.watch), label: AppLocalizations.of(context).clock_in),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: AppLocalizations.of(context).profile),
          
        ],
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        // selectedItemColor: AppColors.selectedIconColor,
      ),
      body: _childPages[currentIndex]
    );
  }
}