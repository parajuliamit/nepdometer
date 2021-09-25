class DataResponse {
  int recentCases;
  int recentDeath;
  int activeCases;
  int recentRecovered;
  int totalDeath;
  int totalCases;
  int totalRecovered;
  int totalTest;
  int updateTime;

  DataResponse({
    required this.activeCases,
    required this.recentCases,
    required this.recentDeath,
    required this.recentRecovered,
    required this.totalCases,
    required this.totalDeath,
    required this.totalRecovered,
    required this.totalTest,
    required this.updateTime,
  });
}
