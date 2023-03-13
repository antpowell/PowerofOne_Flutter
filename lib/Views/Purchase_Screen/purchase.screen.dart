import 'dart:developer' as dev;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:power_one/Models/PO1User.dart';
import 'package:power_one/Services/RevenueCat/revenue_cat_service.dart';
import 'package:power_one/Services/database_service.dart';
import 'package:power_one/Views/Buttons/PO1Button.dart';
import 'package:power_one/Views/ScoreCard/ScoreCard.dart';
import 'package:power_one/Views/dialogs.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

// video: https://www.youtube.com/watch?v=h-jOMh2KXTA

int active = 1;

Map<String, dynamic> packageTitleConverter(String packageId) {
  switch (packageId) {
    case 'po1_599_1m_1w':
      return {
        'name': 'Monthly',
        'benefits': [
          'Premium Access',
        ],
      };
      break;
    case 'po1_2999_6m_1w':
      return {
        'name': 'Semiyearly',
        'benefits': [
          'Premium Access',
          'More than 15% off',
        ],
      };
      break;
    case 'po1_5999_12m_1w':
      return {
        'name': 'Yearly',
        'benefits': [
          'Premium Access',
          'More than 20% off',
        ],
      };
      break;
    default:
      return {};
  }
}

PO1User _user = PO1User();

Package _selectedPackage;

class PurchaseScreen extends HookWidget {
  static final String id = 'purchase_screen';
  const PurchaseScreen({Key key}) : super(key: key);

  static int activeCard = 1;

  Future<List<Package>> fetchOffers() async {
    final List<Offering> _offerings =
        await RevenueCatService.fetchOffers() /* [] */;
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
    final ValueNotifier<bool> isLoading = useState(false);

    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
          future: fetchOffers(),
          builder: (context, snapshot) {
            return snapshot.hasError
                ? Center(
                    child: Text('There was an error, check the logs',
                        style: TextStyle(color: Colors.red[900], fontSize: 48)),
                  )
                : snapshot.hasData
                    ? Column(
                        children: [
                          Expanded(
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              itemCount: snapshot.data.length,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    activeCardVN.value = index;
                                    dev.log(
                                        'checking for offerings from $index ');
                                    _selectedPackage = snapshot.data[index];
                                    dev.log(
                                        'offering is tied to package:::> $_selectedPackage');
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
                          ),
                          _buttonGroup(
                            context: context,
                            isLoading: isLoading,
                          ),
                        ],
                      )
                    : Column(
                        children: [
                          Center(
                            child: Text(
                              'Grabbing your offers',
                              style:
                                  TextStyle(fontSize: 38, color: Colors.grey),
                            ),
                          ),
                        ],
                      );
          },
        ),
      ),
    );
  }
}

Widget _titleArea({String titleText}) {
  return Flex(
    direction: Axis.horizontal,
    children: [
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
          return Row(
            children: [
              Flexible(
                flex: 1,
                child: _detailBullets(
                  listItemText: bullets[index],
                ),
              ),
            ],
          );
        },
      ),
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
  // TODO: fix this to not clip the text
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: Icon(
          Icons.check_circle,
          size: 20,
          color: Colors.green[700],
        ),
      ),
      Text(
        listItemText,
        style: TextStyle(color: Colors.grey),
      ),
    ],
  );
}

Widget _buttonGroup({BuildContext context, ValueNotifier<bool> isLoading}) {
  final fbdbService = FBDBService();
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 36),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ((_user.subscription != null) && _user.subscription.inTrial
            ? TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: Colors.grey,
                ),
                onPressed: () {
                  if (_user.subscription.inTrial == true) {
                    fbdbService.createNewUser(_user);
                    Navigator.popAndPushNamed(context, ScoreCard.id);
                  }
                },
                child: Text(
                  'Continue FREE Trial',
                  style: TextStyle(fontSize: 10),
                ),
              )
            : Spacer()),
        ((_user.subscription != null) && (_user.subscription.inTrial != null)
            ? TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: Colors.grey,
                ),
                onPressed: isLoading.value
                    ? null
                    : () async {
                        Dialogs.loadingDialog(context);
                        isLoading.value = true;
                        if (await _user.subscription.restoreCustomerInfo() ==
                            false) {
                          dev.log('No purchases to restore');
                          isLoading.value = false;
                          Navigator.pop(context);
                        }
                        fbdbService.createNewUser(_user);
                        isLoading.value = false;
                        Navigator.pop(context);
                        if (!_user.subscription.isActive) {
                          Dialogs.okDialogAction(
                            context,
                            body: 'No active subscription found',
                          );
                        } else {
                          Dialogs.okDialogAction(
                            context,
                            title: 'Active account found on this device',
                            approveFunction: () => {
                              Navigator.pop(context),
                              // Navigator.popAndPushNamed(context, ScoreCard.id),
                            },
                          );
                        }
                      },
                child: Text(
                  'Restore active subscription',
                  style: TextStyle(fontSize: 10),
                ),
              )
            : Spacer()),
        PO1Button(
          'Subscribe',
          onPress: isLoading.value
              ? null
              : () async {
                  try {
                    // TODO: setPurchaseInfo state
                    final customerInfo =
                        await Purchases.purchasePackage(_selectedPackage);
                    if (customerInfo
                        .entitlements.all['premium_user'].isActive) {
                      _user.subscription.setCustomerInfo(customerInfo);
                      fbdbService.createNewUser(_user);
                      Navigator.popAndPushNamed(context, ScoreCard.id);
                    }
                  } on PlatformException catch (e) {
                    dev.log(e.message);
                    Navigator.pop(context);
                  }
                },
        ),
      ],
    ),
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
    final ValueNotifier<double> widthOfScreen =
        useState(MediaQuery.of(context).size.width);
    final ValueNotifier<double> heightOfScreen =
        useState(MediaQuery.of(context).size.height);
    final double activeCardWidth = widthOfScreen.value * 0.33;
    final double inActiveCardWidth = widthOfScreen.value * 0.30;
    final double activeCardHeight = heightOfScreen.value * 0.85;
    final double inActiveCardHeight = heightOfScreen.value * 0.65;
    // useEffect(() {}, [widthOfScreen, heightOfScreen]);
    final ValueNotifier<double> width = useState(widthOfScreen.value / 3);
    final ValueNotifier<double> height = useState(heightOfScreen.value - 20);
    useEffect(() {
      width.value = activeCard ? activeCardWidth : inActiveCardWidth;
      height.value = activeCard ? activeCardHeight : inActiveCardHeight;
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
                  titleText: packageTitleConverter(
                      data.storeProduct.identifier)['name'],
                ),
              ),
              Flexible(
                flex: 1,
                child: RichText(
                  text: TextSpan(
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w700,
                      color: Colors.orangeAccent,
                    ),
                    children: [
                      TextSpan(
                        text: data.storeProduct.priceString,
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
                  details: data.storeProduct.description,
                  bullets: packageTitleConverter(
                      data.storeProduct.identifier)['benefits'],
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
