import 'package:custom_bloc_state_management/business/bloc/local_db/products/GetCartBloc.dart';
import 'package:custom_bloc_state_management/models/dto/CartsDTO.dart';
import 'package:custom_bloc_state_management/models/dto/ResourceResult.dart';
import 'package:custom_bloc_state_management/models/products/CartModel.dart';
import 'package:custom_bloc_state_management/presentation/CartScreen.dart';
import 'package:custom_bloc_state_management/presentation/widgets/ExampleScreen.dart';
import 'package:custom_bloc_state_management/presentation/widgets/base/BaseStatefulWidgetState4Bloc.dart';
import 'package:custom_bloc_state_management/resources/ColorsRes.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends BaseStatefulWidgetState4BLoC<HomeScreen,
    GetCartBloc, List<CartModel>> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void initBloc(BuildContext context) {
    this.bloc = GetCartBloc();
  }

  @override
  void didChangeDependencies() {
    loadData();
    super.didChangeDependencies();
  }

  void loadData() {
    this.bloc?.performOperation(CartsDTO());
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget displayResult(
      BuildContext cntxt, ResourceResult<List<CartModel>>? result) {
    result ??= ResourceResult(state: ResourceState.LOADING);
    switch (result.state!) {
      case ResourceState.LOADING:
        return this._buildCategoriesLoading();
      case ResourceState.SUCCESS:
        if (result.data?.length != 0) {
          return this._onLocalDataLoaded(result.data!);
        } else {
          return this._onServerDataLoaded();
        }

      case ResourceState.ERROR:
        return this._onServerDataLoaded();
      case ResourceState.INITIAL:
        return this._buildCategoriesLoading();
    }
  }

  Widget _buildCategoriesLoading() {
    return Container(
      child: this.loading(visible: true),
      color: ColorsRes.backgroundColor,
    );
  }

  Widget _onLocalDataLoaded(List<CartModel> data) {
    return CartScreen(data: data);
  }

  Widget _onServerDataLoaded() {
    return ExampleScreen();
  }
}
