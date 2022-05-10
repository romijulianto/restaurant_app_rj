import 'package:flutter/material.dart';
import 'package:restaurant_app_rj/page/detail_page.dart';
import 'package:restaurant_app_rj/homescreen/restaurant_home.dart';

class RestaurantList extends StatelessWidget {
  const RestaurantList({Key? key}) : super(key: key);

  static const routeName = '/list_restaurant';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(243, 177, 33, 1),
        title: const Text(
          'Restaurant App - by Romi Julianto',
          style: TextStyle(color: Colors.black),
        ),
        shadowColor: Colors.grey,
      ),
      body: FutureBuilder<String>(
        future: DefaultAssetBundle.of(context)
            .loadString('assets/local_restaurant.json'),
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return const Center(child: CircularProgressIndicator());
          } else {
            if (snapshot.hasData) {
              final List<RestaurantElement> restos =
                  parseRestos(snapshot.data!);
              return ListView.builder(
                  itemCount: restos.length,
                  itemBuilder: (context, index) {
                    return _buildRestoItem(context, restos[index]);
                  });
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }
        },
      ),
    );
  }
}

Widget _buildRestoItem(BuildContext context, RestaurantElement resto) {
  return Card(
    child: InkWell(
        splashColor: const Color.fromRGBO(243, 177, 33, 1),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
          child: ListTile(
            contentPadding:
                const EdgeInsets.symmetric(vertical: 10, horizontal: 8.0),
            leading: ConstrainedBox(
              constraints: const BoxConstraints(
                minWidth: 100,
                minHeight: 100,
                maxWidth: 100,
                maxHeight: 100,
              ),
              child: Image.network(resto.pictureId, fit: BoxFit.cover),
            ),
            title: Text(resto.name),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(resto.city),
                Text(resto.rating.toString(),
                style: const TextStyle(color: Color.fromRGBO(243, 177, 33, 1)),
                ),
              ],
            ),
          ),
        ),
        onTap: () {
          Navigator.pushNamed(context, RestoDetail.routeName,
              arguments: resto);
        }),
  );
}
