import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:userauthapi/data/response/status.dart';
import 'package:userauthapi/res/colors/app_color.dart';
import 'package:userauthapi/res/components/general_exception.dart';
import 'package:userauthapi/res/components/internet_exceptions_widget.dart';
import 'package:userauthapi/res/routes/routes_name.dart';
import 'package:userauthapi/view_models/controller/home/home_data_view_models.dart';
import 'package:userauthapi/view_models/controller/user_preference/user_prefrence_view_model.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  // final homeControllerlist = Get.put(HomeControllerList());
  final homeControllerData = Get.put(HomeControllerData());

  UserPreference userPreference = UserPreference();

  @override
  void initState() {
    super.initState();
    homeControllerData.userListApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.screenColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 3,
        backgroundColor: AppColor.splashColor,
        title: const Text(
          "Home",
          style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: AppColor.whiteColor),
        ),
        actions: [
          IconButton(
              onPressed: () {
                userPreference.removeUser().then((value) {
                  Get.toNamed(RouteName.loginView);
                });
              },
              icon: const Icon(
                Icons.logout,
                color: AppColor.whiteColor,
              ))
        ],
      ),
      body: Obx(() {
        switch (homeControllerData.rxRequestStatus.value) {
          case Status.LOADING:
            return const Center(child: CircularProgressIndicator());
          case Status.ERROR:
            if (homeControllerData.error.value == 'No internet') {
              return InterNetExceptionWidget(
                onPress: () {
                  homeControllerData.refreshApi();
                },
              );
            } else {
              return GeneralExceptionWidget(onPress: () {
                homeControllerData.refreshApi();
              });
            }
          case Status.COMPLETED:
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: ListView.builder(
                  itemCount: homeControllerData.userData.data?.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 3, vertical: 16),
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColor.whiteColor,
                          borderRadius: BorderRadius.circular(6),
                          boxShadow: const [
                            BoxShadow(
                              offset: Offset(1, 1),
                              color: AppColor.secondaryTextColor,
                              blurRadius: 1,
                              spreadRadius: 1,
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: ListTile(
                            leading: Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                color: AppColor.splashColor,
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(25),
                                child: Stack(
                                  fit: StackFit.expand,
                                  children: [
                                    Image.network(
                                      homeControllerData
                                          .userData.data![index].avatar,
                                      fit: BoxFit.cover,
                                      errorBuilder: (BuildContext context,
                                          Object error,
                                          StackTrace? stackTrace) {
                                        return const Icon(Icons.error,
                                            color: Colors.red, size: 50);
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            title: Text(
                              "${homeControllerData.userData.data![index].firstName} ${homeControllerData.userData.data![index].firstName}",
                              style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: AppColor.blackColor),
                            ),
                            subtitle: Text(
                              homeControllerData.userData.data![index].email,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
            );
        }
      }),
    );
  }
}

// Column(
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 "${homeControllerData.userData.data![index].firstName} ${homeControllerData.userData.data![index].firstName}",
//                                 style: const TextStyle(
//                                     fontSize: 18,
//                                     fontWeight: FontWeight.w600,
//                                     color: AppColor.blackColor),
//                               ),
//                               Image(
//                                   image: NetworkImage(homeControllerData
//                                       .userData.data![index].avatar)),
//                             ],
//                           ),
