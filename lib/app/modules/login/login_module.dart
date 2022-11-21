import 'package:flutter_modular/flutter_modular.dart';
import 'package:job_timer/app/modules/login/controller/login_controller.dart';
import 'package:job_timer/app/modules/login/login_page.dart';
import 'package:modular_bloc_bind/modular_bloc_bind.dart';

class LoginModule extends Module {
  @override
  // TODO: implement binds
  List<Bind> get binds => [BlocBind.lazySingleton((i) => LoginController(authService: i()))];

  ///authService -> appModule

  @override
  // TODO: implement binds
  List<ModularRoute> get routes => [
        ChildRoute('/',
            child: (context, args) => LoginPage(
                  controller: Modular.get(),
                )),
        // ModuleRoute('/login', module: LoginModule()),
      ];
}
