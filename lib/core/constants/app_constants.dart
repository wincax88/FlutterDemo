class AppConstants {
  // API 配置
  static const String baseUrl = 'https://api.example.com';
  static const Duration connectTimeout = Duration(seconds: 30);
  static const Duration receiveTimeout = Duration(seconds: 30);

  // 本地存储 Key
  static const String keyToken = 'auth_token';
  static const String keyUserId = 'user_id';
  static const String keyTheme = 'theme_mode';

  // 错误消息
  static const String errorNetwork = '网络连接失败，请检查网络设置';
  static const String errorServer = '服务器错误，请稍后重试';
  static const String errorUnknown = '未知错误';
}

