import 'package:aloroupia/core/manager/images/app_images.dart';
import 'package:aloroupia/core/manager/navigation/navigation.dart';
import 'package:aloroupia/core/manager/responsive/size_config.dart';
import 'package:aloroupia/features/home/data/category_list.dart';
import 'package:aloroupia/features/home/presentation/views/widgets/category_item.dart';
import 'package:aloroupia/features/home/presentation/views/widgets/furniture_grid_view.dart';
import 'package:flutter/widgets.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.width(context, 0.0348), //15
      ),
      child: Column(
        spacing: SizeConfig.height(context, 0.0161), //15
        children: [
          SizedBox(),
          Container(
            height: SizeConfig.height(context, 0.2682), //250
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                SizeConfig.width(context, 0.0465),
              ), //20
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(AppImages.homeBoardImage),
              ),
            ),
          ),
          SizedBox(
            height: SizeConfig.height(context, 0.0482), //45
            child: ListView.separated(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: categoryList(context).length,
              itemBuilder: (context, index) {
                return _buildCategoryItem(index);
              },
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(width: SizeConfig.width(context, 0.0697)); //30
              },
            ),
          ),
          FurnitureGridView(),
        ],
      ),
    );
  }

  Widget _buildCategoryItem(int index) {
    return CategoryItem(
      categoryName: categoryList(context)[index],
      onTap: () {
        context.pushNamed(categories[index].toString());
      },
    );
  }
}
