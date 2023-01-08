import 'package:virtual_tour_guide_manager/screens/category.dart';
import 'package:virtual_tour_guide_manager/screens/category_add.dart';
import 'package:virtual_tour_guide_manager/util/category_argument.dart';
import 'package:flutter/material.dart';

class CategoriesList extends StatelessWidget {
  static const routeName = "/categories";
  final String bldgId;
  const CategoriesList({Key? key, required this.bldgId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(backgroundColor: const Color(0xFF1A1820),),
      backgroundColor: const Color(0xFF1A1820),
      // appBar: AppBar(
      //   backgroundColor: const Color(0xFF1A1820),
      //   title: const Text(''),
      // ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 94,
                ),
                const Text(
                  "Manage Categories",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 28,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: TextButton.icon(
                    key: Key('addCategoryBtn'),
                    icon: const Icon(Icons.add),
                    onPressed: () {
                      Navigator.of(context).pushNamed(
                        AddCategory.routeName,
                        arguments: CategoryArgument(bldgId: bldgId),
                      );
                    },
                    label: Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 10),
                      child: const Text(
                        'Add category',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    // textColor: Colors.white,
                    style: TextButton.styleFrom(
                      primary: const Color(0xFFF9C35C),
                      shape: RoundedRectangleBorder(
                          side: const BorderSide(
                              color: Color(0xFFF9C35C),
                              width: 1,
                              style: BorderStyle.solid),
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                ),
                const SizedBox(height: 4),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 40),
                  child: Category(bldgId: bldgId),
                ),
                // const SizedBox(height: 40),
                // const Expanded(child: Category()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
