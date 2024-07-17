import 'package:bookly/core/utlis/style.dart';
import 'package:bookly/features/home/presentation/views/widget/featured_horizontal_list_veiw_book_Detials.dart';
import 'package:flutter/material.dart';

class HorizontalLisatViewBookDetialsSection extends StatelessWidget {
  const HorizontalLisatViewBookDetialsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("you can also like", style: Style.textStyle16),
        SizedBox(
          height: 5,
        ),
        FeaturedHorizontalListViewBookDetails(),
        SizedBox(
          height: 20,
        )
      ],
    );
  }
}
