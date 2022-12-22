import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:virtual_tour_guide_manager/data/categories/bloc/bloc.dart';

class Category extends StatelessWidget {
  final String bldgId;
  const Category({Key? key, required this.bldgId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: BlocConsumer<CategoriesBloc, CategoriesState>(
        listener: (_, state) {
          if (state is CategoriesOperationError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                // content: Text("Error loading categories"),
                // content: Text("Error loading categories ${state.message}"),
                content: Text("Error: ${state.message}"),
              ),
            );
          }
        },
        builder: (_, state) {
          if (state is CategoriesLoadSuccess) {
            final category = state.categories;
            return Center(
              //margin: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
              child: ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  key: const Key("categoryListView"),
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(
                      height: 15,
                    );
                  },
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: category.length,
                  itemBuilder: (_, idx) {
                    return ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(32),
                        bottomLeft: Radius.circular(32),
                      ),
                      child: ListTile(
                        key: Key('categoryListTile$idx'),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 26.0),
                        tileColor: const Color(0x1AC4C4C4),
                        visualDensity:
                            const VisualDensity(horizontal: 0, vertical: 4),

                        title: Text(category[idx].name,
                            key: Key('categoryNameDisplayText$idx'),
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w700)),
                        // subtitle: Text(
                        //   category[idx].name,
                        // ),

                        trailing: IconButton(
                            icon: const Icon(
                              Icons.cancel_outlined,
                              color: Colors.red,
                            ),
                            onPressed: () {
                              context
                                  .read<CategoriesBloc>()
                                  .add(CategoryDelete(category[idx], bldgId));
                              // Navigator.of(context).pushNamedAndRemoveUntil(
                              //     CategoriesList.routeName, (route) => false);
                              // Navigator.pop(context);
                            }),
                      ),
                    );
                  }),
            );
          }
          // return const CircularProgressIndicator();
          else if (state is CategoriesOperationError) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: const Color(0xFFF9C35C),
                  fixedSize: const Size(243, 41),
                ),
                onPressed: () {
                  BlocProvider.of<CategoriesBloc>(context)
                      .add(CategoriesLoad(bldgId: bldgId));
                },
                child: const Text(
                  "Reload",
                  style: TextStyle(
                    color: Color(0xFF1A1820),
                  ),
                ),
              ),
            );
          }
          return Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                CircularProgressIndicator(
                  backgroundColor: Color.fromARGB(255, 69, 65, 83),
                  valueColor: AlwaysStoppedAnimation(
                      Color.fromARGB(255, 184, 178, 167)),
                  strokeWidth: 7,
                ),
              ]));
        },
      ),
    );
  }
}
