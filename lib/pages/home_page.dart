import 'package:bill_split/common/custom_keyboard.dart';
import 'package:bill_split/pages/results_page.dart';
import 'package:bill_split/theme/my_font.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String bill = '';
  int howManyPeople = 1;
  int tip = 0;
  int tax = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Split Bill',
          style: MyTextStyles.appBar,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
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
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Bill',
                            style: MyTextStyles.heading,
                          ),
                          Text(
                            '\$$bill',
                            style: MyTextStyles.heading,
                          ),
                        ],
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
                                howManyPeople.toString(),
                                style: MyTextStyles.body,
                              ),
                              Text(
                                tax.toString(),
                                style: MyTextStyles.body,
                              ),
                              Text(
                                tip.toString(),
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
              const SizedBox(height: 15),
              Text(
                'How many people?',
                style: MyTextStyles.body,
              ),
              Slider(
                min: 1,
                max: 15,
                divisions: 14,
                label: howManyPeople.toString(),
                value: howManyPeople.toDouble(),
                onChanged: (value) {
                  setState(() {
                    howManyPeople = value.toInt();
                  });
                },
              ),
              const SizedBox(height: 15),
              Row(
                children: [
                  Expanded(
                    child: Center(
                      child: Text(
                        'Tip',
                        style: MyTextStyles.body,
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Center(
                      child: Text(
                        'Tax',
                        style: MyTextStyles.body,
                      ),
                    ),
                  ),
                ],
              ),
              IntrinsicHeight(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.deepPurple.shade300,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: () {
                                  if (tip > 0) {
                                    setState(() {
                                      tip--;
                                    });
                                  }
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade200,
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                  child: const Icon(
                                    Icons.remove,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              Text(
                                '\$${tip.toString()}',
                                style: MyTextStyles.appBar,
                              ),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    if (tip < 100) {
                                      setState(() {
                                        tip++;
                                      });
                                    }
                                  });
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade200,
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                  child: const Icon(
                                    Icons.add,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.deepPurple.shade300,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: () {
                                  if (tax > 0) {
                                    setState(() {
                                      tax--;
                                    });
                                  }
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade200,
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                  child: const Icon(
                                    Icons.remove,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              Text(
                                '${tax.toString()}%',
                                style: MyTextStyles.appBar,
                              ),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    if (tax < 100) {
                                      setState(() {
                                        tax++;
                                      });
                                    }
                                  });
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade200,
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                  child: const Icon(
                                    Icons.add,
                                    color: Colors.black,
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
              const SizedBox(height: 15),
              CustomKeyboard(
                onKeyPress: (key) {
                  switch (key) {
                    case '⌫':
                      setState(() {
                        bill = CustomKeyboard.removeLastChar(bill);
                      });
                      break;
                    case '.':
                      setState(() {
                        bill = CustomKeyboard.addDot(bill);
                      });
                      break;
                    default:
                      setState(() {
                        bill = CustomKeyboard.addNewKey(bill, key);
                      });
                  }
                },
              ),
              const SizedBox(height: 25),
              InkWell(
                onTap: bill != ''
                    ? () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => ResultsPage(
                                bill: double.parse(bill),
                                howManyPeople: howManyPeople,
                                tip: tip,
                                tax: tax),
                          ),
                        );
                      }
                    : null,
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.deepPurple.shade300,
                  ),
                  child: Center(
                    child: Text(
                      'Calculate',
                      style: MyTextStyles.heading.copyWith(
                        color: Colors.white,
                      ),
                    ),
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
