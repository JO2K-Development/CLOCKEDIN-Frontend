import 'package:flutter/material.dart';
import 'package:flutter_app/core/enums/access_identifiers.dart';
import 'package:flutter_app/core/widgets/my_app_bar.dart';
import 'package:flutter_app/routing/routes_language_support.dart';
import 'package:flutter_app/routing/router.dart';
import 'package:flutter_app/routing/routes.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';


class AppScaffolding extends StatefulWidget {
  final Widget child;
  final int numberOfBottomIcons;
  final LanguageSupportUtil languageSupportUtil;

  const AppScaffolding({super.key, required this.child, this.numberOfBottomIcons = 3, required this.languageSupportUtil});
  
  @override
  State<AppScaffolding> createState() => _AppScaffoldingState();
}

class _AppScaffoldingState extends State<AppScaffolding> {
  
  int currentIndex = 1;
  @override
  void initState() {
    super.initState();    
  }

  @override
  Widget build(BuildContext context) {
    
    List<BottomNavigationBarItem> bottomIcons = List.generate(widget.numberOfBottomIcons, (index) => BottomNavigationBarItem(
      icon: Icon(Routes.routesIcons[AliasedRoutes.appScaffoldFeatures[index].path]),
      label: widget.languageSupportUtil.getRouteToCachedLocalizedText(context)[AliasedRoutes.appScaffoldFeatures[index].path],
    ));

    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Drawer Header'),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
              ),
            ),
            ...List.generate(AliasedRoutes.appScaffoldFeatures.length - widget.numberOfBottomIcons, (index) {
              return ListTile(
                title: Text(widget.languageSupportUtil.getRouteToCachedLocalizedText(context)[AliasedRoutes.appScaffoldFeatures[index + widget.numberOfBottomIcons].path]!),
                onTap: () {
                  GoRouter.of(context).go(AliasedRoutes.appScaffoldFeatures[index + widget.numberOfBottomIcons].path);
                  Navigator.pop(context);
                },
              );
            }),
          ],
        ),
      ),
      appBar: MyAppBar(),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: bottomIcons,
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
            GoRouter.of(context).go(AliasedRoutes.appScaffoldFeatures[index].path);
          });
        },
        // selectedItemColor: AppColors.selectedIconColor,
      ),
      body: widget.child
    );
  }
}