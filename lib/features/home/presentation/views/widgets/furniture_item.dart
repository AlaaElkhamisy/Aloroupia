import 'package:aloroupia/core/manager/cache/cache_helper.dart';
import 'package:aloroupia/core/manager/colors/app_colors.dart';
import 'package:aloroupia/core/manager/responsive/size_config.dart';
import 'package:aloroupia/core/manager/services/service_locator.dart';
import 'package:aloroupia/core/manager/styles/app_text_styles.dart';

import 'package:aloroupia/features/home/presentation/views/widgets/furniture_image_widget.dart';
import 'package:aloroupia/features/home/presentation/views/widgets/offer_widget.dart';
import 'package:aloroupia/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class FurnitureItem extends StatelessWidget {
  const FurnitureItem({
    super.key,
    required this.offer,
    required this.imageUrl,
    required this.itemId,
    required this.descriptionImage,
  });

  final bool offer;
  final String imageUrl;
  final String itemId;
  final String descriptionImage; // Default image for description
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) {
            return DetailsAlert(
              desriptionImage: descriptionImage,
              descriptionText:
                  'Lorem ipsum dolor sit amet consectetur. Leo tellus viverra enim pharetra cras. Pretium netus varius eu at. Ultricies velit dolor sagittis odio pharetra quis. Scelerisque.',
              itemId: itemId,
            );
          },
        );
      },
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.width(context, 0.0116), //5
          vertical: SizeConfig.height(context, 0.0054), //5
        ),
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.bottomLeft,
          children: [
            FurnitureImageWidget(imageUrl: imageUrl),
            offer ? OfferWidget() : SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}

class DetailsAlert extends StatefulWidget {
  const DetailsAlert({
    super.key,
    required this.desriptionImage,
    required this.descriptionText,
    required this.itemId,
  });
  final String desriptionImage;
  final String descriptionText;
  final String itemId;
  @override
  State<DetailsAlert> createState() => _DetailsAlertState();
}

class _DetailsAlertState extends State<DetailsAlert> {
  bool isLiked = false;

  @override
  void initState() {
    super.initState();
    _loadLikedStatus();
  }

  Future<void> _loadLikedStatus() async {
    final liked = await getIt<CacheHelper>().getData(
      key: 'liked_${widget.itemId}', // Unique key per item
    );
    setState(() {
      isLiked = liked ?? false;
    });
  }

  Future<void> _toggleLike() async {
    final newValue = !isLiked;
    setState(() {
      isLiked = newValue;
    });

    if (newValue) {
      await getIt<CacheHelper>().saveData(
        key: 'liked_${widget.itemId}',
        value: true,
      );
    } else {
      await getIt<CacheHelper>().removeData(key: 'liked_${widget.itemId}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: SizedBox(
        height: 300,
        child: Column(
          //spacing: 10,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  SizeConfig.width(context, 0.0465), //20
                ),
                boxShadow: [
                  BoxShadow(
                    //blurStyle: BlurStyle.outer,
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 2.7,
                    spreadRadius: 0,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: FurnitureImageWidget(
                imageUrl: widget.desriptionImage,
                aspectRatio: 7 / 4,
              ),
            ),
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(
                S.of(context).description,
                style: AppTextStyles.headLinesStyle(
                  context,
                ).copyWith(fontSize: 15),
              ),
              trailing: IconButton(
                padding: EdgeInsets.all(0),
                onPressed: () {
                  _toggleLike();
                },
                icon: Icon(
                  color: isLiked == true ? Colors.red.shade600 : Colors.black,
                  isLiked == true
                      ? CupertinoIcons.heart_fill
                      : CupertinoIcons.heart,
                ),
              ),
            ),
            SizedBox(
              width: 255,
              height: 90,
              child: SingleChildScrollView(
                child: ReadMoreText(
                  widget.descriptionText,
                  trimLines: 4,
                  trimMode: TrimMode.Line,
                  lessStyle: AppTextStyles.headLinesStyle(
                    context,
                  ).copyWith(color: AppColors.appYellowC, fontSize: 12),
                  moreStyle: AppTextStyles.headLinesStyle(
                    context,
                  ).copyWith(color: AppColors.appYellowC, fontSize: 12),
                  trimCollapsedText: S.of(context).readMore,
                  trimExpandedText: S.of(context).readLess,
                  style: AppTextStyles.normalTextStyle(
                    context,
                  ).copyWith(fontSize: 12, color: Colors.grey.shade600),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
