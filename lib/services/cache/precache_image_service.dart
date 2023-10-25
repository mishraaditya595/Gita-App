import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'package:sbg/models/books_model.dart';
import 'package:sbg/ui/libraryhome/services/library_services.dart';

import '../db/database_service.dart';

@Singleton()
class PrecacheImageService {
  late DatabaseService databaseService;

  PrecacheImageService(this.databaseService);

  int cacheCount = 0;

  void startImagePrecache({required BuildContext context}) {
    LibraryService libraryService = GetIt.instance.get<LibraryService>();
    List<BooksModel> booksList = libraryService.getAllBooks();

    for(BooksModel book in booksList) {
      if(book.bookImage.isNotEmpty) {
        cacheImage(imageUrl: book.bookImage, context: context);
      }
    }

    print("Images cached count: $cacheCount");
  }

  void cacheImage({required String imageUrl, required BuildContext context}) {
    try {
      if(imageUrl.contains("https")) {
        precacheImage(
            CachedNetworkImageProvider(
                imageUrl,
              errorListener: (e) {
                debugPrint("error in caching image for $imageUrl with exception: $e");
              }
            ),
            context
        );
        cacheCount++;
      }
    } on Exception catch(e) {
      debugPrint("error in caching image for $imageUrl with exception: $e");
    }
  }
}
