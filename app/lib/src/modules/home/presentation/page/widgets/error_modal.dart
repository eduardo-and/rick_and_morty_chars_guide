import 'package:flutter/material.dart';
import '../../../../../core/theme/rmg_images.dart';
import '../../../../../core/utils/extensions/numbers_extension.dart';

class ErrorModal {
  void show(BuildContext context, Function onPressed) {
    final theme = Theme.of(context);
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: WillPopScope(
              onWillPop: () async {
                return false;
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(RMGImages.failure),
                   SizedBox(
                    height: 10.scale,
                  ),
                  Text('Falha ao obter dados!',
                      style: theme.textTheme.subtitle1),
                  Text(
                    'Algo inesperado ocorreu durante o recebimento dos dados.Tente novamente para continuar!',
                    style: theme.textTheme.overline,
                    textAlign: TextAlign.center,
                  ),
                   SizedBox(
                    height: 15.scale,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                      onPressed();
                    },
                    child: Text('Tentar Novamente',
                        style: theme.textTheme.button!
                            .copyWith(color: theme.primaryColor)),
                  )
                ],
              ),
            ),
          );
        });
  }
}
