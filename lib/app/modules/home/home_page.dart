import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lead_news/app/modules/auth/auth_controller.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({
    Key key,
    this.title = "Home",
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final authController = Modular.get<AuthController>();
    final user = authController.user;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          user.isAdmin
              ? IconButton(
                  icon: Icon(Icons.settings),
                  onPressed: () => Modular.to.pushNamed('/settings'),
                )
              : CircleAvatar(
                  backgroundImage: NetworkImage(authController.user.imageUrl),
                ),
        ],
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            GestureDetector(
              onTap: () => Modular.to.pushNamed('top-headlines'),
              child: SizedBox(
                height: 160,
                width: 320,
                child: ClipPath(
                  clipper: ShapeBorderClipper(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                    ),
                  ),
                  child: Image.network(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQXO-mvJaeVhizmLSu0J9M5mfc7Mw7vA_omo4pmGT6ek0UVe5q_VuYfWQQeg4AUC599ParOG0-So59mt3HCFNTWpNX29VB0p9M&usqp=CAU&ec=45732301',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SizedBox(height: 42),
            GestureDetector(
              onTap: () => Modular.to.pushNamed('search-news'),
              child: SizedBox(
                height: 160,
                width: 320,
                child: ClipPath(
                  clipper: ShapeBorderClipper(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                    ),
                  ),
                  child: Image.network(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTJ5qiGygxoPT3B5BzUAvS3kBYVmVyPvEf2ZuRIW_Keco-fXhDmKsot4ibt0YQCSLgQ_VFrR8x8RtZCkyyDTlQlcOX1Xawa-m0&usqp=CAU&ec=45732301',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
