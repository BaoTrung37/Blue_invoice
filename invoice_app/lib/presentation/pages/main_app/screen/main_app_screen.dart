import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invoice_app/gen/assets.gen.dart';
import 'package:invoice_app/presentation/resources/app_colors.dart';

@RoutePage()
class MainAppScreen extends StatelessWidget {
  const MainAppScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: AutoRouter(),
      bottomNavigationBar: _BottomBarView(),
    );
  }
}

class _BottomBarView extends StatelessWidget {
  const _BottomBarView();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: context.colors.backgroundSecondary,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20.r),
          topLeft: Radius.circular(20.r),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildAppLogo(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Row(
              children: [
                Assets.icons.iconSun.svg(height: 24.h),
                16.horizontalSpace,
                VerticalDivider(
                  color: context.colors.action,
                  thickness: 0.5,
                ),
                16.horizontalSpace,
                CircleAvatar(
                  radius: 20.r,
                  backgroundImage: Assets.images.imageAvatar.provider(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAppLogo() {
    return SizedBox(
      height: 90.r,
      width: 90.r,
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20.r),
          topLeft: Radius.circular(20.r),
          bottomRight: Radius.circular(20.r),
        ),
        child: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                color: Color(0xFF7C5DFA),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                height: 45.r,
                width: 90.r,
                decoration: BoxDecoration(
                  color: const Color(0xFF9277FF),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.r),
                  ),
                ),
              ),
            ),
            Positioned.fill(
              child: Center(
                child: Container(
                  child: Assets.icons.logo.svg(height: 40.h),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
