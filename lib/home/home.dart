import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_api_calling/home/bloc/home_bloc.dart';
import 'services/connectivityService.dart';
import 'services/picsumPhotosService.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final _controller = PicsumPhotosService();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(
        RepositoryProvider.of<PicsumPhotosService>(context),
        RepositoryProvider.of<ConnectivityService>(context),
      )..add(LoadApiEvent()),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Picsum Photo Gallery'),
        ),
        body: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state is HomeLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is HomeLoadedState) {
              // return RefreshIndicator(
              //   onRefresh: _controller.getData,
              //   child: SingleChildScrollView(
              //       padding: const EdgeInsets.all(15),
              //       child: _picsumPhotosList(context)),
              // );
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(state.id),
                    Text(state.author),
                    Text(state.url.toString()),
                    ElevatedButton(
                        onPressed: () => BlocProvider.of<HomeBloc>(context)
                            .add(LoadApiEvent()),
                        child: Text('LOAD NEXT'))
                  ],
                ),
              );
            }
            if (state is HomeNoInternetState) {
              return const Center(child: Text('No Internet :('));
            }
            return Container();
          },
        ),
      ),
    );
  }

  Widget _picsumPhotosList(BuildContext context) {
    String message = "empty_message_all_categories_list";
    return SizedBox(
        //height: MediaQuery.of(context).size.height - (kToolbarHeight + 100),
        height: 500,
        width: double.infinity,
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 0.895,
              crossAxisCount: 3,
              //mainAxisSpacing: 15.0,
              crossAxisSpacing: 10.0),
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemCount: _controller.picsumPhotosList.length,
          itemBuilder: (BuildContext context, int index) {
            // if (_controller.hasMoreData && index == (_controller.categoryList.length - 1)) {
            //   WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
            //     _controller.getCategoryList(true);
            //   });
            // }
            return _picsumPhotosGridItemView(_controller.picsumPhotosList[index]);
          },
        ));
  }

  Widget _picsumPhotosGridItemView(PicsumPhotosActivity activity) {
    return Container(
      //height: 117,
        //decoration: getRoundCornerWithShadow(),
        child: InkWell(
            onTap: () {
              //Get.to(() => CategoryItemsPage(category: category));
            },
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.center,
              // mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(activity.id),
                  Text(activity.author),
                  Text(activity.url.toString()),
                  // Expanded(
                  //   flex: 3,
                  //   child: Container(
                  //     alignment: Alignment.center,
                  //     decoration:
                  //     getRoundCornerBorderOnlyTop(bgColor: themeItemBg1),
                  //     child: category.image.isEmpty
                  //         ? imageView(
                  //         imagePath: AssetConstants.imgNotAvailable,
                  //         boxFit: BoxFit.fill)
                  //         : imageViewNetwork(
                  //         imagePath: category.image, boxFit: BoxFit.fill),
                  //   ),
                  // ),
                  // Expanded(
                  //   flex: 1,
                  //   child: Container(
                  //       alignment: Alignment.center,
                  //       decoration: getRoundCornerBorderOnlyBottom(),
                  //       child: textAutoSize(
                  //           width: Get.width,
                  //           text: category.title,
                  //           fontSize: dp12,
                  //           textAlign: TextAlign.center,
                  //           maxLines: 2)),
                  // )
                ]
            )));
  }

}
