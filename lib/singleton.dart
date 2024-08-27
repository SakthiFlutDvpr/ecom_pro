class Singleton {
  static final Singleton instance = Singleton._internal();
  bool isDemo = true;

  factory Singleton() {
    return instance;
  }

  Singleton._internal();

// List<DrawerMenuModel> getDrawerMenuList({required BuildContext context}) {
//   return [
//     DrawerMenuModel(
//         menuName: Languages.of(context)!.myVehicle,
//         imagePath: "assets/svg/placeholder.svg",
//         routingName: MyVehicleScreen.routeName),
//     DrawerMenuModel(
//         menuName: Languages.of(context)!.remoteDriving,
//         imagePath: "assets/svg/placeholder.svg",
//         routingName: ''),
//     DrawerMenuModel(
//         menuName: Languages.of(context)!.energy,
//         imagePath: "assets/svg/energy.svg",
//         routingName: EnergyScreen.routeName),
//     DrawerMenuModel(
//         menuName: Languages.of(context)!.ecoSense,
//         imagePath: "assets/svg/ecosense.svg",
//         routingName: ''),
//     DrawerMenuModel(
//         menuName: Languages.of(context)!.navigation,
//         imagePath: "assets/svg/navigation.svg",
//         routingName: ''),
//     DrawerMenuModel(
//         menuName: Languages.of(context)!.sentryMode,
//         imagePath: "assets/svg/sentry_mode.svg",
//         routingName: ""),
//     DrawerMenuModel(
//         menuName: Languages.of(context)!.appStore,
//         imagePath: "assets/svg/appstore.svg",
//         routingName: ""),
//     DrawerMenuModel(
//         menuName: Languages.of(context)!.calendar,
//         imagePath: "assets/svg/calendar.svg",
//         routingName: CalendarPageScreen.routeName),
//     DrawerMenuModel(
//         menuName: Languages.of(context)!.settings,
//         imagePath: "assets/svg/settings.svg",
//         routingName: SettingsScreen.routeName),
//     DrawerMenuModel(
//         menuName: Languages.of(context)!.entertainmentMode,
//         imagePath: "assets/svg/entertainment_mode.svg",
//         routingName: ""),
//     DrawerMenuModel(
//         menuName: Languages.of(context)!.withYouHamesha,
//         imagePath: "assets/svg/placeholder.svg",
//         routingName: ""),
//     DrawerMenuModel(
//         menuName: Languages.of(context)!.helpAndSupport,
//         imagePath: "assets/svg/placeholder.svg",
//         routingName: HelpScreen.routeName),
//     // DrawerMenuModel( //
//     //     menuName: Languages.of(context)!.myAccount,
//     //     routingName: MyAccountScreen.routeName),
//     // DrawerMenuModel(
//     //     menuName: Languages.of(context)!.mySUVInfo,
//     //     routingName: VehicleScreen.routeName),
//     // DrawerMenuModel(
//     //     menuName: Languages.of(context)!.alertConfiguration,
//     //     routingName: AlertConfigurationScreen.routeName),
//     // DrawerMenuModel(
//     //   menuName: Languages.of(context)!.myDocument,
//     //   routingName: EnterPinScreen.routeName,
//     // ),
//     // DrawerMenuModel(
//     //     menuName: Languages.of(context)!.smartHome,
//     //     routingName: '/smart_home_screen'),
//     // DrawerMenuModel(
//     //     menuName: Languages.of(context)!.subscriptionManager,
//     //     routingName: SubscriptionManagerScreen.routeName),
//     // DrawerMenuModel(
//     //     menuName: Languages.of(context)!.calendar,
//     //     routingName: '/calendar_screen'),
//     // DrawerMenuModel(
//     //     menuName: Languages.of(context)!.tripSummary,
//     //     routingName: TripSummaryScreen.routeName),
//     // DrawerMenuModel(
//     //     menuName: Languages.of(context)!.vehicleUsageReport,
//     //     routingName: VechileReportCalender.routeName),
//     // DrawerMenuModel(
//     //     menuName: Languages.of(context)!.roadsideAssistance,
//     //     routingName: '',
//     //     isBottomSheet: true),
//     // DrawerMenuModel(
//     //     menuName: Languages.of(context)!.savedRoutesAndPlace,
//     //     routingName: SavedRoutesPlacesScreen.routeName),
//     // DrawerMenuModel(
//     //     menuName: Languages.of(context)!.serviceBooking,
//     //     routingName: '/service_booking_screen'),
//     // DrawerMenuModel(
//     //     menuName: Languages.of(context)!.settings,
//     //     routingName: SettingsScreen.routeName),
//     // DrawerMenuModel(
//     //     menuName: Languages.of(context)!.help,
//     //     routingName: HelpScreen.routeName),
//   ];
// }
}
