import 'package:custom_bloc_state_management/business/bloc/CartListBloc.dart';
import 'package:custom_bloc_state_management/business/bloc/local_db/products/InsertCartBloc.dart';
import 'package:custom_bloc_state_management/data/repos/local_db/products/CartsRepoImpl.dart';
import 'package:custom_bloc_state_management/models/dto/CartsDTO.dart';
import 'package:custom_bloc_state_management/models/dto/ResourceResult.dart';
import 'package:custom_bloc_state_management/models/dto/local_db/LocalCartDTO.dart';
import 'package:custom_bloc_state_management/models/products/CartModel.dart';
import 'package:custom_bloc_state_management/presentation/widgets/base/BaseStatefulWidgetState4Bloc.dart';
import 'package:flutter/material.dart';

import '../CartScreen.dart';

const String TAG = "ExampleScreen";

class ExampleScreen extends StatefulWidget {
  const ExampleScreen({Key? key}) : super(key: key);

  @override
  _ExampleScreenState createState() => _ExampleScreenState();
}

class _ExampleScreenState extends BaseStatefulWidgetState4BLoC<ExampleScreen,
    CartListBloc, List<CartModel>> {
  @override
  void initBloc(BuildContext context) {
    this.bloc = CartListBloc(CartsRepoImpl());
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      this._dto();
    });
  }

  void _dto() {
    var dto = CartsDTO();
    this.bloc?.performOperation(dto);
  }

  Widget _buildSuccess(BuildContext context, List<CartModel>? data) {
    InsertCartBloc().performOperation(LocalCartDTO(cartModel: data!));
    print("Total server cart lenght >>>${data.length}");
    return CartScreen(data: data);
  }

  Widget buildLoadingIndicator() => Center(child: CircularProgressIndicator());

  @override
  Widget displayResult(
    BuildContext context,
    ResourceResult<List<CartModel>>? result,
  ) {
    if (result != null) {
      switch (result.state!) {
        case ResourceState.LOADING:
          return buildLoadingIndicator();
        case ResourceState.SUCCESS:
          return this._buildSuccess(context, result.data);
        case ResourceState.ERROR:
          return this.empty("Error");
        case ResourceState.INITIAL:
          return buildLoadingIndicator();
      }
    }
    return buildLoadingIndicator();
  }
}
