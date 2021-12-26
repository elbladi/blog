import 'package:flutter/material.dart';

enum OptionName {
  Calendar,
  Favorite,
  NoFavorite,
  Edit,
  Delete,
  Cancel,
}

class FloatingOption {
  OptionName id;
  IconData icon;

  FloatingOption(this.id, this.icon);
}
