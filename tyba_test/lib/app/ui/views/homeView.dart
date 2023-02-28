import 'package:flutter/material.dart';
import 'package:tyba_test/app/blocs/home_bloc.dart';
import 'package:tyba_test/app/ui/base_state.dart';
import 'package:tyba_test/app/ui/widgets/universityBox.dart';
import 'package:tyba_test/app/ui/widgets/universityTile.dart';
import 'package:tyba_test/core/entities/models/university.dart';
import 'package:tyba_test/core/injectors/injector.dart';

class HomeView extends StatefulWidget {
  static const route = "homeView";
  const HomeView({super.key});

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends BaseState<HomeView, HomeBloc> {
  @override
  void onStartup() {}

  @override
  HomeBloc getBlocInstance() {
    return HomeBloc(Injector().provideUserUseCase());
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appSettings.primaryColor,
        title: const Text("Universities"),
        actions: [
          StreamBuilder<ViewType>(
            stream: bloc.viewType,
            initialData: ViewType.listView,
            builder: (BuildContext context, AsyncSnapshot<ViewType> snapshot) {
              switch (snapshot.data) {
                case ViewType.gridView:
                  return _buildViewChanger(() {
                    bloc.changeView(ViewType.listView);
                  });
                default:
                  return _buildViewChanger(() {
                    bloc.changeView(ViewType.gridView);
                  });
              }
            },
          )
        ],
      ),
      body: SafeArea(
        child: _buildHomeContent(),
      ),
    );
  }

  Widget _buildViewChanger(Function() onChange) {
    return IconButton(
        onPressed: onChange,
        icon: const Icon(
          Icons.view_comfortable,
          color: Colors.white,
        ));
  }

  Widget _buildHomeContent() {
    return StreamBuilder<ViewType>(
      stream: bloc.viewType,
      initialData: ViewType.listView,
      builder: (BuildContext context, AsyncSnapshot<ViewType> snapshot) {
        switch (snapshot.data) {
          case ViewType.gridView:
            return _buildGridView();
          default:
            return _buildListView();
        }
      },
    );
  }

  Widget _buildListView() {
    return FutureBuilder<List<University>>(builder: (context, snapshot) {
      if (snapshot.hasData) {
        final items = snapshot.data!;
        return ListView.builder(
            itemBuilder: ((context, index) => UniversityTile(items[index])));
      } else {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
    });
  }

  Widget _buildGridView() {
    return FutureBuilder<List<University>>(
        future: bloc.getUniversities(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final items = snapshot.data!;
            return GridView.builder( 
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemBuilder: (context, index) => UniversityBox(items[index]));
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
