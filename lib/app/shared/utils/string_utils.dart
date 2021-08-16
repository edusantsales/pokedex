class StringUtils {
  static bool isBlank(String? text) {
    if (text != null) {
      if (text.isEmpty) {
        return true;
      } else if (text.trim().isEmpty) {
        return true;
      } else {
        return false;
      }
    } else {
      return true;
    }
  }

  static bool isNotBlank(String? text) {
    if (text != null) {
      if (text.isNotEmpty) {
        return true;
      } else if (text.trim().isNotEmpty) {
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }
}
