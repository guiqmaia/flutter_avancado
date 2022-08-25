import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconforest_clarity/clarity.dart';

void main() {
  runApp(const MyApp());
}

const int _primaryWhite = 0xFF0000;

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool visibility = false;

  void changeVisibility() {
    visibility = !visibility;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade800.withOpacity(0.7),
        body: CustomScrollView(
          shrinkWrap: true,
          slivers: [
            SliverAppBar(
              pinned: true,
              floating: false,
              snap: false,
              backgroundColor: Colors.grey.shade900.withOpacity(0.95),
              expandedHeight: MediaQuery.of(context).size.height * 0.68,
              stretch: true,
              actions: [
                Padding(
                  padding: const EdgeInsets.only(
                    right: 15,
                  ),
                  child: Row(
                    children: const [
                      CircleAvatar(
                        radius: 18,
                        backgroundColor: Colors.green,
                        child: Icon(
                          Icons.card_giftcard_outlined,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      CircleAvatar(
                        radius: 18,
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.person,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
              flexibleSpace: FlexibleSpaceBar(
                background: Stack(
                  children: [
                    Opacity(
                      opacity: 0.5,
                      child: Image.network(
                        'https://media.istockphoto.com/vectors/abstract-color-city-building-landscape-pattern-background-vector-id1168302454?b=1&k=20&m=1168302454&s=170667a&w=0&h=sMAv-gqBefYXusoYMOG3YPN8QLOuOThYGUFnZi_gABU=',
                        fit: BoxFit.cover,
                        height: MediaQuery.of(context).size.height * 0.8,
                        width: double.maxFinite,
                      ),
                    ),
                    Positioned(
                      bottom: 20,
                      left: 5,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InkWell(
                            onTap: () {},
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Patrimônio',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  const SizedBox(height: 5),
                                  Row(
                                    children: [
                                      Visibility(
                                        visible: visibility,
                                        replacement: Container(
                                          width: MediaQuery.of(context).size.width * 0.55,
                                          height: MediaQuery.of(context).size.height * 0.06,
                                          decoration: BoxDecoration(
                                            color: Colors.grey.shade600,
                                            borderRadius: BorderRadius.circular(4),
                                          ),
                                        ),
                                        child: SizedBox(
                                          width: MediaQuery.of(context).size.width * 0.57,
                                          height: MediaQuery.of(context).size.height * 0.06,
                                          child: const Text(
                                            'R\$ 100.000,00',
                                            style: TextStyle(
                                              color: Colors.white,
                                              letterSpacing: 2,
                                              fontSize: 30,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      const Icon(
                                        Icons.keyboard_arrow_right,
                                        color: Colors.white,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 15),
                                  const Text(
                                    'Rendimento',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  const SizedBox(height: 5),
                                  Visibility(
                                    visible: visibility,
                                    replacement: Container(
                                      width: MediaQuery.of(context).size.width * 0.37,
                                      height: MediaQuery.of(context).size.height * 0.04,
                                      decoration: BoxDecoration(
                                        color: Colors.grey.shade600,
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                    ),
                                    child: SizedBox(
                                      width: MediaQuery.of(context).size.width * 0.37,
                                      height: MediaQuery.of(context).size.height * 0.04,
                                      child: const Text(
                                        '+R\$ 2.500,00',
                                        style: TextStyle(
                                          color: Colors.white,
                                          letterSpacing: 2,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 15),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CircleAvatar(
                              backgroundColor: Colors.grey.shade800.withOpacity(0.95),
                              radius: 15,
                              child: InkWell(
                                onTap: changeVisibility,
                                child: const Icon(
                                  CupertinoIcons.eye_slash_fill,
                                  color: Colors.white,
                                  size: 18,
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
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.18,
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Conta',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Visibility(
                                visible: visibility,
                                replacement: Container(
                                  width: MediaQuery.of(context).size.width * 0.22,
                                  height: MediaQuery.of(context).size.height * 0.04,
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade600,
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                ),
                                child: const Text(
                                  'R\$ 0,00',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                              Icon(
                                Icons.keyboard_arrow_right,
                                color: Colors.grey.shade800,
                              ),
                            ],
                          ),
                          Text(
                            'Rendimento: R\$ 0,00',
                            style: TextStyle(
                              color: Colors.green.shade900,
                              fontWeight: FontWeight.w700,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.15,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 15,
                      ),
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 4,
                        itemBuilder: (_, i) {
                          return const RoundedButtonActions();
                        },
                      ),
                    ),
                  ),
                  Divider(
                    height: 1,
                    color: Colors.grey.shade900,
                    thickness: 2,
                  ),
                  const SizedBox(height: 25),
                  const Padding(
                    padding: EdgeInsets.only(
                      left: 15,
                    ),
                    child: Text(
                      'Novidades',
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 1,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.3,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 11,
                      itemBuilder: (_, i) {
                        return const NewsCard();
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.grey.shade900.withOpacity(0.95),
          elevation: 1,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage(
                  'assets/images/warren_logo.png',
                ),
                color: Colors.pink,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Clarity(Clarity.picture_line),
              label: 'Carteiras',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.portrait),
              label: 'Bolsa',
            ),
          ],
        ),
      ),
    );
  }
}

class RoundedButtonActions extends StatelessWidget {
  const RoundedButtonActions({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: InkWell(
        child: Column(
          children: const [
            CircleAvatar(
              backgroundColor: Colors.pink,
              radius: 30,
              child: Icon(
                Icons.attach_money,
                size: 25,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Investir',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NewsCard extends StatelessWidget {
  const NewsCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 4, right: 4),
      child: Column(
        children: [
          Stack(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.14,
                width: MediaQuery.of(context).size.width * 0.85,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                  child: Image.network(
                    'https://media.gq-magazine.co.uk/photos/5e25d00550c26e0008a9b030/master/pass/20200120-invest.jpg',
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              const Positioned(
                top: 5,
                right: 5,
                child: CircleAvatar(
                  radius: 12,
                  child: Icon(
                    Icons.delete,
                    size: 20,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
              color: Colors.grey.shade900,
            ),
            height: MediaQuery.of(context).size.height * 0.15,
            width: MediaQuery.of(context).size.width * 0.85,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  Text(
                    'Primeiros Passos na Bolsa',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    'Warren e B3 lançam o programa Minha Primeira Ação, disponível gratuitamente',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w300,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
