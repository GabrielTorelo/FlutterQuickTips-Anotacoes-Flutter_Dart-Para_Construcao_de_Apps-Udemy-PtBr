class SqliteQueries {
  static const String createDatabase = """
    CREATE TABLE places(
      id TEXT PRIMARY KEY, 
      title TEXT, 
      image TEXT, 
      loc_lat REAL, 
      loc_lng REAL, 
      address TEXT
    )
  """;
}
