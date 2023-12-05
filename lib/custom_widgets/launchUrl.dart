import 'package:url_launcher/url_launcher.dart';

launchURL(url) async {
  if (!await launchUrl(Uri.parse(url.toString()))) {
    throw Exception('Could not launch $url');
  }
}