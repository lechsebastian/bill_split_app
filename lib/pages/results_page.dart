// ignore_for_file: must_be_immutable

import 'package:auto_size_text/auto_size_text.dart';
import 'package:bill_split/theme/my_font.dart';
import 'package:flutter/material.dart';

class ResultsPage extends StatefulWidget {
  ResultsPage(
      {required this.bill,
      required this.howManyPeople,
      required this.tip,
      required this.tax,
      super.key});

  double bill = 0.0;
  int howManyPeople = 1;
  int tip = 0;
  int tax = 0;

  @override
  State<ResultsPage> createState() => _ResultsPageState();
}

class _ResultsPageState extends State<ResultsPage> {
  late double billPerPerson;

  @override
  void initState() {
    super.initState();

    setState(() {
      billPerPerson =
          (widget.bill + (widget.bill * (widget.tax / 100)) + widget.tip) /
              widget.howManyPeople;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Results',
          style: MyTextStyles.appBar,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.deepPurple.shade300,
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              'Total: \$${widget.bill.toStringAsFixed(2)}',
                              style: MyTextStyles.body.copyWith(
                                  fontSize: 12, color: Colors.black45),
                            ),
                            Text(
                              'Per person',
                              style: MyTextStyles.heading,
                            ),
                            AutoSizeText(
                              '\$${billPerPerson.toStringAsFixed(2)}',
                              style: MyTextStyles.heading,
                              maxLines: 1,
                              minFontSize: 18,
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'People',
                                style: MyTextStyles.body,
                              ),
                              Text(
                                'Tax',
                                style: MyTextStyles.body,
                              ),
                              Text(
                                'Tip',
                                style: MyTextStyles.body,
                              ),
                            ],
                          ),
                          const SizedBox(width: 15),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.howManyPeople.toString(),
                                style: MyTextStyles.body,
                              ),
                              Text(
                                widget.tax.toString(),
                                style: MyTextStyles.body,
                              ),
                              Text(
                                widget.tip.toString(),
                                style: MyTextStyles.body,
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
