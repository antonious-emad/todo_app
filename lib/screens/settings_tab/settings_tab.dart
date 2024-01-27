import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:third/shared/styles/colors.dart';
import '../../providers/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../shared/styles/text_styles.dart';
import '../../shared/styles/theming.dart';
class SettingsTab extends StatelessWidget {
  static const String routeName="SettingsTab";
  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<MyProider>(context);
    showLanguageBottomSheet( context) {
      showModalBottomSheet(
        backgroundColor:Theme.of(context).colorScheme.onPrimary,
        isScrollControlled: true,
        shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color:Theme.of(context).colorScheme.onSurface,)
        ),
        context: context, builder: (context) {
        return Container(height: MediaQuery.of(context).size.height * 0.5,
          child:Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(onTap: () {
                  provider.ChangeLanguage("en");
                },child: Row(
                  children: [
                    provider.languageCode=="en"?Text(AppLocalizations.of(context)!.english,style: Theme.of(context).textTheme.bodyMedium):Text(AppLocalizations.of(context)!.english,style: TextStyle(  color:provider.isDark?MainColors.whited:Colors.black54)  ),
                    Spacer(),
                    provider.languageCode=="en"?Icon(Icons.done,color: MainColors.secondryLightColor,size: 35,):SizedBox.shrink(),
                  ],
                )),
                SizedBox(height: 25,),
                InkWell(onTap: () {
                  provider.ChangeLanguage("ar");
                  // AppLocalizations.of(context)!.localeName=Locale("en");
                  // setState(() {});
                },child: Row(
                  children: [
                    provider.languageCode=="ar"?Text(AppLocalizations.of(context)!.arabic,style:Theme.of(context).textTheme.bodyMedium):Text(AppLocalizations.of(context)!.arabic,style: TextStyle( color:provider.isDark?MainColors.whited:Colors.black54)  ),
                    Spacer(),
                    provider.languageCode=="ar"?Icon(Icons.done,color: MainColors.secondryLightColor,size: 35,):SizedBox.shrink(),
                  ],
                )),

              ],
            ),
          ),
        );
      },
      );
    }
    showThemingBottomSheet(context) {
      showModalBottomSheet(
        backgroundColor:Theme.of(context).colorScheme.onPrimary,
        isScrollControlled: true,
        shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Theme.of(context).colorScheme.onSurface,)
        ),
        context: context, builder: (context) {
        return Container(height: MediaQuery.of(context).size.height * 0.5,
          child:Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(onTap: () {
                  provider.ChangeMode(false);
                },child: Row(
                  children: [
                    provider.isDark==false?Text(AppLocalizations.of(context)!.light,style: Theme.of(context).textTheme.bodyMedium):Text(AppLocalizations.of(context)!.light,style: TextStyle(color:provider.isDark?MainColors.whited:Colors.black54) ),
                    Spacer(),
                    provider.isDark==false?Icon(Icons.done,color: MainColors.secondryLightColor,size: 35,):SizedBox.shrink(),
                  ],
                )),
                SizedBox(height: 25,),
                InkWell(onTap: () {
                  provider.ChangeMode(true);
                  // AppLocalizations.of(context)!.localeName=Locale("en");
                  // setState(() {});
                },child: Row(
                  children: [
                    provider.isDark==true?Text(AppLocalizations.of(context)!.dark,style:Theme.of(context).textTheme.bodyMedium):Text(AppLocalizations.of(context)!.dark,style: TextStyle(color:provider.isDark?MainColors.whited:Colors.black54) ),
                    Spacer(),
                    provider.isDark==true?Icon(Icons.done,color: MainColors.secondryLightColor,size: 35,):SizedBox.shrink(),
                  ],
                )),

              ],
            ),
          ),
        );
      },
      );
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Stack(
          children: [
            Container(
              padding: EdgeInsets.all(38),
              child: Text(AppLocalizations.of(context)!.settings,style: Theme.of(context).textTheme.bodyLarge),
              height: MediaQuery.of(context).size.height*0.18,
              width: double.infinity,
              color: Theme.of(context).colorScheme.onSecondary,
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(AppLocalizations.of(context)!.language,style:provider.isDark ?Theme.of(context).textTheme.bodySmall?.copyWith(color: MainColors.whited):Theme.of(context).textTheme.bodySmall,),
              InkWell(
                onTap: () {
                  showLanguageBottomSheet(context);
                },
                child: Container(
                    margin: EdgeInsets.all(18),
                    width: double.infinity,
                    decoration: BoxDecoration(
                         color: Theme.of(context).colorScheme.error,
                        borderRadius: BorderRadius.circular(0),
                        border: Border.all(color: MainColors.secondryLightColor)
                    ), child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: provider.languageCode == "en" ? Text(
                      AppLocalizations.of(context)!.english,style: TextStyles.lightTextTheme.bodyMedium,) : Text(
                      AppLocalizations.of(context)!.arabic,style: TextStyles.lightTextTheme.bodyMedium,),

                  // child: AppLocalizations.of(context)!.localeName == "en" ? Text(
                  //     AppLocalizations.of(context)!.english) : Text(
                  //     AppLocalizations.of(context)!.arabic),

                )),
              ),
              SizedBox(height: 10,),
              Text(AppLocalizations.of(context)!.theming,style:provider.isDark ?Theme.of(context).textTheme.bodySmall?.copyWith(color: MainColors.whited):Theme.of(context).textTheme.bodySmall,),
              InkWell(
                onTap: () {
                  showThemingBottomSheet(context);
                },
                child: Container(
                    margin: EdgeInsets.all(18),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.error,
                        borderRadius: BorderRadius.circular(0),
                        border: Border.all(color: MainColors.secondryLightColor)
                    ), child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: provider.isDark ? Text(
                      AppLocalizations.of(context)!.dark,style: TextStyles.lightTextTheme.bodyMedium,) : Text(
                      AppLocalizations.of(context)!.light,style: TextStyles.lightTextTheme.bodyMedium,),

                  // child: ThemeMode.system == ThemeMode.light ? Text(
                  //     AppLocalizations.of(context)!.light) : Text(
                  //     AppLocalizations.of(context)!.dark),

                )),
              ),
            ],
          ),
        )
        // Container(color: Colors.red,),
      ],
    );
  }
}