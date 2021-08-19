abstract class ILocalStorage {
  Future get(String key);
  Future getList(String key);
  Future delete(String key);
  Future put(String key, dynamic value);
  Future putList(String key, dynamic value);
}
