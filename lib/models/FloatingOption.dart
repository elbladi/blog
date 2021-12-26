import 'package:flutter/material.dart';

enum OptionName {
  Calendar,
  Favorite,
  NoFavorite,
  Edit,
  Delete,
}

class FloatingOption {
  OptionName id;
  IconData icon;

  FloatingOption(this.id, this.icon);
}
