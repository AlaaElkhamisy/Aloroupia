import 'package:aloroupia/features/home/data/furniture_images.dart';
import 'package:aloroupia/features/home/presentation/views/widgets/furniture_item.dart';
import 'package:flutter/material.dart';

class FurnitureGridView extends StatelessWidget {
  const FurnitureGridView({super.key});

  @override
  Widget build(BuildContext context) {
    bool offer = true;
    return GridView.builder(
      shrinkWrap: true,
      itemCount: 20,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemBuilder: (context, index) {
        return FurnitureItem(
          offer: offer,
          imageUrl: generalImage,
          itemId: index.toString(),
          descriptionImage: generalImage,
        );
      },
    );
  }
}
