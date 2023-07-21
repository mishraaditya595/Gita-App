// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:sbg/services/db/database_service.dart' as _i3;
import 'package:sbg/services/device-info/device_info_service.dart' as _i4;
import 'package:sbg/services/notifications/firebase/firebase_messaging_service.dart'
    as _i5;
import 'package:sbg/services/remote_config_service.dart' as _i10;
import 'package:sbg/ui/bookmark/service/bookmark_service.dart' as _i12;
import 'package:sbg/ui/bottombar/services/in_app_review_service.dart' as _i7;
import 'package:sbg/ui/chapter/services/chapter_screen_service.dart' as _i13;
import 'package:sbg/ui/homepage/services/home_page_services.dart' as _i6;
import 'package:sbg/ui/libraryhome/services/library_services.dart' as _i8;
import 'package:sbg/ui/loading/service/loading_service.dart' as _i9;
import 'package:sbg/ui/verse/services/verse_screen_service.dart'
    as _i11; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i3.DatabaseService<dynamic>>(_i3.DatabaseService<dynamic>());
    gh.singleton<_i4.DeviceInfoService>(_i4.DeviceInfoService());
    gh.singleton<_i5.FirebaseMessagingService>(_i5.FirebaseMessagingService());
    gh.singleton<_i6.HomePageServices>(
        _i6.HomePageServices(gh<_i3.DatabaseService<dynamic>>()));
    gh.singleton<_i7.InAppReviewService>(_i7.InAppReviewService());
    gh.singleton<_i8.LibraryService>(
        _i8.LibraryService(gh<_i3.DatabaseService<dynamic>>()));
    gh.singleton<_i9.LoadingService>(
        _i9.LoadingService(gh<_i3.DatabaseService<dynamic>>()));
    gh.singleton<_i10.RemoteConfigService>(_i10.RemoteConfigService());
    gh.singleton<_i11.VerseScreenService>(
        _i11.VerseScreenService(gh<_i3.DatabaseService<dynamic>>()));
    gh.singleton<_i12.BookmarkService>(
        _i12.BookmarkService(gh<_i3.DatabaseService<dynamic>>()));
    gh.singleton<_i13.ChapterScreenService>(
        _i13.ChapterScreenService(gh<_i3.DatabaseService<dynamic>>()));
    return this;
  }
}
