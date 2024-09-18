import 'widgets/home_page_content.dart';
import 'widgets/company_page_content.dart';
import 'widgets/services_page_content.dart';

final List<Map<String, dynamic>> pageItems = [
  {
    'title': 'Home',
    'imageUrl':
        'images/WindTurbinesFarmField.jpg', // Credit: Pexels, Pixabay, Scenic View of Agricultural Field Against Sky during Sunset
    'widget': const HomePageContent(),
  },
  {
    'title': 'Company',
    'imageUrl':
        'images/WindTurbinesShore.jpg', // Credit: Pexels, 哲聖 林, Wind Turbines on the Coast of a Sea
    'widget': const CompanyPageContent(),
  },
  {
    'title': 'Services',
    'imageUrl':
        'images/WIndTurbineMaintenance.jpg', // Credit: Pexels, Pixabay, Wind Turbines in Operation
    'widget': const ServicesPageContent(),
  },
  {
    'title': 'Contact',
    'imageUrl':
        'images/Rooftops.jpg', // Credit: Pexels, alleksana, Aerial Shot of Buildings
    'widget': null,
  },
];

final List<Map<String, String>> services = [
  {
    'imageUrl': 'images/CargoShip.jpg', // Credit: Pexels, Martin Damboldt
    'text': 'Installation'
  },
  {
    'imageUrl': 'images/Engineers.jpg', // Credit: Pexels, Anamul Rezwan
    'text': 'Maintenance'
  },
  {
    'imageUrl': 'images/Consultants.jpg', // Credit: Pexels, Sora Shimazaki
    'text': 'Administration'
  },
  {
    'imageUrl':
        'images/OfficePeople.jpg', // Credit: Pexels, LinkedIn Sales Navigator
    'text': 'Support'
  },
];

final List<Map<String, String>> socialIcons = [
  {
    'icon': 'images/CameraIconWhite.png',
    'url': 'https://www.shutterstock.com/g/Kristopher+Pepper?rid=263519982',
  },
  {
    'icon': 'images/GitHubWhite.png',
    'url': 'https://github.com/KrisHHFI',
  },
  {
    'icon': 'images/LinkedInWhite.png',
    'url': 'https://www.linkedin.com/in/kristopher-pepper-824184136/',
  },
];

final List<Map<String, String>> textItems = [
  {
    'mainText': '25+',
    'subText': 'years in business',
  },
  {
    'mainText': '200+',
    'subText': 'satisfied customers',
  },
  {
    'mainText': '€3.4bn',
    'subText': 'net sales',
  },
  {
    'mainText': '~6',
    'subText': 'continents',
  },
];
