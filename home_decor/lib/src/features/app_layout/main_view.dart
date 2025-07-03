import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_decor/src/core/resources/assets_manager.dart';
import 'package:home_decor/src/core/resources/color_manager.dart';
import 'package:home_decor/src/features/home/presentation/manager/bloc/home_bloc.dart';
import 'package:home_decor/src/features/home/presentation/manager/bloc/home_event.dart';
import 'package:home_decor/src/features/home/presentation/manager/bloc/home_state.dart';
import 'package:home_decor/src/features/home/presentation/pages/home_view_body.dart';

class MainView extends StatelessWidget {
  MainView({super.key});

  final List<Widget> _destinationsItems = [
    NavigationDestination(
      icon: ImageIcon(AssetImage(AssetsManager.homeIcon),color: ColorManager.blackColor,),
      label: '',
    ),
    NavigationDestination(
      icon: ImageIcon(AssetImage(AssetsManager.categoriesIcon),color: ColorManager.blackColor,),
      label: '',
    ),
    NavigationDestination(
      icon: ImageIcon(AssetImage(AssetsManager.cartIcon),color: ColorManager.blackColor,),
      label: '',
    ),
    NavigationDestination(
      icon: ImageIcon(AssetImage(AssetsManager.wishlistIcon),color: ColorManager.blackColor,),
      label: '',
    ),
    NavigationDestination(
      icon: ImageIcon(AssetImage(AssetsManager.profileIcon),color: ColorManager.blackColor,),
      label: '',
    ),
  ];

  final List<Widget> _screens = [
    HomeViewBody(),
    Container(
      color: Colors.blue,
    ),
    Container(
      color: Colors.yellow,
    ),
    Container(
      color: Colors.teal,
    ),
    Container(
      color: Colors.purpleAccent,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return SafeArea(
            child: IndexedStack(
              index:state.selectedBottomNavbarIndex,
              children: _screens,
            ),
          );
        },
      ),
      bottomNavigationBar: BlocBuilder<HomeBloc, HomeState>(
        buildWhen: (previous, current) =>
        previous.selectedBottomNavbarIndex != current.selectedBottomNavbarIndex,
        builder: (context, state) {
          return NavigationBar(
            selectedIndex: state.selectedBottomNavbarIndex,
            destinations: _destinationsItems,
            onDestinationSelected: (index) {
              HomeBloc.get(context).add(
                ChangeHomeNavigationBar(
                  selectedBottomNavbarIndex: index,
                ),
              );
            },
          );
        },
      ),
    );
  }
}
