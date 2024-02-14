import 'dart:io';

import 'package:custom_bloc_state_management/business/repos/ProductsRepo.dart';
import 'package:custom_bloc_state_management/business/repos/reusables/ContainerPointRepo.dart';
import 'package:custom_bloc_state_management/data/exception/DataException.dart';
import 'package:custom_bloc_state_management/models/products/ProductsModel.dart';
import 'package:custom_bloc_state_management/models/resuables/ReusableContainerModel.dart';
import 'package:custom_bloc_state_management/network/api/IGetProductsApi.dart';
import 'package:custom_bloc_state_management/network/api/reusable/IGetContainerApi.dart';
import 'package:custom_bloc_state_management/network/exception/TokenException.dart';
import 'package:custom_bloc_state_management/utils/Logger.dart';

const TAG = "ProductsRepoImpl";

class ProductsRepoImpl implements ProductsRepo {
  final IGetProductsApi _getProductsApi;

  const ProductsRepoImpl(this._getProductsApi);

  @override
  Future<List<ProductsModel>> getProducts() async{
    try {
      final resp = await this
          ._getProductsApi
          .getProducts();

      if (resp!.data == null)
        return List.empty();
      else
        return resp.data;
    } on TokenException catch (te) {
      Logger.e(msg: "getProducts()", error: te);

      throw te;
    } on IOException catch (ioe) {
      Logger.e(msg: "getProducts()", error: ioe);

      throw ioe;
    } on Exception catch (e) {
      Logger.e(msg: "getProducts()", error: e);

      throw DataException();
    }
  }
}
