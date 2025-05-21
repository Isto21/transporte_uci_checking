import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:transporte_uci_checking/config/router/router_path.dart';
import 'package:transporte_uci_checking/presentation/providers/home/home_page_provider.riverpod.dart';

const Color disableIcon = Color(0xffC58664);

class CustomNavBar extends ConsumerWidget {
  const CustomNavBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int currentIndex = ref.watch(homePageProvider);
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 0, top: 5),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxHeight: 100, minHeight: 70),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(40),
          child: BlurFilter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      if (currentIndex != 0) {
                        ref.read(homePageProvider.notifier).state = 0;
                        context.go(RouterPath.HomePage);
                      }
                    },
                    child: BottomNavBarIcon(isActive: currentIndex == 0),
                  ),
                  const SizedBox(width: 8),
                  InkWell(
                    onTap: () {
                      if (currentIndex != 1) {
                        ref.read(homePageProvider.notifier).state = 1;
                        context.go(RouterPath.HomePage);
                      }
                    },
                    child: BottomNavBarIcon(isActive: currentIndex == 1),
                  ),
                  const SizedBox(width: 8),
                  InkWell(
                    onTap: () {
                      if (currentIndex != 2) {
                        ref.read(homePageProvider.notifier).state = 2;
                        context.go(RouterPath.HomePage);
                      }
                    },
                    child: BottomNavBarIcon(isActive: currentIndex == 2),
                  ),
                  const SizedBox(width: 8),
                  InkWell(
                    onTap: () {
                      if (currentIndex != 3) {
                        ref.read(homePageProvider.notifier).state = 3;
                        context.go(RouterPath.HomePage);
                      }
                    },
                    child: BottomNavBarIcon(isActive: currentIndex == 3),
                  ),
                  const SizedBox(width: 8),
                  InkWell(
                    onTap: () {
                      if (currentIndex != 4) {
                        ref.read(homePageProvider.notifier).state = 4;
                        context.go(RouterPath.HomePage);
                      }
                    },
                    child: BottomNavBarIcon(
                      image: "assets/womanPic.png",
                      isActive: currentIndex == 4,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class BottomNavBarIcon extends StatelessWidget {
  final String? svgIcon;
  final String? image;
  final bool isActive;

  const BottomNavBarIcon({
    super.key,
    this.svgIcon,
    this.image,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return
    // ConstrainedBox(
    //   constraints: const BoxConstraints(maxHeight: 55, minHeight: 55),
    //   child: ClipRRect(
    //     borderRadius: BorderRadius.circular(100),
    //     child:
    Container(
      padding:
          (svgIcon == null)
              ? const EdgeInsets.all(0)
              : const EdgeInsets.all(16),
      height: 55,
      width: 55,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: isActive ? const Color(0xffD94D01) : disableIcon,
      ),
      child:
          (svgIcon != null)
              ? SvgPicture.asset(svgIcon!)
              : (image == null)
              ? CircleAvatar(
                backgroundColor: isActive ? Colors.white : disableIcon,
                child: Icon(
                  Icons.person,
                  color:
                      (isActive)
                          ? const Color(0xffD94D01)
                          : const Color(0xffC58664),
                ),
              )
              : Image.asset(image!, fit: BoxFit.cover),
    );
    //   ),
    // );
    //SvgPicture.asset('assets/icons/cilinder_home_icon.svg',);
  }
}

class BlurFilter extends StatelessWidget {
  final Widget child;
  final double sigmaX;
  final double sigmaY;
  const BlurFilter({
    super.key,
    required this.child,
    this.sigmaX = 4.0,
    this.sigmaY = 4.0,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        child,
        ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: sigmaX, sigmaY: sigmaY),
            child: child,
          ),
        ),
      ],
    );
  }
}
