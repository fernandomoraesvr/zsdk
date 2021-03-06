/// Created by luis901101 on 2020-02-11.
enum PrintMode {
  TEAR_OFF,
  PEEL_OFF,
  REWIND,
  CUTTER,
  DELAYED_CUT,
  LINERLESS_PEEL,
  LINERLESS_REWIND,
  LINERLESS_TEAR,
  APPLICATOR,
}

final _mapValueOfName = {
  'tear off': PrintMode.TEAR_OFF,
  'peel off': PrintMode.PEEL_OFF,
  'rewind': PrintMode.REWIND,
  'cutter': PrintMode.CUTTER,
  'delayed cut': PrintMode.DELAYED_CUT,
  'linerless peel': PrintMode.LINERLESS_PEEL,
  'linerless rewind': PrintMode.LINERLESS_REWIND,
  'linerless tear': PrintMode.LINERLESS_TEAR,
  'applicator': PrintMode.APPLICATOR,
};

final _mapNameOfValue = {
  PrintMode.TEAR_OFF: 'tear off',
  PrintMode.PEEL_OFF: 'peel off',
  PrintMode.REWIND: 'rewind',
  PrintMode.CUTTER: 'cutter',
  PrintMode.DELAYED_CUT: 'delayed cut',
  PrintMode.LINERLESS_PEEL: 'linerless peel',
  PrintMode.LINERLESS_REWIND: 'linerless rewind',
  PrintMode.LINERLESS_TEAR: 'linerless tear',
  PrintMode.APPLICATOR: 'applicator',
};

extension PrintModeUtils on PrintMode {
  String get name => _mapNameOfValue[this]!;

  static PrintMode? valueOf(String? name) => _mapValueOfName[name!];
}
