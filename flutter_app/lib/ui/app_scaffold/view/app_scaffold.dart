import 'package:flutter/material.dart';
import 'package:flutter_app/core/enums/access_identifiers.dart';
import 'package:flutter_app/core/widgets/my_app_bar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';


class BottomBarShell extends StatefulWidget {
  final Widget child;
  const BottomBarShell({super.key, required this.child});
  
  @override
  State<BottomBarShell> createState() => _BottomBarShellState();
}

class _BottomBarShellState extends State<BottomBarShell> {
  int currentIndex = 1;
  @override
  void initState() {
    super.initState();    
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
      body: widget.child
    );
  }
}