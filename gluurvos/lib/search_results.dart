import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialMediaResults extends StatelessWidget {
  final String searchQuery;

  const SocialMediaResults({
    super.key,
    required this.searchQuery,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 80),
      children: [

        // searched username
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(
            '@$searchQuery',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 32,
              fontFamily: 'Georgia',
              fontWeight: FontWeight.bold,
              color: const Color(0xFF787569),
            )
          ),
        ),
        
        const SizedBox(height: 40),

        // platform cards
        _PlatformCard(
          platform: 'X',
          url: 'https://x.com/$searchQuery',
          imagePath: 'assets/x.png',
        ),
        _PlatformCard(
          platform: 'Instagram',
          url: 'https://instagram.com/$searchQuery',
          imagePath: 'assets/instagram.png',
        ),
        _PlatformCard(
          platform: 'TikTok',
          url: 'https://tiktok.com/@$searchQuery',
          imagePath: 'assets/tiktok.png',
        ),
        _PlatformCard(
          platform: 'Pinterest',
          url: 'https://pinterest.com/$searchQuery',
          imagePath: 'assets/pinterest.png',
        ),
        _PlatformCard(
          platform: 'Github',
          url: 'https://github.com/$searchQuery',
          imagePath: 'assets/github.png',
        ),

      ],
    );
  }
}

class _PlatformCard extends StatelessWidget {
  final String platform;
  final String url;
  final String imagePath;

  const _PlatformCard({
    required this.platform,
    required this.url,
    required this.imagePath,
  });

  Future<void> _launchUrl() async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw Exception('Could not launch $uri');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: InkWell(
        onTap: _launchUrl,
        child: Container(
          height: 100,
          padding: const EdgeInsets.all(15.0),
          decoration: BoxDecoration(
            color: const Color(0xFFC9C5B1),
            borderRadius: BorderRadius.circular(25),
            boxShadow: const [
              BoxShadow(
                color: Color(0x40000000),
                blurRadius: 15,
                spreadRadius: 1,
                offset: Offset(0, 0),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Image.asset(
                  imagePath,
                  width: 32,
                  height: 32,
                ),
              ),
              Text(
                platform,
                style: const TextStyle(
                  fontSize: 22,
                  color: Color(0xFF787569),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}