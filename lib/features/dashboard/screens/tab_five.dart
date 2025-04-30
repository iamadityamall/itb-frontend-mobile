import 'package:aifinno_atlas_mobile_app/features/dashboard/widgets/tabTwo/loan/AbstractFooter.dart';
import 'package:flutter/material.dart';
import '../widgets/tabFive/events_crafted_widget.dart';
import '../widgets/tabFive/exclusive_idbi_cards.dart';
import '../widgets/tabFive/game_of_the_day_card.dart';
import '../widgets/tabFive/grow_your_money_card.dart';
import '../widgets/tabFive/news_handpicked_section.dart';
import '../widgets/tabFive/special_deals_section.dart';
import '../widgets/tabFive/video_of_the_day.dart';
import '../widgets/tabFive/whats_new_today_widget.dart';

class TabFive extends StatelessWidget {
  const TabFive({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          WhatsNewTodayWidget(userName: "Ashish"),
          SizedBox(height: 10,),
          // Add more widgets below like:
          EventsCraftedWidget(),
          SizedBox(height: 10,),
          GameOfTheDayCard(),
          SizedBox(height: 20,),
          ExclusiveIDBICards(),
          SizedBox(height: 20,),
          GrowYourMoneySection(),
          SizedBox(height: 20,),
          SpecialDealsSection(),
          SizedBox(height: 20,),
          NewsHandpickedSection(),
          SizedBox(height: 20,),
          AbstractFooter()
          // DiscoverOffersCarousel(),
          // PopularCategories(),
          // ExclusiveDealsWidget(),
        ],
      ),
    );
  }
}
