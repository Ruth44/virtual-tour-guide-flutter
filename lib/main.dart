import 'package:virtual_tour_guide_manager/data/account/bloc/change_password/bloc/bloc/change_password_bloc.dart';
import 'package:virtual_tour_guide_manager/data/bldg_detail/bloc/bldg_detail_bloc.dart';
import 'package:virtual_tour_guide_manager/data/building/bloc/bldg_bloc.dart';
import 'package:virtual_tour_guide_manager/data/building/data_provider/building_data_provider.dart';
import 'package:virtual_tour_guide_manager/data/building/repository/building_repository.dart';
import 'package:virtual_tour_guide_manager/data/room/bloc/room/room_bloc.dart';
import 'package:virtual_tour_guide_manager/data/room/data_provider/room_data_provider.dart';
import 'package:virtual_tour_guide_manager/data/room/repository/room_repository.dart';
import 'package:virtual_tour_guide_manager/data/users/bloc/user_bloc.dart';
import 'package:virtual_tour_guide_manager/data/users/data_provider/user_data_provider.dart';
import 'package:virtual_tour_guide_manager/data/users/repository/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:virtual_tour_guide_manager/util/storage/secure_storage.dart';
import 'package:virtual_tour_guide_manager/data/account/account.dart';
import 'package:virtual_tour_guide_manager/route.dart';

import 'package:virtual_tour_guide_manager/data/categories/bloc/bloc.dart';
import 'package:virtual_tour_guide_manager/data/categories/data_provider/category_data.dart';
import 'package:virtual_tour_guide_manager/data/categories/repository/categories_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final AccountRepository accountRepository = AccountRepository(
    remoteDataProvider: AccountRemoteDataProvider(httpClient: http.Client()),
    localDataProvider: AccountLocalDataProvider(
      secureStorage: SecureStorage(storage: const FlutterSecureStorage()),
    ),
  );

  final BuildingRepository buildingRepository = BuildingRepository(
    buildingDataProvider: BuildingDataProvider(httpClient: http.Client()),
  );
  final RoomRepository roomRepository =
      RoomRepository(dataProvider: RoomDataProvider(httpClient: http.Client()));
  final UserRepository userRepository = UserRepository(
      userDataProvider: UserDataProvider(httpClient: http.Client()));

  final CategoriesRepository categoriesRepository = CategoriesRepository(
      dataProvider: CategoriesDataProvider(httpClient: http.Client()));

  runApp(MyApp(
    accountRepository: accountRepository,
    buildingRepository: buildingRepository,
    categoriesRepository: categoriesRepository,
    roomRepository: roomRepository,
    userRepository: userRepository,
  ));
}

class MyApp extends StatelessWidget {
  AccountRepository accountRepository;
  BuildingRepository buildingRepository;
  RoomRepository roomRepository;
  CategoriesRepository categoriesRepository;
  UserRepository userRepository;

  MyApp(
      {Key? key,
      required this.accountRepository,
      required this.buildingRepository,
      required this.roomRepository,
      required this.categoriesRepository,
      required this.userRepository})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              AuthenticationBloc(accountRepository: accountRepository),
        ),
        BlocProvider(
          create: (context) => LoginBloc(accountRepository: accountRepository),
        ),
        BlocProvider(
          create: (context) => SignUpBloc(accountRepository: accountRepository),
        ),
        BlocProvider(
          create: (context) => BldgBloc(buildingRepository: buildingRepository),
        ),
        BlocProvider(
          create: (context) =>
              BldgDetailBloc(buildingRepository: buildingRepository),
        ),
        BlocProvider(
          create: (context) => UserBloc(userRepository: userRepository, accountRepository: accountRepository),
        ),
        BlocProvider(
          create: (context) => RoomBloc(roomRepository: roomRepository, accountRepository: accountRepository),
        ),
        BlocProvider(
            create: (context) => CategoriesBloc(
                categoriesRepository: categoriesRepository,
                accountRepository: accountRepository)
            // ..add(const CategoriesLoad()),
            ),
        BlocProvider(
          create: (context) =>
              ChangePasswordBloc(accountRepository: accountRepository),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'EMAS',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        // home: const MyHomePage(title: 'Flutter Demo Home Page'),
        // home: LoginPage(),
        // home: const BuildingList(),
        // home: const CategoryList(),
        initialRoute: "/",
        onGenerateRoute: PageRouter.generateRoute,
      ),
    );
  }
}
