// ignore_for_file: camel_case_types
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../bloc_screen/CategoryCubit.dart';
import '../bloc_states/CategoryState.dart';
import 'webveiw_screen.dart';

class search extends StatelessWidget {
  search({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CategoryCubit>();
    double height = MediaQuery.of(context).size.height; //816.0
    double width = MediaQuery.of(context).size.width; //432.0
    var _controller = TextEditingController();
    return BlocBuilder<CategoryCubit, CategoryState>(builder: (context, state) {
      return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Column(
              children: [
                PreferredSize(
                  preferredSize:
                      Size.fromHeight(kToolbarHeight + (height / 4.08)),
                  child: Stack(
                    fit: StackFit.passthrough,
                    children: [
                      Opacity(
                        opacity: .5,
                        child: ClipPath(
                          clipper: WaveClipper(),
                          child: Container(
                            color: const Color(0xff9873D3),
                            height: (height / 3.709090909090909),
                          ),
                        ),
                      ),
                      ClipPath(
                        clipper: WaveClipper(),
                        child: Container(
                          alignment: Alignment.center,
                          color: const Color(0xff5C3C96),
                          height: (height / 4.08),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                controller: _controller,
                                textInputAction: TextInputAction.done,
                                autofocus: true,
                                cursorWidth: 2,
                                cursorColor: const Color(0xff5C3C96),
                                decoration: InputDecoration(
                                  fillColor: Colors.white,
                                  filled: true,
                                  contentPadding:
                                      const EdgeInsets.fromLTRB(10, 10, 10, 0),
                                  isDense: true,
                                  hintStyle: const TextStyle(fontSize: 20),
                                  hintText: "search",
                                  prefixIcon: IconButton(
                                    onPressed: () {
                                      _controller.clear();
                                      cubit.Searchlist = [];
                                    },
                                    icon: const Icon(
                                      Icons.close,
                                      color: Color(0xff5C3C96),
                                      size: 30,
                                    ),
                                  ),
                                  suffixIcon: const Icon(
                                    Icons.search,
                                    size: 30,
                                    color: Color(0xff5C3C96),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(25),
                                      borderSide: const BorderSide(
                                        color: Color(0xff5C3C96),
                                      )),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(25),
                                      borderSide: const BorderSide(
                                          color: Color(0xff5C3C96))),
                                ),
                                onChanged: (value) {
                                  cubit.searchdata(q: value);
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                    height: MediaQuery.of(context).size.height * .9,
                    child: cubit.loading
                        ? const Center(
                            child: CircularProgressIndicator(
                              color: Color(0xff5C3C96),
                            ),
                          )
                        : Padding(
                            padding: const EdgeInsets.symmetric(vertical: 50),
                            child: ListView.separated(
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15),
                                    child: InkWell(
                                      child: Row(
                                        children: [
                                          Container(
                                              height: MediaQuery.of(context).size.height * 0.17,
                                              width: MediaQuery.of(context).size.width *0.3,
                                              clipBehavior: Clip.antiAlias,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(25),
                                              ),
                                              child: FadeInImage.assetNetwork(
                                                placeholder:
                                                    "assets/images/placeholper_image.jpg",
                                                fit: BoxFit.cover,
                                                image:
                                                    "${cubit.Searchlist[index]["urlToImage"]}",
                                                imageErrorBuilder: (a, b, c) {
                                                  return Image.asset(
                                                      "assets/images/placeholper_image.jpg");
                                                },
                                              )),
                                          SizedBox(
                                            width: MediaQuery.of(context).size.width * 0.02,
                                          ),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "${cubit.Searchlist[index]["title"]}",
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 25,
                                                      color: Color(0xff5C3C96) ),
                                                  maxLines: 3,
                                                ),
                                                Text(
                                                  "${cubit.Searchlist[index]["publishedAt"]}",
                                                  style: const TextStyle(
                                                      fontSize: 15,
                                                      color:Color(0xff9873D3)),
                                                )
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                      onTap: () {
                                        cubit.Url =
                                            cubit.Searchlist[index]["url"];
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const web_screen()));
                                      },
                                    ),
                                  );
                                },
                                separatorBuilder: (context, index) {
                                  return const Divider(color:Color(0xff9873D3));
                                },
                                itemCount: cubit.Searchlist.length),
                          )),
              ],
            ),
          ),
        ),
      );
    });
  }
}

class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    debugPrint(size.width.toString());
    var path = new Path();
    path.lineTo(0, size.height);
    var firstStart = Offset(size.width / 5, size.height);
    var firstEnd = Offset(size.width / 2.5, size.height - 50);
    path.quadraticBezierTo(
        firstStart.dx, firstStart.dy, firstEnd.dx, firstEnd.dy);
    var secondStart =
        Offset(size.width - (size.width / 3.24), size.height - 105);
    var secondEndt = Offset(size.width, size.height - 10);
    path.quadraticBezierTo(
        secondStart.dx, secondStart.dy, secondEndt.dx, secondEndt.dy);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
