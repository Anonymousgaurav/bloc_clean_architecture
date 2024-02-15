enum Environments { DEV, PRE, PROD }


abstract class Credentials {
  }

abstract class _Endpoints {
  static String PRODUCT_CART() =>
      "https://dummyjson.com/carts";
}

abstract class NetConfig {
  static Environments env = Environments.DEV;

  static String getProductCarts() {
    switch (env) {
      case Environments.PRE:
        return _Endpoints.PRODUCT_CART();
      case Environments.PROD:
        return _Endpoints.PRODUCT_CART();
      case Environments.DEV:
      default:
        return _Endpoints.PRODUCT_CART();
    }
  }
}
