import 'package:flutter/material.dart';
import 'package:restaurant_app_rj/homescreen/restaurant_home.dart';

class RestoDetail extends StatelessWidget {
  static const routeName = '/detail_restaurant';

  final RestaurantElement resto;

  const RestoDetail({required this.resto});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            children: [
              Hero(
                tag: resto.id,
                child: Image.network(resto.pictureId),
              ),
              SafeArea(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.arrow_back_rounded,
                        color: Color.fromRGBO(243, 177, 33, 1),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    )
                  ],
                ),
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      child: Text(
                        resto.name,
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: const Color.fromRGBO(243, 177, 33, 1)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          resto.rating.toString(),
                          style: const TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.location_on_rounded,
                          size: 30,
                          color: Color.fromRGBO(243, 177, 33, 1),
                        ),
                        const SizedBox(
                          width: 1,
                        ),
                        Text(
                          resto.city,
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Container(
                  margin: const EdgeInsets.only(
                    top: 16,
                    bottom: 10,
                  ),
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    'Description',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(2.0),
                  child: Text(
                    resto.description,
                    textAlign: TextAlign.justify,
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                ),
                const SizedBox(
                  height: 18,
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Foods',
                        style: Theme.of(context).textTheme.headline6,
                      )
                    ],
                  ),
                ),
                Container(
                  height: (MediaQuery.of(context).size.height * 0.15),
                  width: (MediaQuery.of(context).size.width * 0.94),
                  child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: resto.menus.foods.map((foods) {
                        return SizedBox(
                          width: 150,
                          height: 200,
                          child: Card(
                            elevation: 2,
                            child: Column(
                              children: [
                                Container(
                                    color: const Color.fromRGBO(243, 177, 33, 1),
                                    height:
                                        (MediaQuery.of(context).size.height *
                                            0.1)),
                                Container(
                                  alignment: Alignment.bottomCenter,
                                  child: Text(foods.name,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.center,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText2),
                                ),
                              ],
                            ),
                          ),
                        );
                      }).toList()),
                ),
                const SizedBox(
                  height: 18,
                ),
                Padding(
                  padding: const EdgeInsets.all(4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Drinks',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ],
                  ),
                ),
                Container(
                  height: (MediaQuery.of(context).size.height * 0.15),
                  width: (MediaQuery.of(context).size.width * 0.94),
                  child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: resto.menus.drinks.map((drinks) {
                        return Container(
                          width: 150,
                          child: Card(
                            elevation: 2,
                            child: Column(
                              children: [
                                Container(
                                    color: const Color.fromRGBO(243, 177, 33, 1),
                                    height:
                                        (MediaQuery.of(context).size.height *
                                            0.1)),
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Container(
                                    alignment: Alignment.bottomCenter,
                                    child: Text(
                                      drinks.name,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.center,
                                      style:
                                          Theme.of(context).textTheme.bodyText2,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }).toList()),
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
