import 'package:custom_bloc_state_management/business/bloc/ContainerPointBloc.dart';
import 'package:custom_bloc_state_management/data/repos/reusables/ContainerPointRepoImpl.dart';
import 'package:custom_bloc_state_management/models/ErrorModel.dart';
import 'package:custom_bloc_state_management/models/dto/ResourceResult.dart';
import 'package:custom_bloc_state_management/models/dto/reusables/ContainerPointDTO.dart';
import 'package:custom_bloc_state_management/models/resuables/ReusableContainerModel.dart';
import 'package:custom_bloc_state_management/network/api/impl/reusables/ContainerPointApiImpl.dart';
import 'package:custom_bloc_state_management/presentation/widgets/base/BaseStatefulWidgetState4Bloc.dart';
import 'package:flutter/material.dart';

const String TAG = "ExampleScreen";

class ExampleScreen extends StatefulWidget {
  const ExampleScreen({Key? key}) : super(key: key);


  @override
  _ExampleScreenState createState() => _ExampleScreenState();
}

class _ExampleScreenState extends BaseStatefulWidgetState4BLoC<ExampleScreen,
    ContainerPointBloc, List<ReusableContainerModel>> {
  @override
  void initState() {
    super.initState();
    initBloc(context);
  }

  @override
  void initBloc(BuildContext context) {
    bloc = ContainerPointBloc(
        const ContainerPointRepoImpl(ContainerPointApiImpl()));
  }

  @override
  void didChangeDependencies() {
    _call(context);
    super.didChangeDependencies();
  }

  void _call(BuildContext context) {
    ContainerPointDTO containerPointDTO = ContainerPointDTO(
      id: 1,
      token: "",
    );
    bloc!
        .processData(ResourceResult(data: null, state: ResourceState.LOADING));
    bloc!.performOperation(containerPointDTO);
  }

  @override
  void didUpdateWidget(covariant ExampleScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  Widget _innerBuild(BuildContext context, List<ReusableContainerModel>? data) {
    print("Success Builddd");
    return _buildContent(data);
  }

  Widget _buildContent(List<ReusableContainerModel>? data) {
    return const SizedBox();
  }

  Widget buildLoadingState(BuildContext context) {
    return Center(
        child: Stack(
      children: <Widget>[
        _innerBuild(context, List.empty(growable: true)),
        const CircularProgressIndicator()
      ],
    ));
  }

  Widget buildInitialState(BuildContext context) {
    return _innerBuild(context, List.empty(growable: true));
  }

  Widget buildSuccessState(
      BuildContext context, List<ReusableContainerModel>? data) {
    return _innerBuild(context, data);
  }

  Widget buildErrorState(BuildContext context, ErrorModel error) {
    return _innerBuild(context, List.empty(growable: true));
  }

  @override
  Widget displayResult(
      BuildContext cntxt, ResourceResult<List<ReusableContainerModel>>? data) {
    switch (data?.state) {
      case ResourceState.SUCCESS:
        return buildSuccessState(cntxt, data!.data);
      case ResourceState.LOADING:
        return buildLoadingState(cntxt);
      case ResourceState.ERROR:
        return buildErrorState(cntxt, data!.error!);
      default:
        return buildInitialState(cntxt);
    }
  }
}
