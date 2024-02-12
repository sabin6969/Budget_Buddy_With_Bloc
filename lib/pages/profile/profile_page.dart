import 'package:budgetbuddy_bloc/constants/app_routes.dart';
import 'package:budgetbuddy_bloc/main.dart';
import 'package:budgetbuddy_bloc/widgets/custom_app_bar_normal.dart';
import 'package:budgetbuddy_bloc/widgets/custom_auth_button.dart';
import 'package:budgetbuddy_bloc/widgets/custom_text_form_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController aboutController = TextEditingController();
  final FocusNode nameFocusNode = FocusNode();
  final FocusNode aboutfocusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    final bool isDark =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: size.height,
            width: size.width,
            color: Theme.of(context).scaffoldBackgroundColor,
          ),
          customAppBarNormal(
            context: context,
            size: size,
            title: "Profile",
            hasNavigation: false,
          ),
          Positioned(
            top: 140.h,
            left: 120.w,
            right: 120.w,
            child: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 65,
              backgroundImage: const NetworkImage(
                "https://www.gethucinema.com/wp-content/uploads/2022/01/HellyShah-571.jpg",
              ),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.bottomRight,
                    child: CircleAvatar(
                      radius: 18,
                      backgroundColor: Colors.white70,
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          CupertinoIcons.camera,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 310.h,
            child: SizedBox(
              height: size.height * 0.5,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.w),
                child: Column(
                  children: [
                    Text(
                      "youremail@gmail.com",
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    CustomTextFormField(
                      isDark: isDark,
                      labelText: "Name",
                      prefixIcon: Icons.person,
                      textEditingController: nameController,
                      textInputType: TextInputType.name,
                      currentFocusNode: nameFocusNode,
                      nextFocusNode: aboutfocusNode,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    CustomTextFormField(
                      isDark: isDark,
                      labelText: "About",
                      prefixIcon: Icons.info,
                      textEditingController: nameController,
                      textInputType: TextInputType.name,
                      currentFocusNode: aboutfocusNode,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    CustomAuthButton(
                      textColor: Colors.white,
                      isPrimaryColor: true,
                      buttonName: "Update info",
                      onPressed: () {},
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    CustomAuthButton(
                      textColor: Colors.white,
                      isPrimaryColor: true,
                      buttonName: "Log out",
                      onPressed: () async {
                        userPreferences.removePreferences().then(
                          (value) {
                            Navigator.pushNamedAndRemoveUntil(
                              context,
                              AppRoutes.loginPageRoute,
                              (route) => false,
                            );
                          },
                        );
                      },
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
