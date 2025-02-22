class DbName {
  // ignore: constant_identifier_names
  static const String _CASINUM_BASE_NAME = 'casinum';
  // ignore: constant_identifier_names
  static const String _PLAYER_BASE_NAME = 'player';
  // ignore: constant_identifier_names
  static const String _LOGGER_BASE_NAME = 'logger';
  
  static String getCasinumBaseName() => _CASINUM_BASE_NAME;
  static String getPlayerBaseName(int casinumId) => "${_PLAYER_BASE_NAME}_$casinumId";
  static String getLoggerBaseName(int casinumId) => "${_LOGGER_BASE_NAME}_$casinumId";
}