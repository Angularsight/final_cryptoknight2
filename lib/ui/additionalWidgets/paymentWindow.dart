import 'package:flutter/material.dart';

class PaymentWindow extends StatefulWidget {
  const PaymentWindow({Key? key}) : super(key: key);

  @override
  State<PaymentWindow> createState() => _PaymentWindowState();
}

class _PaymentWindowState extends State<PaymentWindow> with SingleTickerProviderStateMixin {
  int _selectedNavItem = 0;
  bool _isBuySelected = true;
  late TabController tabController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 10, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.3,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          gradient: LinearGradient(
            colors: [
              Color(0xffFFFCFC).withOpacity(0.24),
              Colors.white.withOpacity(0.06)
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          )),


     child: TabBar(
       controller: tabController,
       onTap: (index) {
         setState(() {
           _selectedNavItem = index;
         });
       },
       tabs: [
         Column(
           children: [
             Container(
               width: MediaQuery.of(context).size.width * 0.5,
               height: 10,
               decoration:BoxDecoration(
                 color: _isBuySelected ? Colors.green : Colors.transparent
               ),
             ),
             Text(
               "Buy",
             )
           ],
         )
       ],
     ),
    );
  }
}
