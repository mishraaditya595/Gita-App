import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:sbg/models/books_model.dart';
import 'package:sbg/ui/libraryhome/provider/library_home_provider.dart';
import 'package:sbg/ui/widgets/book_card_widget.dart';
import 'package:sbg/ui/widgets/default_app_bar.dart';

import '../../../utils/hexcolor.dart';
import '../../libraryhome/services/library_services.dart';
import '../../widgets/book_count_widget.dart';
import '../../widgets/library_book_card_widget.dart';
import '../provider/library_page_provider.dart';

class LibraryPage extends StatefulWidget {
  static const String routeName = "/library";
  const LibraryPage({Key? key}) : super(key: key);

  @override
  State<LibraryPage> createState() => _LibraryPageState();
}

class _LibraryPageState extends State<LibraryPage> {

  // List<BooksModel> booksModelList = [];
  //
  // @override
  // void initState() {
  //   LibraryService libraryService = GetIt.instance.get<LibraryService>();
  //   booksModelList = libraryService.getAllBooks();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LibraryPageProvider>(
        create: (context) => LibraryPageProvider(),
      child: Consumer<LibraryPageProvider>(builder: (context, provider, child) {
        return      Scaffold(
          appBar: DefaultAppBar(title: "Library"),
          body: FutureBuilder(
            future: provider.getAll(),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              if(snapshot.connectionState == ConnectionState.done) {
                return  SingleChildScrollView(
                  child: Column(
                    children: [
                      BookCountWidget(
                        bookCount: provider.booksModelList.length,
                      ),
                      GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: provider.booksModelList.length < 3 ? provider.booksModelList.length : 3,
                          mainAxisExtent: 230,
                        ),
                        physics: const ClampingScrollPhysics(),
                        itemCount: provider.booksModelList.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return LibraryBookCardWidget(booksModel: provider.booksModelList[index],);
                        },
                      ),

                    ],
                  ),
                );
            } else {
                return CircularProgressIndicator();
              }
            },

          )

        );

      },)
    );


  }
}
