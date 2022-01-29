// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:weather_app/src/model/current_weather_data.dart';
import 'package:weather_app/src/ui/home/home_controller.dart';
import 'package:loading_animations/loading_animations.dart';

class HomeScreen extends StatelessWidget {
  String imgdir="assets/images/yamoussoukro.jpg";
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //resizeToAvoidBottomInset: false,
      key: _scaffoldKey,
      drawer: GetBuilder<HomeController>(
        builder: (controller) => Drawer(
          //height: 600,
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                child: Text(' '),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/ok1.jpg'),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25),
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.apartment,size:20 ,color: Colors.blueAccent,),
                title: Text('Lyon'),
                onTap: () {
                  imgdir="assets/images/lyon.jpg";
                  controller.city = "Lyon";
                  controller.updateWeather();
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.apartment,size:20 ,color: Colors.blueAccent,),
                title: Text('Paris'),
                onTap: () {
                  imgdir="assets/images/paris.jpg";
                  controller.city ="Paris";
                  controller.updateWeather();
                  Navigator.pop(context);
                },

              ),
              ListTile(
                leading: Icon(Icons.apartment,size:20 ,color: Colors.blueAccent,),
                title: Text('Yamoussoukro'),
                onTap: () {
                  imgdir="assets/images/yamoussoukro.jpg";
                  controller.city ="Yamoussoukro";
                  controller.updateWeather();
                  Navigator.pop(context);
                },

              ),
            ],
          ),
        ),
      ),
      body: GetBuilder<HomeController>(
        builder: (controller) => Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(imgdir),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25),
                  ),
                ),
                child: Stack(
                  children: <Widget>[
                    AppBar(
                      backgroundColor: Colors.transparent,
                      leading: new IconButton(
                        icon: Icon(Icons.menu),
                        onPressed: () => _scaffoldKey.currentState.openDrawer(),
                        color: Colors.white,
                        ),
                      title: Text("Météo en temps réel",style: TextStyle(color: Colors.white,fontSize: 25),),
                      //shape: StadiumBorder(),
                    ),
                    Align(
                      alignment: Alignment(0.0, 2.0),
                      child: SizedBox(
                        height: 10,
                        width: 10,
                        child: OverflowBox(
                          minWidth: 0.0,
                          maxWidth: MediaQuery.of(context).size.width,
                          minHeight: 0.0,
                          maxHeight: (MediaQuery.of(context).size.height / 2.7),
                          child: Stack(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 15),
                                width: double.infinity,
                                height: double.infinity,
                                child: Card(
                                  color: Colors.white,
                                  elevation: 5,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Container(
                                        padding: EdgeInsets.only(
                                            top: 15, left: 20, right: 20),
                                        child: Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Center(
                                              child: Text(
                                                (controller.currentWeatherData !=
                                                    null)
                                                    ? '${controller.currentWeatherData.name}'
                                                    .toUpperCase()
                                                    : 'Chargement..',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .caption
                                                    .copyWith(
                                                  color: Colors.black45,
                                                  fontSize: 24,
                                                  fontWeight:
                                                  FontWeight.bold,
                                                  fontFamily:
                                                  'flutterfonts',
                                                ),
                                              ),
                                            ),
                                            Center(
                                              child: Text(
                                                DateFormat()
                                                    .add_MMMMEEEEd()
                                                    .format(DateTime.now()),
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .caption
                                                    .copyWith(
                                                  color: Colors.black45,
                                                  fontSize: 16,
                                                  fontFamily:
                                                  'flutterfonts',
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Divider(),
                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Container(
                                            padding: EdgeInsets.only(left: 50),
                                            child: Column(
                                              children: <Widget>[
                                                Text(
                                                  (controller.currentWeatherData
                                                      .weather !=
                                                      null)
                                                      ? '${controller.currentWeatherData.weather[0].description}'
                                                      : 'Chargement..',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .caption
                                                      .copyWith(
                                                    color: Colors.black45,
                                                    fontSize: 15,
                                                    fontFamily:
                                                    'flutterfonts',
                                                  ),
                                                ),
                                                SizedBox(height: 3),
                                                Text(
                                                  (controller.currentWeatherData
                                                      .main !=
                                                      null)
                                                      ? '${(controller.currentWeatherData.main.temp - 273.15).round().toString()}\u2103'
                                                      : '',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .headline2
                                                      .copyWith(
                                                      color: Colors.black45,
                                                      fontFamily:
                                                      'flutterfonts'),
                                                ),
                                                Text(
                                                  (controller.currentWeatherData
                                                      .main !=
                                                      null)
                                                      ? 'min: ${(controller.currentWeatherData.main.tempMin - 273.15).round().toString()}\u2103 / max: ${(controller.currentWeatherData.main.tempMax - 273.15).round().toString()}\u2103'
                                                      : 'Chargement..',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .caption
                                                      .copyWith(
                                                    color: Colors.black45,
                                                    fontSize: 14,
                                                    fontWeight:
                                                    FontWeight.bold,
                                                    fontFamily:
                                                    'flutterfonts',
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            padding: EdgeInsets.only(right: 20),
                                            child: Column(
                                              mainAxisAlignment:
                                              MainAxisAlignment.center,
                                              children: <Widget>[
                                                Container(
                                                  width: 100,
                                                  height: 100,
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                      image: AssetImage(
                                                          'assets/images/icon-01.jpg'),
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  child: Text(
                                                    (controller.currentWeatherData
                                                        .wind !=
                                                        null)
                                                        ? 'Vent ${controller.currentWeatherData.wind.speed} m/s'
                                                        : 'Charhement des données',
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .caption
                                                        .copyWith(
                                                      color: Colors.black45,
                                                      fontSize: 14,
                                                      fontWeight:
                                                      FontWeight.bold,
                                                      fontFamily:
                                                      'flutterfonts',
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Spacer(flex: 1),
            Expanded(
              flex: 2,
              child: Stack(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Container(
                      padding: EdgeInsets.only(top: 120),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              child: Text(
                                'Autres villes'.toUpperCase(),
                                style: Theme.of(context)
                                    .textTheme
                                    .caption
                                    .copyWith(
                                  fontSize: 16,
                                  fontFamily: 'flutterfonts',
                                  color: Colors.black45,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Container(
                              height: 150,
                              child: ListView.separated(
                                physics: BouncingScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                separatorBuilder: (context, index) =>
                                    VerticalDivider(
                                      color: Colors.transparent,
                                      width: 5,
                                    ),
                                itemCount: controller.dataList.length,
                                itemBuilder: (context, index) {
                                  CurrentWeatherData data;
                                  (controller.dataList.length > 0)
                                      ? data = controller.dataList[index]
                                      : data = null;
                                  return Container(
                                    width: 140,
                                    height: 150,
                                    child: Card(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: Container(
                                        child: Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          children: <Widget>[
                                            Text(
                                              (data != null)
                                                  ? '${data.name}'
                                                  : 'Chargement..',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .caption
                                                  .copyWith(
                                                fontSize: 10,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black45,
                                                fontFamily: 'flutterfonts',
                                              ),
                                            ),
                                            Text(
                                              (data != null)
                                                  ? '${(data.main.temp - 273.15).round().toString()}\u2103'
                                                  : '',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .caption
                                                  .copyWith(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black45,
                                                fontFamily: 'flutterfonts',
                                              ),
                                            ),
                                            Container(
                                              width: 50,
                                              height: 50,
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                  image: AssetImage(
                                                      'assets/images/icon-01.jpg'),
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            Text(
                                              (data != null)
                                                  ? '${data.weather[0].description}'
                                                  : 'Chargement..',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .caption
                                                  .copyWith(
                                                color: Colors.black45,
                                                fontFamily: 'flutterfonts',
                                                fontSize: 12,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
