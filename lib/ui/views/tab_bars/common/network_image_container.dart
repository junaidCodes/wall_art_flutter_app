import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:wall_art/utils/app_colors.dart';
import 'package:wall_art/utils/image_path.dart';

class NetworkImageContainer extends StatefulWidget {
  String path;
  VoidCallback? onPressed;

  NetworkImageContainer({super.key, required this.path, this.onPressed});

  @override
  State<NetworkImageContainer> createState() => _NetworkImageContainerState();
}

class _NetworkImageContainerState extends State<NetworkImageContainer> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: Container(
        height: 100,
        width: 100,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(15)),
          border: Border.all(color: AppColors.primaryColor),
        ),
        child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(15)),
            child: InkWell(
              onTap: widget.onPressed,
              child: CachedNetworkImage(
                placeholder: (context, url) => Image.asset(
                  PathToImage.placeholder,
                  fit: BoxFit.cover,
                ),
                imageUrl: widget.path,
                fit: BoxFit.cover,
              ),
            )),
      ),
    );
  }
}
