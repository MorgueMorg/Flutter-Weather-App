import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:weathersec/controller/global_controller.dart';
import 'package:weathersec/model/weather_data_hourly.dart';
import 'package:weathersec/utils/custom_colors.dart';

class HourlyWeather extends StatelessWidget {
  final WeatherDataHourly weatherDataHourly;
  HourlyWeather({Key? key, required this.weatherDataHourly}) : super(key: key);

  // Card index
  RxInt cardIndex = GlobalController().getIndex();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(
            vertical: 5.0,
            horizontal: 20.0,
          ),
          alignment: Alignment.topCenter,
          child: const Text(
            'Today',
            style: TextStyle(
              fontSize: 18,
            ),
          ),
        ),
        hourlyList(),
      ],
    );
  }

  Widget hourlyList() {
    return Container(
      height: 150,
      padding: const EdgeInsets.only(
        top: 10.0,
        bottom: 10.0,
      ),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: weatherDataHourly.hourly.length > 12
            ? 12
            : weatherDataHourly.hourly.length,
        itemBuilder: (context, index) {
          return Obx((() => GestureDetector(
              onTap: () {
                cardIndex.value = index;
              },
              child: Container(
                margin: const EdgeInsets.only(left: 20.0, right: 3.0),
                width: 90.0,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    boxShadow: [
                      BoxShadow(
                        offset: const Offset(0.5, 0),
                        blurRadius: 30,
                        spreadRadius: 1,
                        color: CustomColors.dividerLine.withAlpha(200),
                      )
                    ],
                    gradient: cardIndex.value == index
                        ? const LinearGradient(colors: [
                            CustomColors.firstGradientColor,
                            CustomColors.secondGradientColor
                          ])
                        : null),
                child: HourlyDetails(
                  timeStamp: weatherDataHourly.hourly[index].dt!,
                  temp: weatherDataHourly.hourly[index].temp!,
                  weatherIcon:
                      weatherDataHourly.hourly[index].weather![0].icon!,
                  index: index,
                  cardIndex: cardIndex.toInt(),
                ),
              ))));
        },
      ),
    );
  }
}

class HourlyDetails extends StatelessWidget {
  int timeStamp;
  int temp;
  String weatherIcon;

  int index;
  int cardIndex;

  String getTime(timeStamp) {
    DateTime time = DateTime.fromMillisecondsSinceEpoch(timeStamp * 1000);
    String x = DateFormat('Hm').format(time);
    return x;
  }

  HourlyDetails(
      {Key? key,
      required this.timeStamp,
      required this.temp,
      required this.weatherIcon,
      required this.index,
      required this.cardIndex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          margin: const EdgeInsets.only(
            top: 10.0,
          ),
          child: Text(
            getTime(timeStamp),
            style: TextStyle(
              color: cardIndex == index
                  ? Colors.white
                  : CustomColors.textColorBlack,
            ),
          ),
        ),
        SizedBox(
          height: 40,
          width: 40,
          child: Image.asset(
            "assets/weather/$weatherIcon.png",
          ),
        ),
        Container(
          margin: const EdgeInsets.only(
            bottom: 10.0,
          ),
          child: Text(
            "$temp°",
            style: TextStyle(
              color: cardIndex == index
                  ? Colors.white
                  : CustomColors.textColorBlack,
            ),
          ),
        ),
      ],
    );
  }
}
