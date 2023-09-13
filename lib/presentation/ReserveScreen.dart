import 'package:custom_bloc_state_management/business/bloc/ContainerPointBloc.dart';
import 'package:custom_bloc_state_management/data/repos/reusables/ContainerPointRepoImpl.dart';
import 'package:custom_bloc_state_management/models/ErrorModel.dart';
import 'package:custom_bloc_state_management/models/dto/ResourceResult.dart';
import 'package:custom_bloc_state_management/models/dto/reusables/ContainerPointDTO.dart';
import 'package:custom_bloc_state_management/models/resuables/ReusableContainerModel.dart';
import 'package:custom_bloc_state_management/network/api/impl/reusables/ContainerPointApiImpl.dart';
import 'package:custom_bloc_state_management/presentation/widgets/base/BaseStatefulWidgetState4Bloc.dart';
import 'package:flutter/material.dart';

const String TAG = "ReserveScreen";

class ReserveScreen extends StatefulWidget {
  ReserveScreen({
    required this.storeID,
  });

  final int storeID;

  static const PAGE_NUMBER = 3;

  @override
  _ReserveScreenState createState() => _ReserveScreenState();
}

class _ReserveScreenState extends BaseStatefulWidgetState4BLoC<ReserveScreen,
    ContainerPointBloc, List<ReusableContainerModel>> {
  @override
  void initState() {
    super.initState();
    this.initBloc(this.context);
  }

  @override
  void initBloc(BuildContext context) {
    this.bloc = ContainerPointBloc(
        const ContainerPointRepoImpl(ContainerPointApiImpl()));
  }

  @override
  void didChangeDependencies() {
    this._call(this.context);
    super.didChangeDependencies();
  }

  void _call(BuildContext context) {
    ContainerPointDTO containerPointDTO = ContainerPointDTO(
      id: 1,
      token: "",
    );
    this
        .bloc!
        .processData(ResourceResult(data: null, state: ResourceState.LOADING));
    this.bloc!.performOperation(containerPointDTO);
  }

  @override
  void didUpdateWidget(covariant ReserveScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  Widget _innerBuild(BuildContext context, List<ReusableContainerModel>? data) {
    print("Success Builddd");
    return this._buildContent(data);
  }

  Widget _buildContent(List<ReusableContainerModel>? data) {
    return SizedBox();
  }

  Widget buildLoadingState(BuildContext context) {
    return Center(
        child: Stack(
      children: <Widget>[
        this._innerBuild(context, List.empty(growable: true)),
        CircularProgressIndicator()
      ],
    ));
  }

  Widget buildInitialState(BuildContext context) {
    return this._innerBuild(context, List.empty(growable: true));
  }

  Widget buildSuccessState(
      BuildContext context, List<ReusableContainerModel>? data) {
    return this._innerBuild(context, data);
  }

  Widget buildErrorState(BuildContext context, ErrorModel error) {
    return this._innerBuild(context, List.empty(growable: true));
  }

  @override
  Widget displayResult(
      BuildContext cntxt, ResourceResult<List<ReusableContainerModel>>? data) {
    switch (data?.state) {
      case ResourceState.SUCCESS:
        return this.buildSuccessState(cntxt, data!.data);
      case ResourceState.LOADING:
        return this.buildLoadingState(cntxt);
      case ResourceState.ERROR:
        return this.buildErrorState(cntxt, data!.error!);
      default:
        return this.buildInitialState(cntxt);
    }
  }
}
