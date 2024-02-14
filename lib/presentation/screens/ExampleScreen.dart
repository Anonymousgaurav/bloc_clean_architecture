import 'package:custom_bloc_state_management/business/bloc/ProductBloc.dart';
import 'package:custom_bloc_state_management/data/repos/ProductsRepoImpl.dart';
import 'package:custom_bloc_state_management/models/dto/ProductDTO.dart';
import 'package:custom_bloc_state_management/models/dto/ResourceResult.dart';
import 'package:custom_bloc_state_management/models/products/ProductsModel.dart';
import 'package:custom_bloc_state_management/network/api/impl/products/ProductsApiImpl.dart';
import 'package:custom_bloc_state_management/presentation/widgets/base/BaseStatefulWidgetState4Bloc.dart';
import 'package:flutter/material.dart';

const String TAG = "ExampleScreen";

class ExampleScreen extends StatefulWidget {
  const ExampleScreen({Key? key}) : super(key: key);


  @override
  _ExampleScreenState createState() => _ExampleScreenState();
}

class _ExampleScreenState extends BaseStatefulWidgetState4BLoC<ExampleScreen,
    ProductBloc, List<ProductsModel>> {
  @override
  void initState() {
    super.initState();
    initBloc(context);
  }

  @override
  void initBloc(BuildContext context) {
    bloc = ProductBloc(
        const ProductsRepoImpl(ProductsApiImpl()));
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      this._call();
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  void _call() {
    ProductDTO productDTO = ProductDTO();
    bloc!
        .processData(ResourceResult(data: null, state: ResourceState.LOADING));
    bloc!.performOperation(productDTO);
  }

  @override
  void didUpdateWidget(covariant ExampleScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
  }


  Widget _buildSuccess(
      BuildContext context, List<ProductsModel>? data) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Text(data?[0].productTitle ?? "Product Not available"),
        ),
      ),
    );
  }

  Widget buildLoadingIndicator() => Center(child: CircularProgressIndicator());


  @override
  Widget displayResult(
      BuildContext context,
      ResourceResult<List<ProductsModel>>? result,
      ) {
    if (result != null) {
      switch (result.state!) {
        case ResourceState.LOADING:
          return buildLoadingIndicator();
        case ResourceState.SUCCESS:
          return this._buildSuccess(context, result.data);
        case ResourceState.ERROR:
          return this
              .empty("Error");
        case ResourceState.INITIAL:
          return buildLoadingIndicator();
      }
    }
    return buildLoadingIndicator();
  }
}
