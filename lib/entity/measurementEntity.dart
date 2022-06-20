class Measurement {
  String _title;
  String _subTitle;
  IconData _icon;

  Measurement(this._title, this._subTitle, this._icon);

  IconData get icon => _icon;

  set icon(IconData value) {
    _icon = value;
  }

  String get subTitle => _subTitle;

  set subTitle(String value) {
    _subTitle = value;
  }

  String get title => _title;

  set title(String value) {
    _title = value;
  }
}