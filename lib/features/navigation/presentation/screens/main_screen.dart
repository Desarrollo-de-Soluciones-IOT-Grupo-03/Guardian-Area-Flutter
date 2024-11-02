import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:guardianarea/features/navigation/presentation/widgets/custom_app_bar.dart';
import 'package:guardianarea/features/navigation/presentation/widgets/custom_bottom_nav_bar.dart';

class MainScreen extends ConsumerWidget {
  final Widget child; // Agregamos child como parámetro

  const MainScreen({super.key, required this.child});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: child,
      bottomNavigationBar: const CustomBottomNavBar(),
    );
  }
}