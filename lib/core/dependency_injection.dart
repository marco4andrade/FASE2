import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import '../data/datasources/remote_datasource.dart';
import '../data/repositories/store_repository_impl.dart';
import '../domain/usecases/get_products.dart';
import '../domain/usecases/get_categories.dart';
import '../domain/usecases/get_users.dart';
import '../presentation/providers/store_provider.dart';

class DependencyInjection {
  static List<SingleChildWidget> get providers {
    final remoteDataSource = RemoteDataSource();
    final storeRepository = StoreRepositoryImpl(remoteDataSource);
    
    final getProducts = GetProducts(storeRepository);
    final getCategories = GetCategories(storeRepository);
    final getUsers = GetUsers(storeRepository);

    return [
      Provider<RemoteDataSource>.value(value: remoteDataSource),
      Provider<StoreRepositoryImpl>.value(value: storeRepository),
      Provider<GetProducts>.value(value: getProducts),
      Provider<GetCategories>.value(value: getCategories),
      Provider<GetUsers>.value(value: getUsers),
      
      ChangeNotifierProvider<StoreProvider>(
        create: (context) => StoreProvider(
          getProducts: getProducts,
          getCategories: getCategories,
          getUsers: getUsers,
        ),
      ),
    ];
  }
}
