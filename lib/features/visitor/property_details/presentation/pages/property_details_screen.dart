import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:parotia_task/core/router/routes.dart';
import 'package:parotia_task/features/visitor/property_details/presentation/widgets/reservation_bottom_sheet.dart';

class PropertyDetailsScreen extends StatefulWidget {
  final PropertyDetailsScreenArgs args;
  const PropertyDetailsScreen({
    super.key,
    required this.args,
  });

  @override
  State<PropertyDetailsScreen> createState() => _PropertyDetailsScreenState();
}

class PropertyDetailsScreenArgs {
  final String propertyName;
  final List<String> imageUrls;
  final String location;
  final double price;
  final String description;
  final double rating;
  final int reviews;

  PropertyDetailsScreenArgs({
    required this.propertyName,
    required this.imageUrls,
    required this.location,
    required this.price,
    required this.description,
    required this.rating,
    required this.reviews,
  });
}

class _PropertyDetailsScreenState extends State<PropertyDetailsScreen> {
  int _currentImageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.args.propertyName),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite_border),
            onPressed: () {},
          )
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildImageCarousel(),
          const SizedBox(height: 20),
          _buildPropertyInfo(),
          const SizedBox(height: 20),
          _buildDescription(),
          const SizedBox(height: 20),
          _buildAmenities(),
          const SizedBox(height: 20),
          _buildPriceAndBooking(),
        ],
      ),
    );
  }

  void showReservationBottomSheet(BuildContext context) {
    showCupertinoModalBottomSheet(
      // expand: true,
      // bounce: true,
      // containerWidget: (context, animation, child) {
      //   return const ModalNavigator();
      // },
      bounce: true,
      expand: false,
      topRadius: const Radius.circular(30),
      // topRadius: const Radius.circular(30),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      context: context,
      // isScrollControlled: true,
      // useSafeArea: true,
      useRootNavigator: true,
      // scrollControlDisabledMaxHeightRatio: .8,
      // transitionBackgroundColor: Colors.white60,
      backgroundColor: Colors.transparent,
      builder: (context) => const ModalNavigator(),
      // constraints: const BoxConstraints(maxHeight: 600, minHeight: 500),
    ).then((result) {
      if (result == true && context.mounted) {
        Navigator.pushNamed(context, Routes.successScreen);
      }
    });
    // showModalBottomSheet(
    //   context: context,
    //   isScrollControlled: true,
    //   shape: const RoundedRectangleBorder(
    //     borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    //   ),
    //   builder: (context) {
    //     return const ReservationBottomSheet();
    //   },
    // );
  }

  Widget _buildAmenities() {
    List<Map<String, dynamic>> amenities = [
      {"icon": Icons.wifi, "label": "WiFi"},
      {"icon": Icons.pool, "label": "Pool"},
      {"icon": Icons.local_parking, "label": "Parking"},
      {"icon": Icons.kitchen, "label": "Kitchen"},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Amenities",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: amenities.map((item) {
            return Column(
              children: [
                Icon(item["icon"], size: 28, color: Colors.orange),
                const SizedBox(height: 4),
                Text(item["label"], style: const TextStyle(fontSize: 14)),
              ],
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildDescription() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Description",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 4),
        Text(widget.args.description,
            style: const TextStyle(fontSize: 14, color: Colors.grey)),
      ],
    );
  }

  Widget _buildImageCarousel() {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: 250.0,
            enlargeCenterPage: true,
            autoPlay: true,
            onPageChanged: (index, reason) {
              setState(() {
                _currentImageIndex = index;
              });
            },
          ),
          items: widget.args.imageUrls.map((url) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child:
                  Image.network(url, fit: BoxFit.cover, width: double.infinity),
            );
          }).toList(),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: widget.args.imageUrls.asMap().entries.map((entry) {
            return Container(
              width: 8.0,
              height: 8.0,
              margin:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _currentImageIndex == entry.key
                    ? Colors.orange
                    : Colors.grey,
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildPriceAndBooking() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("\$${widget.args.price}/night",
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
              ),
              onPressed: () => showReservationBottomSheet(context),
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                child: Text("Book Now",
                    style: TextStyle(fontSize: 16, color: Colors.white)),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildPropertyInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.args.propertyName,
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
        const SizedBox(height: 4),
        Row(
          children: [
            const Icon(Icons.star, color: Colors.orange, size: 20),
            Text("${widget.args.rating} (${widget.args.reviews} reviews)"),
            const Spacer(),
            const Icon(Icons.location_on, color: Colors.orange, size: 20),
            Text(widget.args.location),
          ],
        ),
      ],
    );
  }
}
