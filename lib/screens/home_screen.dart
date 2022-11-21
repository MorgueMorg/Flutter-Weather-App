import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weathersec/controller/global_controller.dart';
import 'package:weathersec/model/weather_data_daily.dart';
import 'package:weathersec/utils/custom_colors.dart';
import 'package:weathersec/widgets/comfort_level_widget.dart';
import 'package:weathersec/widgets/current_weather_widget.dart';
import 'package:weathersec/widgets/daily_weather_widget.dart';
import 'package:weathersec/widgets/header_widget.dart';
import 'package:weathersec/widgets/hourly_data_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Call GlobalController
  final GlobalController globalController =
      Get.put(GlobalController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Obx(() => globalController.checkLoading().isTrue
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/icons/clouds.png",
                        height: 50,
                        width: 50,
                      ),
                      const CircularProgressIndicator(),
                    ],
                  ),
                )
              : Center(
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      const HeaderWidget(),
                      const SizedBox(
                        height: 20,
                      ),
                      // For current temperature ('current')
                      CurrentWeather(
                        weatherDataCurrent:
                            globalController.getData().getCurrentWeather(),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      // For hourly temperature ('hourly')
                      HourlyWeather(
                        weatherDataHourly:
                            globalController.getData().getHourlyWeather(),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      // For daily temperature ('daily')
                      DailyWeather(
                        weatherDataDaily:
                            globalController.getData().getDailyWeather(),
                      ),
                      Container(
                        height: 1.0,
                        color: CustomColors.dividerLine,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ComfortLevel(
                        weatherDataCurrent:
                            globalController.getData().getCurrentWeather(),
                      ),

                      const SizedBox(
                        height: 60,
                      ),
                    ],
                  ),
                ))),
    );
  }
}
