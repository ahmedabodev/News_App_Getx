import 'package:url_launcher/url_launcher.dart';

Future<void>openlink(String link)async{
  var urlink=link;
  if(await canLaunch((urlink))){
    await launch (urlink);
  }
  else{
    await launch (urlink);

  }
}
