import 'package:authentic_sg_weather/app/modules/weather/controllers/location_controller.dart';
import 'package:authentic_sg_weather/app/modules/weather/views/widgets/title_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    LocationController controller = Get.find();
    return Obx(
      () => Scaffold(
          body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: Get.width / 4,
                    width: Get.width / 4,
                    child: Image.asset(controller.weatherIcon),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text('${controller.temp}°C', style: textTheme.headline6),
                      Text(
                        controller.locationName ?? '',
                        style: textTheme.headline6,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Spacer(),
            TitleTextWidget(
              highlight: controller.phrase!.highlight![0],
              title: controller.phrase!.title!,
              color: Color(
                int.tryParse(controller.phrase!.color!) ?? 0,
              ),
            ),
            Text(controller.phrase!.subline ?? 'error'),
          ],
        ),
      )),
    );
  }
}
