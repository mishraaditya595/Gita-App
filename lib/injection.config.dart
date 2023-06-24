// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:sbg/services/db/database_service.dart' as _i4;
import 'package:sbg/services/db/dbstore.dart' as _i3;
import 'package:sbg/services/notifications/firebase/firebase_messaging_service.dart'
    as _i5;
import 'package:sbg/services/remote_config_service.dart' as _i8;
import 'package:sbg/ui/bookmark/service/bookmark_service.dart' as _i10;
import 'package:sbg/ui/chapter/services/chapter_screen_service.dart' as _i11;
import 'package:sbg/ui/homepage/services/home_page_services.dart' as _i6;
import 'package:sbg/ui/loading/service/loading_service.dart' as _i7;
import 'package:sbg/ui/verse/services/verse_screen_service.dart'
    as _i9; // ignore_for_file: unnecessary_lambdas

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
    gh.singleton<_i3.DBStore>(_i3.DBStore());
    gh.singleton<_i4.DatabaseService<dynamic>>(
        _i4.DatabaseService<dynamic>(gh<_i3.DBStore>()));
    gh.singleton<_i5.FirebaseMessagingService>(_i5.FirebaseMessagingService());
    gh.singleton<_i6.HomePageServices>(
        _i6.HomePageServices(gh<_i4.DatabaseService<dynamic>>()));
    gh.singleton<_i7.LoadingService>(
        _i7.LoadingService(gh<_i4.DatabaseService<dynamic>>()));
    gh.singleton<_i8.RemoteConfigService>(_i8.RemoteConfigService());
    gh.singleton<_i9.VerseScreenService>(
        _i9.VerseScreenService(gh<_i4.DatabaseService<dynamic>>()));
    gh.singleton<_i10.BookmarkService>(
        _i10.BookmarkService(gh<_i4.DatabaseService<dynamic>>()));
    gh.singleton<_i11.ChapterScreenService>(
        _i11.ChapterScreenService(gh<_i4.DatabaseService<dynamic>>()));
    return this;
  }
}
