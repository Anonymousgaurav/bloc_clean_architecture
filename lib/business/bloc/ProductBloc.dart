import 'dart:io';

import 'package:custom_bloc_state_management/business/ErrorCodes.dart';
import 'package:custom_bloc_state_management/business/bloc/Bloc.dart';
import 'package:custom_bloc_state_management/business/repos/ProductsRepo.dart';
import 'package:custom_bloc_state_management/data/exception/DataException.dart';
import 'package:custom_bloc_state_management/models/dto/ProductDTO.dart';
import 'package:custom_bloc_state_management/models/products/ProductsModel.dart';
import 'package:custom_bloc_state_management/network/exception/TokenException.dart';
import 'package:custom_bloc_state_management/utils/Logger.dart';

const String TAG = "BussinessChallengeBloc";

class ProductBloc
    extends Bloc<ProductDTO, List<ProductsModel>> {
  final ProductsRepo _repo;

  ProductBloc(this._repo) : super();

  @override
  void performOperation(ProductDTO dto) async {
    var res;
    try {
      final data = await this._repo.getProducts();

      res = this.buildResult(data: data);
    } on TokenException catch (te) {
      res = this.buildResult(data: null, code: ErrorCodes.API_ERROR);
    } on DataException catch (de) {
      res = this.buildResult(data: null, code: ErrorCodes.API_ERROR);
    } on IOException catch (ioe) {
      res = this.buildResult(data: null, code: ErrorCodes.API_ERROR);
    } on Exception catch (e) {
      Logger.e(tag: TAG, msg: "performOperation()", error: e);
      res = this.buildResult(data: null, code: ErrorCodes.API_ERROR);
    } finally {
      this.processData(res);
    }
  }


}
