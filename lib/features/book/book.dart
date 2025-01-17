import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ketabna/bloc/cubit/auth_cubit.dart';
import 'package:ketabna/core/constants/strings.dart';
import 'package:ketabna/core/models/book_model.dart';

class BookScreen extends StatelessWidget {
  const BookScreen({Key? key, required this.bookModel}) : super(key: key);
  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(builder: (context, state) {
      var cubit = AuthCubit.get(context);
      return Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: const Color(0xfff5b53f),
              expandedHeight: 250,
              leading: IconButton(
                  icon: const Icon(
                    Icons.arrow_back_ios_sharp,
                    color: Colors.black26,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
              title: Text(bookModel.name!),
              centerTitle: true,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.network(
                  bookModel.picture!,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: ClipRRect(
                // borderRadius: BorderRadius.circular(15),
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          bookModel.name!,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'By : ${bookModel.authorName}',
                              style: const TextStyle(
                                color: Colors.black54,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              bookModel.category!,
                              style: const TextStyle(
                                color: Colors.black54,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  color: Colors.white,
                  height: 100,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Container(
                    child: Text(
                      bookModel.describtion ?? '',
                      style: const TextStyle(
                        color: Colors.black54,
                        fontSize: 22.5,
                      ),
                    ),
                    color: Colors.black26,
                    height: 750,
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    child: MaterialButton(
                      onPressed: () {
                        //view Profile
                        cubit
                            .getUserModelByOwnerUid(bookModel.ownerUid!)
                            .then((value) {
                          Navigator.pushNamed(context, visitorScreen,
                              arguments: value);
                        });
                      },
                      color: const Color(0xfff5b53f),
                      child: const Text(
                        'View Owner Profile',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                    ),
                    color: Colors.black26,
                    height: 75,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
      // appBar: AppBar(
      //   elevation: 0.0,
      //   backgroundColor: Colors.white,
      //   leading:IconButton(
      //     splashColor: Colors.grey,
      //     onPressed: (){},
      //     icon: const Icon(
      //       Icons.arrow_back_ios_sharp ,
      //       color: Color(0xfff5b53f),
      //     ),
      //   ),
      // ),