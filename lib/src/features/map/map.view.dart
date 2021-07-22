import 'package:flutter/material.dart';
import 'package:modulo1_deficientes_visuais_proex/src/app/app.color.dart';
import 'package:modulo1_deficientes_visuais_proex/src/features/map/map.controller.dart';
import 'package:modulo1_deficientes_visuais_proex/src/features/shared/button_submit.widget.dart';
import 'package:modulo1_deficientes_visuais_proex/src/features/shared/form_field.widget.dart';
import 'package:rx_notifier/rx_notifier.dart';

class MapView extends StatefulWidget {
  const MapView({Key? key}) : super(key: key);

  @override
  _MapViewState createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  MapController controller = MapController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            width: size.width < 320 ? size.width * 0.8 : 280,
            height: size.height,
            alignment: Alignment.center,
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Spacer(
                    flex: 4,
                  ),
                  Text(
                    "Módulo\n1",
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.w700,
                      color: AppColors.primary,
                    ),
                  ),
                  Spacer(
                    flex: 2,
                  ),
                  FormFieldWidget(
                    title: "Localização",
                    description: "Digite o endereço do prédio",
                    validator: (String value) {
                      if (value.isEmpty) return "Campo vazio";
                      return null;
                    },
                    controller: controller.mapEditingController,
                    onChanged: (value) {},
                    icon: SizedBox(),
                    keyboardType: TextInputType.streetAddress,
                  ),
                  RxBuilder(
                    builder: (context) {
                      return FormFieldWidget(
                        title: "Coordenada Geográfica",
                        description: "Coordenada geográfica do prédio",
                        validator: (value) {
                          if (value.isEmpty) return "Campo vazio";
                          return null;
                        },
                        controller: controller.geoEditingController,
                        onChanged: (value) {},
                        icon: SizedBox(),
                        keyboardType: TextInputType.numberWithOptions(),
                      );
                    },
                  ),
                  RxBuilder(
                    builder: (context) {
                      return FormFieldWidget(
                        title: "Descrição",
                        description: "Descrição do prédio",
                        validator: (value) {
                          if (value.isEmpty) return "Campo vazio";
                          return null;
                        },
                        controller: controller.geoEditingController,
                        onChanged: (value) {},
                        icon: SizedBox(),
                        keyboardType: TextInputType.multiline,
                      );
                    },
                  ),
                  Spacer(
                    flex: 2,
                  ),
                  RxBuilder(
                    builder: (context) {
                      return controller.getIsLoading
                          ? CircularProgressIndicator()
                          : ButtonSubmitWidget(
                              textButton: "Entrar",
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  controller.isLoading.value = true;
                                  print(controller.mapEditingController.text);
                                  print(controller
                                      .geoEditingController.text);
                                  Future.delayed(Duration(seconds: 3)).then(
                                      (value) =>
                                          controller.isLoading.value = false);
                                }
                              },
                            );
                    },
                  ),
                  Spacer(
                    flex: 4,
                  ),
                  Text(
                    "Aplicação feita pela PROEX",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Spacer(
                    flex: 1,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
