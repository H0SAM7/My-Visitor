// ignore_for_file: library_private_types_in_public_api

import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_visitor/bottom_navigator_bar.dart';
import 'package:my_visitor/core/utils/animation_routes.dart';
import 'package:my_visitor/core/utils/assets.dart';
import 'package:my_visitor/core/widgets/custom_button.dart';
import 'package:my_visitor/core/widgets/custom_loading_indecator.dart';
import 'package:my_visitor/features/auth/views/login_view.dart';
import 'package:my_visitor/features/auth/views/register_view.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});
  static const String id = 'OnboardingView';

  @override
  _OnboardingViewState createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  final PageController _pageController = PageController();
  bool isLoading = false;
  int _currentPage = 0;

  final List<String> _images = [
    Assets.imagesSplash1,
    Assets.imagesSplash2,
    Assets.imagesPharaoh,
    Assets.imagesSplash3,
  ];

  @override
  void initState() {
    super.initState();
    // Optional: Auto-scroll every 3 seconds
    _startAutoScroll();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _startAutoScroll() {
    Future.delayed(const Duration(seconds: 3), () {
      if (_currentPage < _images.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
      if (mounted) setState(() {});
      _startAutoScroll(); // Loop
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // PageView for scrolling images
          PageView.builder(
            controller: _pageController,
            itemCount: _images.length,
            onPageChanged: (int page) {
              setState(() {
                _currentPage = page;
              });
            },
            itemBuilder: (context, index) {
              return Image.asset(
                _images[index],
                fit: BoxFit.cover,
              );
            },
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black.withOpacity(0.5),
                  Colors.black.withOpacity(0.7),
                ],
              ),
            ),
          ),
          // Content
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 24.0, vertical: 40.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Discover the Wonders of Ancient Egypt',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'explore the pyramids, temples, and the tombs of pharaoh ',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white70,
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    _images.length,
                    (index) => Container(
                      margin: const EdgeInsets.symmetric(horizontal: 2),
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: index == _currentPage
                            ? Colors.white
                            : Colors.white38,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                isLoading
                    ? CustomLoadingIndicator()
                    : Center(
                        child: CustomButton(
                          title: 'Get Started',
                          color: const Color(0xFFF5A623),
                          txtColor: Colors.black,
                          onTap: () async {
                            setState(() => isLoading = true);
                            try {
                              final user = FirebaseAuth.instance.currentUser;
                              if (user == null) {
                                log('User is currently signed out!');
                                Navigator.push(
                                    context,
                                    AnimationRoutes.flipHorizontalRoute(
                                        LoginView()));
                              } else if (user.emailVerified) {
                                log('User is signed in and email verified!');
                                Navigator.push(
                                    context,
                                    AnimationRoutes.flipHorizontalRoute(
                                        BottomNavigator()));
                              } else {
                                log('User is signed in but email not verified!');
                                Navigator.push(
                                    context,
                                    AnimationRoutes.flipHorizontalRoute(
                                        RegisterView()));
                              }
                            } finally {
                              setState(() => isLoading = false);
                            }
                          },
                        ),
                      ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
