import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ContainerShimmerWidget extends StatelessWidget {
  const ContainerShimmerWidget({
    super.key,
    required this.height,
  });

  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Shimmer.fromColors(
        baseColor: Colors.transparent,
        highlightColor: Colors.deepOrange.withOpacity(0.4),
        enabled: true,
        child: Container(
          height: height,
          decoration: BoxDecoration(
            color: Colors.deepOrange.withOpacity(0.4),
            borderRadius:const BorderRadius.all(
              Radius.circular(20.0),
            ),
          ),
        ),
      ),
    );
  }
}