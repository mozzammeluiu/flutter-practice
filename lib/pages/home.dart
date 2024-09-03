import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test_drive/models/category_model.dart';
import 'package:test_drive/models/diet_model.dart';
import 'package:test_drive/models/popular_model.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  List<CategoryModel> categories = [];
  List<DietModel> diets = [];
  List<PopularDietsModel> popularDiets = [];
  void _getCategories() {
    categories = CategoryModel.getCategories();
  }

  void _getDiets() {
    diets = DietModel.getDiets();
  }

  void _getPopularDiets() {
    popularDiets = PopularDietsModel.getPopularDiets();
  }

  @override
  Widget build(BuildContext context) {
    _getCategories();
    _getDiets();
    _getPopularDiets();
    return Scaffold(
      appBar: appBar(),
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          _searchField(),
          const SizedBox(height: 40),
          _categoriesList(),
          const SizedBox(height: 40),
          _dietSection(),
          const SizedBox(height: 40),
          _popularDietSection(),
          const SizedBox(height: 40),
        ],
      ),
    );
  }

  Column _popularDietSection() {
    return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                'Popular Diets',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            ListView.separated(
              itemCount: popularDiets.length,
              shrinkWrap: true,
              separatorBuilder: (context, index) =>
                  const SizedBox(height: 20),
              itemBuilder: (context, index) => Container(
                  height: 115,
                  decoration: BoxDecoration(
                      color: popularDiets[index].boxIsSelected
                          ? Colors.white
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: popularDiets[index].boxIsSelected
                          ? [
                              BoxShadow(
                                  color: const Color(0xff1D1617)
                                      .withOpacity(0.07),
                                  offset: const Offset(0, 10),
                                  blurRadius: 40,
                                  spreadRadius: 0)
                            ]
                          : []),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SvgPicture.asset(
                        popularDiets[index].iconPath,
                        width: 65,
                        height: 65,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            popularDiets[index].name,
                            style: const TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                                fontSize: 16),
                          ),
                          Text(
                            '${popularDiets[index].level} | ${popularDiets[index].duration} | ${popularDiets[index].calories}',
                            style: const TextStyle(
                                color: Color(0xff7B6F72),
                                fontSize: 13,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: SvgPicture.asset(
                          'assets/icons/button.svg',
                          width: 30,
                          height: 30,
                        ),
                      )
                    ],
                  )),
            ),
          ],
        );
  }

  Column _dietSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 20),
          child: Text(
            'Recommendation\nfor Diet',
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black),
          ),
        ),
        const SizedBox(height: 15),
        SizedBox(
          height: 240,
          child: ListView.separated(
            itemCount: diets.length,
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(left: 20, right: 20),
            separatorBuilder: (context, index) => const SizedBox(width: 25),
            itemBuilder: (context, index) => Container(
              width: 210,
              decoration: BoxDecoration(
                color: diets[index].boxColor.withOpacity(0.3),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SvgPicture.asset(diets[index].iconPath),
                    Column(
                      children: [
                        Text(
                          diets[index].name,
                          style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.black),
                        ),
                        Text(
                          '${diets[index].level} | ${diets[index].duration} | ${diets[index].calories}',
                          style: const TextStyle(
                              color: Color(0xff7B6F72),
                              fontSize: 13,
                              fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                    Container(
                      height: 45,
                      width: 130,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(colors: [
                            diets[index].isSelected
                                ? const Color(0xff9DCEFF)
                                : Colors.transparent,
                            diets[index].isSelected
                                ? const Color(0xff92A3FD)
                                : Colors.transparent
                          ]),
                          borderRadius: BorderRadius.circular(50)),
                      child: Center(
                        child: Text(
                          'View',
                          style: TextStyle(
                              color: diets[index].isSelected
                                  ? Colors.white
                                  : const Color(0xffC58BF2),
                              fontWeight: FontWeight.w600,
                              fontSize: 14),
                        ),
                      ),
                    ),
                  ]),
            ),
          ),
        )
      ],
    );
  }

  Column _categoriesList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 20),
          child: Text(
            'Category',
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black),
          ),
        ),
        const SizedBox(height: 15),
        Container(
          height: 120,
          color: Colors.white,
          child: ListView.separated(
              itemCount: categories.length,
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.only(left: 20, right: 20),
              separatorBuilder: (context, index) => const SizedBox(width: 20),
              itemBuilder: (context, index) => Container(
                    width: 100,
                    decoration: BoxDecoration(
                        color: categories[index].boxColor.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(16)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          decoration: const BoxDecoration(
                              color: Colors.white, shape: BoxShape.circle),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SvgPicture.asset(categories[index].iconPath),
                          ),
                        ),
                        Text(
                          categories[index].name,
                          style: const TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                              fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                  )),
        )
      ],
    );
  }

  Container _searchField() {
    return Container(
      margin: const EdgeInsets.only(top: 40, left: 20, right: 20),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            color: const Color(0xff1D1617).withOpacity(0.11),
            blurRadius: 40,
            spreadRadius: 0.0)
      ]),
      child: TextField(
        decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            hintText: 'Search Pancake',
            hintStyle: const TextStyle(fontSize: 14, color: Color(0xffDDDADA)),
            contentPadding: const EdgeInsets.all(15),
            prefixIcon: Padding(
              padding: const EdgeInsets.all(12.0),
              child: SvgPicture.asset('assets/icons/Search.svg'),
            ),
            suffixIcon: SizedBox(
              width: 100,
              child: IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const VerticalDivider(
                      color: Colors.black,
                      indent: 10,
                      endIndent: 10,
                      thickness: 0.1,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SvgPicture.asset('assets/icons/Filter.svg'),
                    ),
                  ],
                ),
              ),
            ),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide.none)),
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      backgroundColor: Colors.white,
      title: const Text('Breakfast'),
      centerTitle: true,
      titleTextStyle: const TextStyle(
          color: Colors.black, fontSize: 20, fontWeight: FontWeight.w700),
      elevation: 0.0,
      leading: Container(
        margin: const EdgeInsets.all(10),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: const Color(0xffF7F8F8),
            borderRadius: BorderRadius.circular(10)),
        child: SvgPicture.asset('assets/icons/Arrow - Left 2.svg',
            width: 20, height: 20),
      ),
      actions: [
        GestureDetector(
          onTap: () {},
          child: Container(
            margin: const EdgeInsets.all(10),
            alignment: Alignment.center,
            width: 37,
            decoration: BoxDecoration(
                color: const Color(0xffF7F8F8),
                borderRadius: BorderRadius.circular(10)),
            child:
                SvgPicture.asset('assets/icons/dots.svg', width: 5, height: 5),
          ),
        ),
      ],
    );
  }
}
