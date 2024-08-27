import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:location/location.dart';
import 'package:sel_org/ui_1/account/account_bloc.dart';
import 'package:sel_org/ui_1/account/account_screen.dart';
import 'package:sel_org/ui_1/account/address/address_bloc.dart';
import 'package:sel_org/ui_1/account/customer_support/customer_bloc.dart';
import 'package:sel_org/ui_1/account/customer_support/customer_screen.dart';
import 'package:sel_org/ui_1/account/general_info/general_bloc.dart';
import 'package:sel_org/ui_1/account/general_info/general_screen.dart';
import 'package:sel_org/ui_1/account/notification/notification_bloc.dart';
import 'package:sel_org/ui_1/account/notification/notification_screen.dart';
import 'package:sel_org/ui_1/account/orders/Delivery_Details/orderDeliveredScreen.dart';
import 'package:sel_org/ui_1/account/orders/Delivery_Details/order_details_bloc.dart';
import 'package:sel_org/ui_1/account/orders/Delivery_Details/ordercancelledscreen.dart';

import 'package:sel_org/ui_1/account/orders/orders_bloc.dart';
import 'package:sel_org/ui_1/account/orders/orders_entity/order_model.dart';

import 'package:sel_org/ui_1/account/orders/orders_screen.dart';
import 'package:sel_org/ui_1/account/profile/profile_bloc.dart';
import 'package:sel_org/ui_1/account/profile/profile_screen.dart';
import 'package:sel_org/ui_1/account/refunds/refund_bloc.dart';
import 'package:sel_org/ui_1/account/refunds/refund_screen.dart';
import 'package:sel_org/ui_1/cart/cart_screen.dart';
import 'package:sel_org/ui_1/dashboard/product_search/search_bloc.dart';
import 'package:sel_org/ui_1/dashboard/product_search/search_screen.dart';
import 'package:sel_org/ui_1/login/login_bloc.dart';
import 'package:sel_org/ui_1/login/login_screen_binding/login_page/login_screen.dart';
import 'package:sel_org/ui_1/login/login_screen_binding/otp_page/otp_screen.dart';

import 'package:sel_org/ui_1/product_detail/product_detail_screen.dart';
import 'package:sel_org/ui_1/banner_products/banner_bloc.dart';
import 'package:sel_org/ui_1/banner_products/banner_screen.dart';
import 'package:sel_org/ui_1/splash/splash_bloc.dart';
import 'package:sel_org/ui_1/splash/splash_screen.dart';

import 'package:sel_org/ui_1/sub_categories/subcategory_bloc.dart';
import 'package:sel_org/ui_1/sub_categories/subcategory_screen.dart';
import 'package:sel_org/ui_1/user_location_address/add_address_binding/add_address_bloc.dart';
import 'package:sel_org/ui_1/user_location_address/add_address_binding/add_address_details/add_address_sreen.dart';
import 'package:sel_org/ui_1/user_location_address/location_address_binding/get_user_location/get_location_screen.dart';
import 'package:sel_org/ui_1/user_location_address/location_address_binding/location_info/location_info_bloc.dart';
import 'package:sel_org/ui_1/user_location_address/location_address_bloc.dart';
import 'package:sel_org/utils/reusable_widgets/product_pack/product_bloc.dart';

import '../ui_1/account/address/address_screen.dart';
import '../ui_1/account/general_info/privacy_policy/privacy_screen.dart';
import '../ui_1/account/general_info/terms_conditions/terms_condtions_screen.dart';
import '../ui_1/dashboard/cart/cart_bloc.dart';
import '../ui_1/dashboard/category/category_bloc.dart';
import '../ui_1/dashboard/category/category_screen.dart';
import '../ui_1/dashboard/homepage/homepage_bloc.dart';
import '../ui_1/dashboard/homepage/homepage_screen.dart';
import '../ui_1/user_location_address/location_address_binding/location_info/location_info_screen.dart';

class AppRouter {
  // static var customerId;

  // Initialize authentication
  // static Future<void> auth() async {
  //   final storageService = StorageServiceImpl();
  //   final customerId1 =
  //       await storageService.getValue(key: AppConstantValues().customerId);
  //   customerId = customerId1;
  // }
  // AppRouter._();
  // // Singleton instance
  // static final AppRouter _instance = AppRouter._();
  // // Getter to access the instance
  // static AppRouter get instance => _instance;

  final GoRouter router = GoRouter(
    initialLocation: '/',
    routes: <RouteBase>[
      GoRoute(
          // path: '/',
          path: SplashScreen.routeName,
          builder: (context, state) {
            return BlocProvider<SplashBloc>(
              create: (context) => SplashBloc(),
              child: SplashScreen(),
            );
          }),
      GoRoute(
          //path: '/',
          path: LoginScreenPage.routeName,
          builder: (context, state) {
            return BlocProvider<LoginBloc>.value(
              value: LoginBloc(),
              child: const LoginScreenPage(),
            );
          }),
      GoRoute(
          //path: '/',
          path: OtpPageScreen.routeName,
          builder: (context, state) {
            return BlocProvider<LoginBloc>.value(
              value: LoginBloc(),
              child: const OtpPageScreen(),
            );
          }),
      GoRoute(
          //path: '/',
          path: GetLocationScreen.routeName,
          builder: (context, state) {
            return BlocProvider<GetLocationBloc>.value(
              value: GetLocationBloc(),
              child: const GetLocationScreen(),
            );
          }),
      GoRoute(
          //path: '/',
          path: LocationInformationScreen.routeName,
          builder: (context, state) {
            return BlocProvider<LocationInfoBloc>.value(
              value:
                  LocationInfoBloc(locationData: state.extra as LocationData),
              child: const LocationInformationScreen(),
            );
          }),
      GoRoute(
          path: '/',
          // path: HomepageScreen.routeName,
          builder: (context, state) {
            return BlocProvider<HomepageBloc>(
              create: (context) => HomepageBloc(),
              child: const HomepageScreen(),
            );
          }),
      GoRoute(
          // path: '/',
          path: SearchScreen.routeName,
          builder: (context, state) {
            return BlocProvider<SearchBloc>.value(
              value: SearchBloc(),
              child: const SearchScreen(),
            );
          }),
      GoRoute(
          //path: '/',
          path: AddAddressScreen.routeName,
          builder: (context, state) {
            return BlocProvider<AddAddressBloc>.value(
              value: AddAddressBloc(),
              child: const AddAddressScreen(),
            );
          }),
      GoRoute(
          //path: '/',
          path: SubCategoryScreen.routeName,
          builder: (context, state) {
            return BlocProvider<SubCategoryBloc>.value(
              value: SubCategoryBloc(state.extra as String),
              child: const SubCategoryScreen(),
            );
          }),
      GoRoute(
          //path: '/',
          path: BannerScreen.routeName,
          builder: (context, state) {
            return BlocProvider<BannerBloc>.value(
              value: BannerBloc(),
              child: const BannerScreen(),
            );
          }),
      GoRoute(
          //path: '/',
          path: ProductDetailScreeen.routeName,
          builder: (context, state) {
            return BlocProvider<ProductBloc>.value(
              value: state.extra as ProductBloc,
              child: const ProductDetailScreeen(),
            );
          }),
      GoRoute(
          //  path: '/',
          path: CategoryScreen.routeName,
          builder: (context, state) {
            return BlocProvider<CategoryBloc>.value(
              value: CategoryBloc(),
              child: const CategoryScreen(),
            );
          }),
      GoRoute(
        //path: "/",
        path: CartScreen.routeName,
        builder: (context, state) {
          return BlocProvider<CartBloc>.value(
            value: CartBloc(),
            child: const CartScreen(),
          );
        },
      ),
      GoRoute(
        // path: '/',
        path: AccountScreen.routeName,
        builder: (context, state) {
          return BlocProvider<AccountBloc>(
            create: (context) => AccountBloc(),
            child: const AccountScreen(),
          );
        },
      ),
      GoRoute(
        //path: "/",
        path: OrderScreen.routeName,
        builder: (context, state) {
          return BlocProvider<OrderBloc>.value(
            value: OrderBloc(),
            child: const OrderScreen(),
          );
        },
      ),
      GoRoute(
        //  path: "/",
        path: OrderDeliveredScreen.routeName,
        builder: (context, state) {
          return BlocProvider<Order_DetailsBloc>.value(
            value: Order_DetailsBloc(state.extra as Orderlist),
            child: const OrderDeliveredScreen(),
          );
        },
      ),
      GoRoute(
        //  path: "/",
        path: OrderCancelledScreen.routeName,
        builder: (context, state) {
          return BlocProvider<Order_DetailsBloc>.value(
            value: Order_DetailsBloc(state.extra as Orderlist),
            child: const OrderCancelledScreen(),
          );
        },
      ),
      GoRoute(
        //path: "/",
        path: CustomerScreen.routeName,
        builder: (context, state) {
          return BlocProvider<CustomerBloc>.value(
            value: CustomerBloc(),
            child: const CustomerScreen(),
          );
        },
      ),
      GoRoute(
        //path: '/',
        path: AddressScreen.routeName,
        builder: (context, state) {
          return BlocProvider<AddressBloc>.value(
            value: AddressBloc(),
            child: const AddressScreen(),
          );
        },
      ),
      GoRoute(
          // path: '/',
          path: AddAddressScreen.routeName,
          builder: (context, state) {
            return BlocProvider<AddAddressBloc>.value(
              value: AddAddressBloc(),
              child: const AddAddressScreen(),
            );
          }),
      GoRoute(
        //path: "/",
        path: RefundScreen.routeName,
        builder: (context, state) {
          return BlocProvider<RefundBloc>.value(
            value: RefundBloc(),
            child: const RefundScreen(),
          );
        },
      ),
      GoRoute(
        path: ProfileScreen.routeName,
        builder: (context, state) {
          return BlocProvider<ProfileBloc>.value(
            value: ProfileBloc(),
            child: const ProfileScreen(),
          );
        },
      ),
      GoRoute(
        //path: "/",
        path: GeneralScreen.routeName,
        builder: (context, state) {
          return BlocProvider<GeneralBloc>.value(
            value: GeneralBloc(),
            child: const GeneralScreen(),
          );
        },
      ),
      GoRoute(
        // path: "/",
        path: TermsConditionScreen.routeName,
        builder: (context, state) {
          return BlocProvider<GeneralBloc>.value(
            value: GeneralBloc(),
            child: const TermsConditionScreen(),
          );
        },
      ),
      GoRoute(
        // path: "/",
        path: PrivacyPolicyScreen.routeName,
        builder: (context, state) {
          return BlocProvider<GeneralBloc>.value(
            value: GeneralBloc(),
            child: const PrivacyPolicyScreen(),
          );
        },
      ),
      GoRoute(
        // path: "/",
        path: NotificationScreen.routeName,
        builder: (context, state) {
          return BlocProvider<NotificationBloc>.value(
            value: NotificationBloc(),
            child: const NotificationScreen(),
          );
        },
      ),
    ],
  );
}
