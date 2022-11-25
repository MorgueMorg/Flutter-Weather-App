import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';
import 'package:weathersec/model/weather_data_daily.dart';
import 'package:weathersec/utils/custom_colors.dart';

class DailyWeather extends StatelessWidget {
  final WeatherDataDaily weatherDataDaily;
  const DailyWeather({Key? key, required this.weatherDataDaily})
      : super(key: key);

  // String manipulation for day format
  String getDay(final day) {
    DateTime time = DateTime.fromMillisecondsSinceEpoch(day * 1000);
    final x = DateFormat('EEE').format(time);
    return x;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 428,
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: CustomColors.dividerLine.withAlpha(150),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Container(
            height: 30,
            alignment: Alignment.topLeft,
            margin: const EdgeInsets.only(bottom: 10.0, left: 8.0, top: 6.0),
            child: const Text(
              "Next days",
              style: TextStyle(
                color: CustomColors.textColorBlack,
                fontSize: 17.0,
              ),
            ),
          ),
          dailyList(),
        ],
      ),
    );
  }

  Widget dailyList() {
    return SizedBox(
      height: 350,
      child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: weatherDataDaily.daily.length > 7
              ? 7
              : weatherDataDaily.daily.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Container(
                  height: 50,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.only(left: 2, right: 2),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        child: Text(
                          getDay(weatherDataDaily.daily[index].dt),
                          style: const TextStyle(
                            color: CustomColors.textColorBlack,
                            fontSize: 13,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 30,
                        height: 30,
                        child: Image.asset(
                            "assets/weather/${weatherDataDaily.daily[index].weather![0].icon}.png"),
                      ),
                      Text(
                          "${weatherDataDaily.daily[index].temp!.max}°/${weatherDataDaily.daily[index].temp!.min}°")
                    ],
                  ),
                ),
                Container(
                  height: 1,
                  color: CustomColors.dividerLine.withAlpha(255),
                )
              ],
            );
          }),
    );
  }
}
