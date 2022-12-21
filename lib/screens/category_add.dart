import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ar_indoor_nav_admin/data/categories/bloc/bloc.dart';
import 'package:ar_indoor_nav_admin/data/categories/models/categories.dart';

class AddCategory extends StatefulWidget {
  static const routeName = '/categoryAdd';
  final String bldgId;
  const AddCategory({Key? key, required this.bldgId}) : super(key: key);
  @override
  _AddCategoryState createState() => _AddCategoryState();
}

class _AddCategoryState extends State<AddCategory> {
  final _formKey = GlobalKey<FormState>();
  final Map<String, dynamic> _categoryPayload = {};
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                const SizedBox(height: 80),
                const Text(
                  "Add Category",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 36,
                  ),
                ),
                const SizedBox(height: 36),
                Container(
                  height: 260,
                  color: const Color(0x1AC4C4C4),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 22),
                    child: Column(children: [
                      const SizedBox(height: 22),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            "Enter category Info",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),
                      Form(
                        key: _formKey,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Align(
                                alignment: Alignment.topLeft,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 5.0),
                                  child: Text(
                                    "Category Name",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline2
                                        ?.copyWith(
                                          // fontSize: screenHeight * 0.021,
                                          fontSize: 14,
                                          color: Colors.white,
                                          fontFamily: 'Poppins Medium',
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 8),
                              Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                decoration: BoxDecoration(
                                  color: const Color(0x1AC4C4C4),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: TextFormField(
                                    key: const Key('categoryNameField'),
                                    initialValue: '',
                                    style: const TextStyle(color: Colors.white),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Category name is required';
                                      }
                                      return null;
                                    },
                                    decoration: const InputDecoration(
                                        // labelText: 'Category name'
                                        ),
                                    onSaved: (value) {
                                      setState(() {
                                        _categoryPayload["name"] = value;
                                      });
                                    }),
                              ),
                              const SizedBox(height: 14),
                            ]),
                      ),
                      const SizedBox(height: 20),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: ElevatedButton(
                          key: const Key('addCategorySubmitButton'),
                          style: ElevatedButton.styleFrom(
                            primary: const Color(0xFFF9C35C),
                            // fixedSize: Size(243, 41),
                            fixedSize: const Size(200, 34),
                          ),
                          onPressed: () {
                            final form = _formKey.currentState;
                            if (form!.validate()) {
                              form.save();
                              final CategoryEvent event = CategoryCreate(
                                Category(
                                  name: _categoryPayload["name"],
                                ),
                                widget.bldgId,
                              );
                              BlocProvider.of<CategoriesBloc>(context)
                                  .add(event);
                              // Navigator.of(context).pushNamedAndRemoveUntil(
                              //     CategoriesList.routeName, (route) => false);
                              Navigator.pop(context);
                            }
                          },
                          child: const Text(
                            "Add Category",
                            style: TextStyle(
                              color: Color(0xFF1A1820),
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    ]),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
