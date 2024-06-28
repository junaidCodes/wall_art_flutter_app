// import 'package:flutter/material.dart';
// import 'package:telephony/telephony.dart';
// import 'package:url_launcher/url_launcher.dart';

// import 'package:wowcut/Common/extensions.dart';
// import 'package:wowcut/Routes/route_name.dart';
// import 'package:wowcut/Utils/button.dart';
// import 'package:wowcut/Utils/tab_bar.dart';
// import 'package:wowcut/Views/HomeScreen/Common/home_screen_header.dart';

// import 'package:wowcut/Views/SalonDetailsAndServices/Common/info_plate.dart';
// import 'package:wowcut/Views/TabBarTabs/about_us.dart';
// import 'package:wowcut/Views/TabBarTabs/packages.dart';
// import 'package:wowcut/Views/TabBarTabs/review.dart';
// import 'package:wowcut/Views/TabBarTabs/services.dart';
// import 'package:wowcut/Views/TabBarTabs/specialist.dart';
// import 'package:share_plus/share_plus.dart';

// class SalonServicesView extends StatefulWidget {
//   const SalonServicesView({super.key});

//   @override
//   State<SalonServicesView> createState() => _SalonServicesViewState();
// }

// class _SalonServicesViewState extends State<SalonServicesView> {
//   ScrollController controllScroll = ScrollController();
//   @override
//   Widget build(BuildContext context) {
//     return
//      Scaffold(
//       backgroundColor: Colors.white,
//       body: NestedScrollView(
//         headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
//           return <Widget>[
//             SliverAppBar(
//               backgroundColor: Colors.white,
//               toolbarHeight:
//                   // MediaQuery.of(context).size.height * 1 * 0.72,
//                   457,
//               automaticallyImplyLeading: false,
//               flexibleSpace: Column(
//                 children: [

//                 ],
//               ),
//               pinned: false,
//             ),
//           ];
//         },
//         body: Column(
//           children: [
//             const SizedBox(
//               height: 15,
//             ),
//             Expanded(
//               child: CustomTabBar(tabTitles: const [
//                 'Services',
//                 'Specialist',
//                 'Package',
//                 'Review',
//                 'About Us'
//               ], pages: [
//                 const Center(child: ServicesTab()),
//                 const Center(child: SpcialistTab()),
//                 const Center(child: PackagesTab()),
//                 Center(child: ReviewTab()),
//                 const Center(child: AboutUsTab()),
//               ]),
//             )
//           ],
//         ),
//       ),
//     );
//   }

// }
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:wall_art/routes/route_names.dart';
import 'package:wall_art/ui/views/tab_bars/category_tab_bar.dart';
import 'package:wall_art/ui/views/tab_bars/home_tab_bar.dart';
import 'package:wall_art/utils/app_colors.dart';
import 'package:wall_art/utils/button.dart';
import 'package:wall_art/utils/image_path.dart';
import 'package:wall_art/utils/tab_bar.dart';

class SalonServicesView extends StatefulWidget {
  const SalonServicesView({super.key});

  @override
  State<SalonServicesView> createState() => _SalonServicesViewState();
}

class _SalonServicesViewState extends State<SalonServicesView> {
  ScrollController controllScroll = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              backgroundColor: Colors.white,
              toolbarHeight:
                  // MediaQuery.of(context).size.height * 1 * 0.72,
                  457,
              automaticallyImplyLeading: false,
              flexibleSpace: Column(
                children: [
                  Container(
                    height: 200,
                    color: Colors.amber,
                  )
                ],
              ),
              pinned: false,
            ),
          ];
        },
        body: Stack(
          children: [
            Column(
              children: [
                const SizedBox(
                  height: 15,
                ),
                Expanded(
                  child: CustomTabBar(tabTitles: const [
                    'Home',
                    'Category'
                  ], pages: const [
                    PackagesTab(),
                    CategoryTabBar(),
                  ]),
                )
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: PrimaryButton(
                    text: "Book Appointment",
                    onPressed: () {
                      // Navigator.pushNamed(context, RouteName.bookingView);
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PackagesTab extends StatelessWidget {
  final ScrollController? scrollControl;

  const PackagesTab({super.key, this.scrollControl});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25),
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Packages",
                  style: GoogleFonts.inter(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: AppColors.whiteColor),
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                "(4)",
                style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: AppColors.primaryColor),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: ListView.builder(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).size.height * 0.1),
                controller: scrollControl,
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                itemCount: PathToImage.weeding.length,
                itemBuilder: (BuildContext context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(
                      bottom: 20,
                    ),
                    child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            // color: Colors.amber,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                                color: const Color(0xff7f7f7f33)
                                    .withOpacity(0.1))),
                        child: Padding(
                          padding: const EdgeInsets.only(right: 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Image.asset(
                                PathToImage.weeding[index],
                                height: 100,
                                width: 120,
                              ),
                              Column(
                                // mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    height: 12,
                                  ),
                                  SizedBox(
                                    // height: 00,
                                    width: 170,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Align(
                                          alignment: Alignment.bottomLeft,
                                          child: Text(
                                            "Beauty Make Up",
                                            style: GoogleFonts.inter(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                                color: AppColors.whiteColor),
                                          ),
                                        ),
                                        Text(
                                          "Special Offers Package Valid until Dec 10, 2023",
                                          style: GoogleFonts.inter(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500,
                                              color: AppColors.lightGrey),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "\$100",
                                              style: GoogleFonts.inter(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500,
                                                  color:
                                                      AppColors.primaryColor),
                                            ),
                                            PrimaryButton(
                                              fontSize: 12,
                                              text: "Book Now",
                                              onPressed: () {
                                                // Navigator.pushNamed(context,
                                                //     RouteName.bookingView);
                                              },
                                              width: 80,
                                              height: 32,
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
