import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:power_one/Services/revenue_cat_service.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

import 'dart:developer' as dev;

// video: https://www.youtube.com/watch?v=h-jOMh2KXTA

class SubscriptionData {
  String name;
  String details;
  String price;
  List<String> benefitBullets;
}

int active = 1;

Map<String, dynamic> packageTitleConverter(String packageName) {
  switch (packageName) {
    case '1_month (Power of 1 Basketball)':
      return {
        'name': 'Monthly',
        'benefits': [
          '1 Month Full Access',
        ],
      };
      break;
    case '6_month (Power of 1 Basketball)':
      return {
        'name': 'Semi-Annually',
        'benefits': [
          'More than 15% off',
          '6 Months Full Access',
        ],
      };
      break;
    case '1_year (Power of 1 Basketball)':
      return {
        'name': 'Yearly',
        'benefits': [
          'More than 20% off',
          '1 Year Full Access',
        ],
      };
      break;
    default:
      return {};
  }
}

class PurchaseScreen extends HookWidget {
  const PurchaseScreen({Key key}) : super(key: key);

  static int activeCard = 1;

  Future<List<Package>> fetchOffers() async {
    final List<Offering> _offerings = await InnAppPurchaseService.fetchOffers();
    List<Package> subscriptions;

    if (_offerings.isEmpty || _offerings[0].availablePackages.isEmpty) {
      dev.log('offerings returned empty; no subscriptions found');
    } else {
      subscriptions = _offerings
          .map((offer) => offer.availablePackages)
          .expand((element) => element)
          .toList();
      dev.log('Offers received, first item: $subscriptions');
    }

    return subscriptions;
  }

  static String description;

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<int> activeCardVN = useValueNotifier(1);

    return Scaffold(
      body: FutureBuilder(
        future: fetchOffers(),
        builder: (context, snapshot) {
          return snapshot.hasError
              ? Center(
                  child: Text('There was an error, check the logs',
                      style: TextStyle(color: Colors.red[900], fontSize: 48)),
                )
              : snapshot.hasData
                  ? Center(
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: snapshot.data.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () => {
                              activeCardVN.value = index,
                              dev.log('checking for offerings from $index'),
                            },
                            child: HookBuilder(
                              builder: (_) {
                                final activeCard =
                                    useValueListenable(activeCardVN);
                                return SubscriptionCard(
                                  activeCard: activeCard == index,
                                  data: snapshot.data[index],
                                );
                              },
                            ),
                          );
                        },
                      ),
                    )
                  : Center(
                      child: Text(
                        'Grabbing your offers',
                        style: TextStyle(fontSize: 38, color: Colors.grey),
                      ),
                    );
        },
      ),
    );
  }
}

Widget _titleArea({String titleText}) {
  return Flex(
    direction: Axis.horizontal,
    children: [
      // Flexible(
      //   flex: 1,
      //   child: Padding(
      //     padding: EdgeInsets.fromLTRB(0, 0, 8, 0),
      //     child: Transform.rotate(
      //       angle: 90,
      //       child: Icon(
      //         Icons.sports_basketball,
      //         color: Colors.orange[400],
      //         size: 48,
      //       ),
      //     ),
      //   ),
      // ),
      Flexible(
        flex: 3,
        child: Center(
          child: Text(
            titleText,
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.grey[50]),
          ),
        ),
      ),
    ],
  );
}

Widget _detailArea({String details, List<String> bullets}) {
  return Flex(
    direction: Axis.vertical,
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: bullets.length,
        itemBuilder: (context, index) {
          return Flexible(
            flex: 1,
            child: _detailBullets(
              listItemText: bullets[index],
            ),
          );
        },
      ),
      // Flexible(
      //   flex: 1,
      //   child: _detailBullets(listItemText: 'Full Access for 1 month'),
      // ),
      // Flexible(
      //   flex: 1,
      //   child: _detailBullets(listItemText: 'Full Access for 1 month'),
      // ),
      Flexible(
        flex: 1,
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Text(
            details,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey),
          ),
        ),
      ),
    ],
  );
}

Widget _detailBullets({String listItemText}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: Icon(
          Icons.check_circle,
          size: 20,
          color: Colors.green[900],
        ),
      ),
      Text(
        listItemText,
        style: TextStyle(color: Colors.grey),
      ),
    ],
  );
}

class SubscriptionCard extends HookWidget {
  const SubscriptionCard({
    Key key,
    this.title,
    this.data,
    this.activeCard,
    this.child,
  }) : super(key: key);
  final String title;
  final bool activeCard;
  final Package data;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<double> width = useState(225);
    final ValueNotifier<double> height = useState(250);
    useEffect(() {
      width.value = activeCard ? 255 : 225;
      height.value = activeCard ? 300 : 250;
      return () {};
    }, [activeCard]);

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: AnimatedContainer(
          duration: Duration(milliseconds: 200),
          curve: Curves.bounceOut,
          width: width.value,
          height: height.value,
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: Color(0xff33333D),
            borderRadius: BorderRadius.all(Radius.circular(16)),
            boxShadow: [
              BoxShadow(blurRadius: 12.0, spreadRadius: -0),
            ],
          ),
          padding: EdgeInsets.all(16),
          child: Flex(
            direction: Axis.vertical,
            mainAxisSize: MainAxisSize.max,
            children: [
              Flexible(
                flex: 1,
                child: _titleArea(
                  titleText: packageTitleConverter(data.product.title)['name'],
                ),
              ),
              Flexible(
                flex: 1,
                child: RichText(
                  text: TextSpan(
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w700,
                      color: Colors.orange,
                    ),
                    children: [
                      TextSpan(
                        text: data.product.priceString,
                      ),
                      TextSpan(
                        text: '/month',
                        style: TextStyle(
                          color: Colors.orange[500],
                          fontSize: 16,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: _detailArea(
                  details: data.product.description,
                  bullets:
                      packageTitleConverter(data.product.title)['benefits'],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

_purchasePackage(Package package) {
  dev.log('attempting to purchase $package');
}
