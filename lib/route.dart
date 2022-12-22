import 'package:virtual_tour_guide_manager/screens/admin_home.dart';
import 'package:virtual_tour_guide_manager/screens/change_password.dart';
import 'package:virtual_tour_guide_manager/screens/user_edit.dart';
import 'package:virtual_tour_guide_manager/screens/view_users.dart';
import 'package:virtual_tour_guide_manager/util/building_argument.dart';
import 'package:virtual_tour_guide_manager/util/category_argument.dart';
import 'package:virtual_tour_guide_manager/util/room_edit_argument.dart';
import 'package:virtual_tour_guide_manager/util/user_argument.dart';
import 'package:virtual_tour_guide_manager/util/user_edit_argument.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:virtual_tour_guide_manager/data/account/bloc/bloc.dart';
import 'package:virtual_tour_guide_manager/data/account/data_provider/data_provider.dart';
import 'package:virtual_tour_guide_manager/data/account/repository/account_repository.dart';
import 'package:virtual_tour_guide_manager/data/categories/bloc/bloc.dart';
import 'package:virtual_tour_guide_manager/util/storage/secure_storage.dart';
import 'package:virtual_tour_guide_manager/screens/building_detail.dart';
import 'package:virtual_tour_guide_manager/screens/building_list.dart';
import 'package:virtual_tour_guide_manager/screens/category_add.dart';
import 'package:virtual_tour_guide_manager/screens/category_list.dart';
import 'package:virtual_tour_guide_manager/screens/login.dart';
import 'package:virtual_tour_guide_manager/screens/add_admin.dart';
import 'package:virtual_tour_guide_manager/screens/room_edit.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PageRouter {
  static Route generateRoute(RouteSettings settings) {
    final AccountRepository accountRepository = AccountRepository(
      remoteDataProvider: AccountRemoteDataProvider(httpClient: http.Client()),
      localDataProvider: AccountLocalDataProvider(
        secureStorage: SecureStorage(storage: const FlutterSecureStorage()),
      ),
    );
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(builder: (context) {
          return BlocBuilder<AuthenticationBloc, AuthenticationState>(
            builder: (context, state) {
              if (state is UnAuthenticatedState) {
                return BlocProvider(
                  create: (context) =>
                      LoginBloc(accountRepository: accountRepository),
                  child: LoginPage(),
                );
              }
              return FutureBuilder(
                  future: _getPrefs(),
                  builder: (context, snapshot) {
                    if (state is AuthenticatedState) {
                      //  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

                      if (snapshot.data == true) {
                        return const AdminHome();
                      } else {
                        return const BuildingList();
                        // }
                      }
                    }
                    BlocProvider.of<AuthenticationBloc>(context)
                        .add(AuthenticationEvent.getAuthState);
                    // return const CircularProgressIndicator();
                    return const Center(
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(0, 32, 0, 0),
                        child: SizedBox(
                          height: 30,
                          // width: 30,
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                              Colors.white,
                            ),
                          ),
                        ),
                      ),
                    );
                  });
            },
          );
        });
      case CategoriesList.routeName:
        final args = settings.arguments as CategoryArgument;
        return MaterialPageRoute(builder: (context) {
          return CategoriesList(
            bldgId: args.bldgId,
          );
        });
      case AddAdminPage.routeName:
        return MaterialPageRoute(builder: (context) {
          return AddAdminPage();
        });
      case ViewUsers.routeName:
        final args = settings.arguments as UserArgument;
        return MaterialPageRoute(builder: (context) {
          return ViewUsers(bldgId: args.bldgId);
        });
      case AddCategory.routeName:
        final args = settings.arguments as CategoryArgument;
        return MaterialPageRoute(builder: (context) {
          return AddCategory(bldgId: args.bldgId);
        });
      case BuildingList.routeName:
        return MaterialPageRoute(builder: (context) {
          return const BuildingList();
        });
      case BuildingDetail.routeName:
        final bldgArg = settings.arguments as BuildingArgument;
        return MaterialPageRoute(builder: (context) {
          return BuildingDetail(bldgId: bldgArg.bldgId);
        });
      case RoomEdit.routeName:
        final roomArg = settings.arguments as RoomEditArgument;
        return MaterialPageRoute(builder: (context) {
          return RoomEdit(room: roomArg.room);
        });
      case UserEdit.routeName:
        final userArg = settings.arguments as UserEditArgument;
        return MaterialPageRoute(builder: (context) {
          return UserEdit(user: userArg.user);
        });
      case AddAdminPage.routeName:
        return MaterialPageRoute(builder: (context) {
          return AddAdminPage();
        });
      case ChangePassword.routeName:
        return MaterialPageRoute(builder: (context) {
          return ChangePassword();
        });
      default:
        return MaterialPageRoute(builder: (context) {
          return LoginPage();
        });
    }
  }
}

Future<bool> _getPrefs() async {
  SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
  if (sharedPrefs.getBool('isAdmin') != null &&
      sharedPrefs.getBool('isAdmin') == true) {
    return true;
  } else {
    return false;
  }
}
