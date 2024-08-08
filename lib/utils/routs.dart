import 'package:get/get.dart';
import 'package:oswal/controller/forgot_controller.dart';
import 'package:oswal/pages/search/search_page.dart';
import 'package:oswal/pages/search/solar_pump_details_page.dart';
import 'package:oswal/pages/splash_page.dart';
import 'package:oswal/pages/surveys/camera_page.dart';
import 'package:oswal/pages/surveys/site_survey_page.dart';

import '../pages/auth/forgot_page.dart';
import '../pages/auth/login_page.dart';
import '../pages/home_page.dart';
import '../pages/surveys/asset_mapping.dart';
import '../pages/surveys/dispatch_page.dart';
import '../pages/surveys/ic_photos.dart';

class AppRouts {
  static const String splash = '/splash';
  static const String home = '/home';
  static const String login = '/login';
  static const String forgot = '/forgot';
  static const String search = '/search';
  static const String solarDetails = '/solarDetails';
  static const String siteSurvey = '/siteSurvey';
  static const String dispatch = '/dispatch';
  static const String assetMapping = '/assetMapping';
  static const String icPhotos = '/icPhotos';
  static const String camera = '/camera';

  static final List<GetPage> routes = [
    GetPage(
      name: home,
      page: () => const HomePage(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: login,
      page: () => const LoginPage(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
        name: forgot,
        page: () => const ForgotPage(),
        transition: Transition.rightToLeft,
        binding: BindingsBuilder(
          () {
            Get.put(ForgotController());
          },
        )),
    GetPage(
      name: splash,
      page: () => const SplashPage(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: search,
      page: () => const SearchPage(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: solarDetails,
      page: () => const SolarDetailPage(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: siteSurvey,
      page: () => const SiteSurveyPage(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: dispatch,
      page: () => const DispatchPage(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: assetMapping,
      page: () => const AssetMappingPage(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: icPhotos,
      page: () => const IcPhotosPage(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: camera,
      page: () => const CameraPage(),
      transition: Transition.rightToLeft,
    ),
  ];

  static const initialRoute = splash;
}
