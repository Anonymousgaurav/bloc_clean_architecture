enum Environments { DEV, PRE, PROD }

abstract class Credentials {
  static const String BAH_USER = "";
  static const String BAH_PASS =
      "";
}

abstract class _Endpoints {
  static String GET_PRODUCTS() =>
      "https://dummyjson.com/products";
}

/// Network configuration
abstract class NetConfig {
  static Environments env = Environments.DEV;

  static String getAllProducts() {
    switch (env) {
      case Environments.PRE:
        return _Endpoints.GET_PRODUCTS();
      case Environments.PROD:
        return _Endpoints.GET_PRODUCTS();
      case Environments.DEV:
      default:
        return _Endpoints.GET_PRODUCTS();
    }
  }
}
