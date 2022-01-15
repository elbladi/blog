import 'package:blog/models/FloatingOption.dart';
import 'package:flutter/material.dart';

List<FloatingOption> options = [
  new FloatingOption(OptionName.Calendar, Icons.calendar_today),
  new FloatingOption(OptionName.NoFavorite, Icons.favorite_border),
  new FloatingOption(OptionName.Edit, Icons.edit),
  new FloatingOption(OptionName.Delete, Icons.delete),
];
