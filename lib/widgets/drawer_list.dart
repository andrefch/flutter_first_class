import 'package:class_01/util/navigator_util.dart';
import 'package:flutter/material.dart';

class DrawerList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      left: false,
      right: false,
      bottom: false,
      child: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("Cachorrão da Emive"),
              accountEmail: Text("ocachorraodaemive@emive.com.br"),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQSTY1qd5yRyWPZNcn1EUNglGDd6q0F1AHta4ID0NRBV7Nbp_W6dQ&s"
                ),
              ),
            ),
            _createItem(
              context: context,
              startIconData: Icons.favorite,
              title: "Favoritos",
              subtitle: "Exibe a listagem de favoritos",
              endIconData: Icons.arrow_forward,
              onTap: () {},
            ),
            _createItem(
              context: context,
              startIconData: Icons.help,
              title: "Ajuda",
              subtitle: "Exibe os dados de ajuda do app",
              endIconData: Icons.arrow_forward,
              onTap: () {},
            ),
            _createItem(
              context: context,
              startIconData: Icons.exit_to_app,
              title: "Sair",
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }

  Widget _createItem(
      {@required BuildContext context,
      @required IconData startIconData,
      @required String title,
      String subtitle,
      IconData endIconData,
      Function onTap}) {
    return ListTile(
      leading: Icon(startIconData),
      title: Text(title),
      subtitle: subtitle != null ? Text(subtitle) : null,
      trailing: Icon(endIconData),
      onTap: () {
        popScreen(context);
        onTap();
      },
    );
  }
}
