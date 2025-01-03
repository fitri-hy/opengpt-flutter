class Config {
  static const String _baseUrl = 'https://api.i-as.dev/api/ai/opengpt';
  static const List<String> _models = [
    'gpt-4o-mini',
    'gpt-4-turbo-2024-04-09',
    'gpt-4o-2024-08-06',
    'grok-2',
    'grok-2-mini',
    'grok-beta',
    'claude-3-opus-20240229',
    'claude-3-sonnet-20240229',
    'claude-3-5-sonnet-20240620',
    'claude-3-5-sonnet-20241022',
    'claude-3-5-sonnet-20241022-t',
    'gemini-1.5-flash-exp-0827',
    'gemini-1.5-pro-exp-0827'
  ];

  static String get baseUrl => _baseUrl;
  static List<String> get models => _models;
}
