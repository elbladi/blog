import 'package:blog/constants.dart';
import 'package:blog/models/FloatingOption.dart';
import 'package:flutter/material.dart';

class OptionsWeb extends StatelessWidget {
  final bool favorite;
  final bool editionMode;
  final Function onSelected;
  const OptionsWeb(this.favorite, this.onSelected, this.editionMode, {Key? key})
      : super(key: key);

  void _onSelected(IconData icon) {
    var _iconId;
    if (icon == Icons.favorite_border)
      _iconId = OptionName.NoFavorite;
    else if (icon == Icons.favorite)
      _iconId = OptionName.Favorite;
    else if (icon == Icons.edit || icon == Icons.send)
      _iconId = OptionName.Edit;
    else if (icon == Icons.delete) _iconId = OptionName.Delete;

    onSelected(_iconId);
  }

  Widget _getIcon(IconData icon) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15),
      child: IconButton(
          onPressed: () => _onSelected(icon),
          icon: Icon(icon, color: green, size: 30)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: blue,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20), bottomLeft: Radius.circular(20)),
      ),
      child: IntrinsicHeight(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            favorite
                ? _getIcon(Icons.favorite)
                : _getIcon(Icons.favorite_border),
            editionMode ? _getIcon(Icons.send) : _getIcon(Icons.edit),
            _getIcon(Icons.delete),
          ],
        ),
      ),
    );
  }
}
