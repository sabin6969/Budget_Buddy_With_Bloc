import 'package:budgetbuddy_bloc/constants/app_routes.dart';
import 'package:budgetbuddy_bloc/constants/image_path.dart';
import 'package:budgetbuddy_bloc/helpers/firebase_helper.dart';
import 'package:budgetbuddy_bloc/main.dart';
import 'package:budgetbuddy_bloc/pages/dashboard/bloc/dashboard_bloc.dart';
import 'package:budgetbuddy_bloc/pages/profile/bloc/profile_bloc.dart';
import 'package:budgetbuddy_bloc/widgets/custom_app_bar_normal.dart';
import 'package:budgetbuddy_bloc/widgets/custom_auth_button.dart';
import 'package:budgetbuddy_bloc/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

final FirebaseHelper _firebaseHelper = FirebaseHelper();

class _ProfilePageState extends State<ProfilePage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController aboutController = TextEditingController();
  final FocusNode nameFocusNode = FocusNode();
  final FocusNode aboutfocusNode = FocusNode();

  @override
  void initState() {
    if (context.read<ProfileBloc>().state is ProfileInitial) {
      context.read<ProfileBloc>().add(ProfileLoad());
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final bool isDark =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state) {
          if (state is ProfileLoading) {
            nameController.text = "Loading";
            aboutController.text = "Loading";
            return Stack(
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
                const ProfileAvatar(),
                ProfileForm(
                  isDark: isDark,
                  nameController: nameController,
                  nameFocusNode: nameFocusNode,
                  aboutController: aboutController,
                  aboutfocusNode: aboutfocusNode,
                  email: "Loading",
                )
              ],
            );
          } else if (state is ProfileLoaded) {
            nameController.text = state.userModel.userName ?? "Username";
            aboutController.text = state.userModel.about ?? "About";
            return Stack(
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
                ProfileAvatar(
                  imageUrl: state.userModel.profileImageUrl == ""
                      ? null
                      : state.userModel.profileImageUrl,
                ),
                ProfileForm(
                  isDark: isDark,
                  nameController: nameController,
                  nameFocusNode: nameFocusNode,
                  aboutfocusNode: aboutfocusNode,
                  aboutController: aboutController,
                  email: state.userModel.email ?? "Email",
                )
              ],
            );
          } else if (state is ProfileLoadingErorr) {
            return Center(
              child: Text(
                state.message,
                style: Theme.of(context).textTheme.labelMedium,
              ),
            );
          } else {
            nameController.text = "Loading";
            aboutController.text = "Loading";
            return Stack(
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
                const ProfileAvatar(),
                ProfileForm(
                  isDark: isDark,
                  nameController: nameController,
                  nameFocusNode: nameFocusNode,
                  aboutController: aboutController,
                  aboutfocusNode: aboutfocusNode,
                  email: "Loading",
                )
              ],
            );
          }
        },
      ),
    );
  }
}

class ProfileForm extends StatelessWidget {
  const ProfileForm({
    super.key,
    required this.isDark,
    required this.nameController,
    required this.aboutController,
    required this.nameFocusNode,
    required this.aboutfocusNode,
    required this.email,
  });

  final bool isDark;
  final TextEditingController nameController;
  final TextEditingController aboutController;
  final FocusNode nameFocusNode;
  final FocusNode aboutfocusNode;
  final String email;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 310.h,
      child: SizedBox(
        height: size.height * 0.5,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.w),
          child: Column(
            children: [
              Text(
                email,
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
                isEnabled: false,
              ),
              SizedBox(
                height: 20.h,
              ),
              CustomTextFormField(
                isDark: isDark,
                isEnabled: false,
                labelText: "About",
                prefixIcon: Icons.info,
                textEditingController: aboutController,
                textInputType: TextInputType.name,
                currentFocusNode: aboutfocusNode,
              ),
              SizedBox(
                height: 20.h,
              ),
              SizedBox(
                height: 20.h,
              ),
              CustomAuthButton(
                textColor: Colors.white,
                isPrimaryColor: true,
                buttonName: "Log out",
                onPressed: () async {
                  context.read<DashboardBloc>().add(ResetDashboardEvent());
                  context.read<ProfileBloc>().add(ProfileResetEvent());
                  userPreferences.removePreferences().then((value) {
                    _firebaseHelper.signOut().then(
                      (value) {
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          AppRoutes.loginPageRoute,
                          (route) => false,
                        );
                      },
                    );
                  });
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileAvatar extends StatelessWidget {
  const ProfileAvatar({super.key, this.imageUrl});

  final String? imageUrl;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 140.h,
      left: 120.w,
      right: 120.w,
      child: CircleAvatar(
        backgroundColor: Colors.white,
        radius: 65,
        backgroundImage: imageUrl == null
            ? const AssetImage(
                AppImagePath.userImageAvatar,
              )
            : NetworkImage(imageUrl!) as ImageProvider,
      ),
    );
  }
}
