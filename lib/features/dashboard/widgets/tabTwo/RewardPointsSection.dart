import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'offers_tab_view.dart';

class RewardPointsSection extends StatefulWidget {
  const RewardPointsSection({super.key});

  @override
  State<RewardPointsSection> createState() => _RewardPointsSectionState();
}

class _RewardPointsSectionState extends State<RewardPointsSection> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TabBar(
          controller: _tabController,
          labelColor: Colors.black,
          indicatorColor: Colors.orange,
          labelStyle: const TextStyle(fontWeight: FontWeight.bold),
          tabs: const [
            Tab(icon: Icon(Icons.card_giftcard), text: 'Reward points',),
            Tab(icon: Icon(Icons.local_offer), text: 'Offers'),
          ],
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 400, // can adjust based on actual content
          child: TabBarView(
            controller: _tabController,
            children: [
              _buildRewardPointsTab(),
              OffersTabView(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildRewardPointsTab() {
    final rewards = [
      {
        "image": "assets/images/croma_logo.png",
        "itemCode": "IDBI2120_CC",
        "title": "Chroma eVoucher - INR 1000.00",
        "points": "4,000",
      },
      {
        "image": "assets/images/big_bazaar_logo.jpg",
        "itemCode": "IDBI2119_CC",
        "title": "BigBazaar eVoucher - INR 1000.00",
        "points": "4,000",
      },
    ];

    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: rewards.length,
      separatorBuilder: (_, __) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        final reward = rewards[index];
        return Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    reward['image']!,
                    width: 80,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Item code: ${reward['itemCode']}", style: GoogleFonts.poppins(fontSize: 10),),
                        const SizedBox(height: 4),
                        Text(
                          reward['title']!,
                          style: GoogleFonts.poppins(fontWeight: FontWeight.w500, fontSize: 10),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          "${reward['points']} Pts",
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  ),

                ],
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
                onPressed: () {},
                child: Text("Redeem now", style: GoogleFonts.poppins(color: Colors.white, fontSize: 10)),
              )
            ],
          ),


        );
      },
    );
  }
}
