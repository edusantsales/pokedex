import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex/app/app.dart';

import 'env.dart';

// * ARQUIVO DE INICIALIZAÇÃO DO PROJETO PARA RODAR EM AMBIENTE DE PRODUÇÃO
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then(
    (_) {
      var appEnvironment = AppEnvironment.getInstance(
        environment: "PRODUCTION",
        apiBaseUrl: POKE_API,
        child: ModularApp(module: AppModule(), child: AppTheme()),
      );
      runApp(appEnvironment!);
    },
  );
}
