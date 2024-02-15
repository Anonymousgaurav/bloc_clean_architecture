import 'package:custom_bloc_state_management/business/ErrorCodes.dart';
import 'package:custom_bloc_state_management/business/bloc/Bloc.dart';
import 'package:custom_bloc_state_management/business/repos/local_db/ILocalCartRepo.dart';
import 'package:custom_bloc_state_management/data/exception/DataException.dart';
import 'package:custom_bloc_state_management/data/repos/local_db/products/CartsRepoImpl.dart';
import 'package:custom_bloc_state_management/models/dto/local_db/LocalCartDTO.dart';
import 'package:custom_bloc_state_management/models/dto/products/ProductsDTO.dart';
import 'package:custom_bloc_state_management/models/products/CartModel.dart';
import 'package:custom_bloc_state_management/utils/Logger.dart';

const String TAG = "InsertCartBloc";

class InsertCartBloc extends Bloc<LocalCartDTO, bool > {
  InsertCartBloc();
  final ILocalCartRepo _repo = CartsRepoImpl();


  @override
  void performOperation(LocalCartDTO dto) async {
    var res;
    try {
      Logger.i(tag: TAG, msg: "performOperation:dto:" + dto.toString());
      final data = await _repo.insertCart(cartModel: dto.cartModel);
      res = buildResult(data: data);
      Logger.i(tag: TAG, msg: "performOperation:res:" + res.toString());
    } on DataException catch (e) {
      Logger.e(tag: TAG, msg: "inputOperation()", error: e);

      res = buildResult(data: null, code: ErrorCodes.DATA_ERROR);
    } on Exception catch (e) {
      Logger.e(tag: TAG, msg: "inputOperation()", error: e);

      res = buildResult(data: null, code: ErrorCodes.INSERT_DB_ERROR);
    } finally {
      processData(res);
    }
  }
}
