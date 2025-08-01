import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:search_engine/home/itemcard.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> with TickerProviderStateMixin {
  final TextEditingController _controller = TextEditingController();
  late final PageController _pageController;
  late final AnimationController _animationController;
  late final Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.9);

    _animationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    _slideAnimation = Tween<Offset>(begin: const Offset(0, 1), end: Offset.zero)
        .animate(
          CurvedAnimation(parent: _animationController, curve: Curves.easeOut),
        );

    _animationController.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    _pageController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Column(
        children: [
          // Search Bar
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextFormField(
              controller: _controller,
              decoration: const InputDecoration(
                label: Text('Search', style: TextStyle(fontSize: 12)),
                hintText: "Search Items here",
                suffixIcon: Icon(Icons.search),
              ),
            ),
          ),

          // Swipable Item Cards
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: sampleItems.length,
              itemBuilder: (context, index) {
                final item = sampleItems[index];
                return SlideTransition(
                  position: _slideAnimation,
                  child: ItemCard(
                    title: item['title'],
                    description: item['search_text'],
                    category: item['categories'],
                    cost: (item['price'] as num).toDouble(),
                    imageUrl: getFirstLargeImage(item['images']),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  final List<Map<String, dynamic>> sampleItems = [
    {
      "title":
          "Apple iPod touch (7th Generation) (256GB) - Space Gray (Renewed)",
      "price": 539.99,
      "search_text":
          "Apple iPod touch (7th Generation) (256GB) - Space Gray (Renewed)|Electronics | Portable Audio & Video | MP3 & MP4 Players|Crisp 4-Inch Retina display | Connect using Wi-Fi and Bluetooth | Group FaceTime with family and friends | Your favorite music, gaming, and AR apps in your pocket | A10 Fusion chip for up to 2x faster performance, Up to 3x faster graphics|Crafted for more than just music, the 7th generation 32GB iPod touch from Apple delivers immersive augmented reality gaming experiences, gives you the ability to connect with friends via Group FaceTime, and grants you access to everything the App Store has to offer. Inside the iPod touch is the A10 Fusion chip. The A10 has been engineered to pack enough processing punch to give you fluid performance while running the latest mobile games and augmented reality experiences. When it comes to music, the iPod touch gives you 32GB of storage space so you always have your favorite tracks on hand. You also have the ability to subscribe to Apple Music for millions of streaming options. Listen with some (optional) Bluetooth headphones, or plug the included Apple EarPods into the built-in headphone jack. The iPod touch also features a rear and front camera for snapping HDR photos, 1080p videos, and connecting with friends over Group FaceTime. However you choose to have fun with the iPod touch, you'll play and manage it all through a sharp and vivid 4\" Retina display.With the A10 Fusion chip and brilliant 4\" Retina display, the Apple iPod touch makes for a powerful mobile gaming solution that looks great. Its support for AR games and apps gives you the ability to overlay your digital fun onto your real-world surroundings. Have monsters stomp around the playground, race a friend across a desk, or blast spaceships out of the sky above you. The 7th generation iPod touch also supports Apple Arcade. It's a gaming subscription service from Apple that gives you unlimited access to over 100 new games without ads or in-app purchases. You can play them online or off, and the experience can transfer across all of your Apple devices. Play your favorite game on your new iPod touch, then throw it up on your Apple TV when you get home.|Package Dimensions: 6.77 x 3.23 x 1.26 inches | Item Weight: 6.7 ounces | Manufacturer: Apple Computer | Batteries: 1 Lithium Ion batteries required. (included) | Best Sellers Rank: {'Amazon Renewed': 6891, 'MP3 & MP4 Players': 404} | Date First Available: November 5, 2019 | Brand: Apple | Model Name: iPod touch | Connectivity Technology: Bluetooth, Wi-Fi | Memory Storage Capacity: 256 GB | Color: Space Gray | Screen Size: 4 Inches | Compatible Devices: Headphone | Component Type: Display | Supported Standards: MP4, MP3|",
      "images":
          "[{'thumb': 'https://m.media-amazon.com/images/I/41d0nIuNqnS._AC_US40_.jpg', 'large': 'https://m.media-amazon.com/images/I/41d0nIuNqnS._AC_.jpg', 'variant': 'MAIN', 'hi_res': 'https://m.media-amazon.com/images/I/71Ehh8IqiGS._AC_SL1500_.jpg'}, {'thumb': 'https://m.media-amazon.com/images/I/41AQIIzLCjS._AC_US40_.jpg', 'large': 'https://m.media-amazon.com/images/I/41AQIIzLCjS._AC_.jpg', 'variant': 'PT01', 'hi_res': 'https://m.media-amazon.com/images/I/81oU1rEHarS._AC_SL1500_.jpg'}, {'thumb': 'https://m.media-amazon.com/images/I/41w4KLlkzyS._AC_US40_.jpg', 'large': 'https://m.media-amazon.com/images/I/41w4KLlkzyS._AC_.jpg', 'variant': 'PT02', 'hi_res': 'https://m.media-amazon.com/images/I/71PBaww6-lS._AC_SL1500_.jpg'}, {'thumb': 'https://m.media-amazon.com/images/I/418TSpUYzcS._AC_US40_.jpg', 'large': 'https://m.media-amazon.com/images/I/418TSpUYzcS._AC_.jpg', 'variant': 'PT03', 'hi_res': 'https://m.media-amazon.com/images/I/81EJfAQv6vS._AC_SL1500_.jpg'}, {'thumb': 'https://m.media-amazon.com/images/I/31u2G7N7j0S._AC_US40_.jpg', 'large': 'https://m.media-amazon.com/images/I/31u2G7N7j0S._AC_.jpg', 'variant': 'PT04', 'hi_res': 'https://m.media-amazon.com/images/I/71-dI79KwES._AC_SL1500_.jpg'}, {'thumb': 'https://m.media-amazon.com/images/I/41Uq+DSByzS._AC_US40_.jpg', 'large': 'https://m.media-amazon.com/images/I/41Uq+DSByzS._AC_.jpg', 'variant': 'PT05', 'hi_res': 'https://m.media-amazon.com/images/I/61PJTlYhczS._AC_SL1500_.jpg'}]",
      "categories": "Electronics | Portable Audio & Video | MP3 & MP4 Players",
      "score": 0.5197,
    },
    {
      "title": "Apple iPod Nano 16GB Pink (7th Generation) (Renewed)",
      "price": 279.99,
      "search_text":
          "Apple iPod Nano 16GB Pink (7th Generation) (Renewed)|Electronics | Portable Audio & Video | MP3 & MP4 Players|2.5in (diagonal) Widescreen Multi-Touch Display | Up To 30 Hours Of Music Playback When Fully Charged | Up To 3.5 Hours Of Video Playback When Fully Charged | AAC, MP3, AIFF, And WAV Playback|This pre-owned or refurbished product has been professionally inspected and tested to work and look like new. How a product becomes part of Amazon Renewed, your destination for pre-owned, refurbished products: A customer buys a new product and returns it or trades it in for a newer or different model. That product is inspected and tested to work and look like new by Amazon-qualified suppliers. Then, the product is sold as an Amazon Renewed product on Amazon. If not satisfied with the purchase, renewed products are eligible for replacement or refund under the Amazon Renewed Guarantee.|Product Dimensions: 3.7 x 1.5 x 2.2 inches | Item Weight: 1.12 ounces | Item model number: MD475LL/A | Best Sellers Rank: {'Electronics': 218687, 'MP3 & MP4 Players': 819} | Date First Available: July 25, 2014 | Manufacturer: Apple Computer | Brand: Apple | Model Name: FBA_MD475LL/A | Special Feature: Video Playback | Connectivity Technology: Aux | Memory Storage Capacity: 16 GB | Color: Pink | Screen Size: 2.5 Inches | Compatible Devices: Laptop | Component Type: Display | Supported Standards: MP3, AAC, AIFF, WAV|",
      "images":
          "[{'thumb': 'https://m.media-amazon.com/images/I/31-O6j3J0PL._AC_US40_.jpg', 'large': 'https://m.media-amazon.com/images/I/31-O6j3J0PL._AC_.jpg', 'variant': 'MAIN', 'hi_res': 'https://m.media-amazon.com/images/I/61Q81Gg6guL._AC_SL1500_.jpg'}, {'thumb': 'https://m.media-amazon.com/images/I/31mAqzm5kjL._AC_US40_.jpg', 'large': 'https://m.media-amazon.com/images/I/31mAqzm5kjL._AC_.jpg', 'variant': 'PT01', 'hi_res': 'https://m.media-amazon.com/images/I/61TOVNg8HeL._AC_SL1500_.jpg'}, {'thumb': 'https://m.media-amazon.com/images/I/21aWzJFYowL._AC_US40_.jpg', 'large': 'https://m.media-amazon.com/images/I/21aWzJFYowL._AC_.jpg', 'variant': 'PT02', 'hi_res': 'https://m.media-amazon.com/images/I/51udz0Gnt4L._AC_SL1500_.jpg'}]",
      "categories": "Electronics | Portable Audio & Video | MP3 & MP4 Players",
      "score": 0.5047,
    },
    {
      "title":
          "2021 Apple iMac (24-inch, Apple M1 chip with 8‑core CPU and 8‑core GPU, 8GB RAM, 512GB) - Silver (Renewed)",
      "price": 1134.57,
      "search_text":
          "2021 Apple iMac (24-inch, Apple M1 chip with 8‑core CPU and 8‑core GPU, 8GB RAM, 512GB) - Silver (Renewed)|Electronics | Computers & Accessories | Computers & Tablets | Desktops | All-in-Ones|Immersive 24-inch 4.5K Retina display with P3 wide color gamut and 500 nits of brightness | Apple M1 chip delivers powerful performance with 8-core CPU and 8-core GPU | Strikingly thin 11.5 mm design in vibrant colors | 1080p FaceTime HD camera with M1 ISP for amazing video quality | Studio-quality three-mic array for crystal clear calls and voice recordings | Six-speaker sound system for a remarkably robust and high-quality audio experience | Up to 512GB of ultrafast SSD storage | Two Thunderbolt / USB 4 ports and up to two USB 3 ports | Ultrafast Wi-Fi 6 and Bluetooth 5.0 wireless|This pre-owned or refurbished product has been professionally inspected and tested to work and look like new. How a product becomes part of Amazon Renewed, your destination for pre-owned, refurbished products: A customer buys a new product and returns it or trades it in for a newer or different model. That product is inspected and tested to work and look like new by Amazon-qualified suppliers. Then, the product is sold as an Amazon Renewed product on Amazon. If not satisfied with the purchase, renewed products are eligible for replacement or refund under the Amazon Renewed Guarantee.|Product Dimensions: 21.5 x 5.8 x 18.1 inches | Item Weight: 27.2 pounds | Manufacturer: Apple Computer | Best Sellers Rank: {'Amazon Renewed': 501, 'All-in-One Computers': 4, 'Climate Pledge Friendly: Computers': 424} | Date First Available: October 27, 2021 | Specific Uses For Product: Multimedia, Personal, Business | Brand: Apple | Operating System: macOS Sierra | Memory Storage Capacity: 512 GB | Screen Size: 24 Inches | Ram Memory Installed Size: 8 GB | Model Name: iMac | CPU Model: Apple M1 | Color: Silver | CPU Manufacturer: Apple|",
      "images":
          "[{'thumb': 'https://m.media-amazon.com/images/I/315QyrrDc7S._AC_US40_.jpg', 'large': 'https://m.media-amazon.com/images/I/315QyrrDc7S._AC_.jpg', 'variant': 'MAIN', 'hi_res': 'https://m.media-amazon.com/images/I/61154wJevOS._AC_SL1500_.jpg'}, {'thumb': 'https://m.media-amazon.com/images/I/11B8BBclBZS._AC_US40_.jpg', 'large': 'https://m.media-amazon.com/images/I/11B8BBclBZS._AC_.jpg', 'variant': 'PT01', 'hi_res': 'https://m.media-amazon.com/images/I/41GndnDAwyS._AC_SL1500_.jpg'}, {'thumb': 'https://m.media-amazon.com/images/I/41wIqcPhowS._AC_US40_.jpg', 'large': 'https://m.media-amazon.com/images/I/41wIqcPhowS._AC_.jpg', 'variant': 'PT04', 'hi_res': 'https://m.media-amazon.com/images/I/81njY5tSgTS._AC_SL1500_.jpg'}]",
      "categories":
          "Electronics | Computers & Accessories | Computers & Tablets | Desktops | All-in-Ones",
      "score": 0.4963,
    },
    {
      "title": "Apple 16GB iPad Air Wi-Fi Silver MGLW2LL/A (Renewed)",
      "price": 140,
      "search_text":
          "Apple 16GB iPad Air Wi-Fi Silver MGLW2LL/A (Renewed)|Electronics | Computers & Accessories | Computers & Tablets | Tablets|This Certified Refurbished product is tested and certified to look and work like new. The refurbishing process includes functionality testing, basic cleaning, inspection, and repackaging. The product ships with all relevant accessories, a minimum 90-day warranty, and may arrive in a generic box. Only select sellers who maintain a high performance bar may offer Certified Refurbished products on Amazon.com|Product Highlights  -9.7\" IPS LCD Multi-Touch Retina Display -2048 x 1536 Native Resolution -Tri-Core Apple A8X CPU with M8 Chip -0.96 lb and 0.24\" Thick -802.11a/b/g/n/ac Wi-Fi, Bluetooth 4.0 -Touch ID Fingerprint Sensor -Front 1.2-Megapixel FaceTime HD Camera -Rear 8-Megapixel 1080p iSight Camera -Lightning Connector, AirPlay, AirDrop -Gyro, Accelerator, Ambient Light Sensor|Standing screen display size: 9.7 Inches | Screen Resolution: 2048x1536 | Max Screen Resolution: 2048 x 1536 | RAM: 16 GB | Hard Drive: 16 GB | Wireless Type: 802.11a/b/g/n/ac, 802.11abg, 802.11a/b/g/n, 802.11a | Brand: Apple | Item model number: MGLW2LL/A-cr | Item Weight: 15.4 ounces | Package Dimensions: 11.81 x 9.09 x 3.19 inches | Color: Silver | Rear Webcam Resolution: 326 Lines Per Inch | Flash Memory Size: 16 GB | Power Source: Corded Electric | Best Sellers Rank: {'Amazon Renewed': 8147, 'Computer Tablets': 1779, 'Climate Pledge Friendly: Computers': 2858} | Date First Available: September 11, 2018 | Memory Storage Capacity: 16 GB | Screen Size: 9.7 Inches | Display Resolution Maximum: 2048 x 1536|",
      "images":
          "[{'thumb': 'https://m.media-amazon.com/images/I/41bvGz7T10L._AC_US40_.jpg', 'large': 'https://m.media-amazon.com/images/I/41bvGz7T10L._AC_.jpg', 'variant': 'MAIN', 'hi_res': 'https://m.media-amazon.com/images/I/61ufQeEma5L._AC_SL1200_.jpg'}, {'thumb': 'https://m.media-amazon.com/images/I/414FLoB+NRL._AC_US40_.jpg', 'large': 'https://m.media-amazon.com/images/I/414FLoB+NRL._AC_.jpg', 'variant': 'PT01', 'hi_res': 'https://m.media-amazon.com/images/I/71kXAFOBhCL._AC_SL1500_.jpg'}, {'thumb': 'https://m.media-amazon.com/images/I/31dqlEjhpuL._AC_US40_.jpg', 'large': 'https://m.media-amazon.com/images/I/31dqlEjhpuL._AC_.jpg', 'variant': 'PT02', 'hi_res': 'https://m.media-amazon.com/images/I/51NMNSZRXXL._AC_SL1500_.jpg'}]",
      "categories":
          "Electronics | Computers & Accessories | Computers & Tablets | Tablets",
      "score": 0.4809,
    },
    {
      "title": "My MacBook",
      "price": 8.47,
      "search_text":
          "My MacBook|Electronics | Computers & Accessories | Computers & Tablets|My MacBook | Step-by-step | instructions with callouts to MacBook photos that show you exactly what to do. | Help | when you run into MacBook or Snow Leopard problems or limitations. | Tips and Notes | to help you get the most from your MacBook. | Full-color, step-by-step tasks walk you through getting and keeping | your MacBook working just the way you want. The tasks include: |  Managing and organizing your desktop |  Accessing the Internet through wired, wireless, and cellular networks |  Communicating via email, audio, and video chat |  Troubleshooting system problems |  Entertaining with music and videos |  Keeping in touch and on-time with Calendars and Contacts |  Accessing your data from anywhere with MobileMe |  Sharing files, printers, and even scanners over your network connection |  Expanding your capabilities with peripheral devices |  Protecting and securing your data |  Recording video and publishing it instantly to YouTube or MobileMe |  Configuring your AirPort base station to best support your MacBooks capabilities|About the Author | John Ray is a life-long fan of Apples products; he has been an avid Mac user since its inception in 1984. He relies on Mac OS X both at work and at home because it is a robust, flexible platform for programming, networking, and design.Over the past 12 years, John has written books on Mac OS X, iPhone development, Adobe Creative Suite, Linux, networking, and computer security. He currently manages the application development team in the Office of Sponsored Programs at The Ohio State University. He lives with his long-time girlfriend, their dogs Maddy and Coco, and an assortment of tech toys.|Publisher: Que Pub; 1st edition (January 1, 2010) | Language: English | Paperback: 342 pages | ISBN 10: 0789743035 | ISBN 13: 978-0789743039 | Item Weight: 1.24 pounds | Dimensions: 5.75 x 0.75 x 8.75 inches|",
      "images":
          "[{'large': 'https://m.media-amazon.com/images/I/41fd5WK1LOL._SX331_BO1,204,203,200_.jpg', 'variant': 'MAIN'}]",
      "categories":
          "Electronics | Computers & Accessories | Computers & Tablets",
      "score": 0.4738,
    },
  ];

  String getFirstLargeImage(String imagesString) {
    try {
      // Replace single quotes with double quotes for valid JSON
      final cleanedJson = imagesString
          .replaceAllMapped(
            RegExp(r"([{,])\s*'([^']+?)'\s*:\s*'([^']*?)'\s*"),
            (match) =>
                '${match.group(1)}"${match.group(2)}":"${match.group(3)}"',
          )
          .replaceAll("'", '"'); // fallback for any missed single quotes

      final List<dynamic> images = jsonDecode(cleanedJson);

      if (images.isNotEmpty && images[0] is Map && images[0]['large'] != null) {
        return images[0]['large'];
      }
    } catch (e) {
      debugPrint("Image parsing failed: $e");
    }
    return 'https://via.placeholder.com/150'; // fallback image
  }
}
