/// Basic utility class for hashing.
mixin Hasher {
  /// Returns the hash code.
  static int getHashCode(List<Object> fields) {
    var hash = 0;
    for (var i = 0; i < fields.length; i++) {
      hash = _combine(hash, fields[i].hashCode);
    }
    return _finish(hash);
  }

  static int _combine(int hash, int value) {
    var newHash = 0x1fffffff & (hash + value);
    newHash = 0x1fffffff & (newHash + ((0x0007ffff & newHash) << 10));
    return newHash ^ (newHash >> 6);
  }

  static int _finish(int hash) {
    var newHash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    newHash = newHash ^ (newHash >> 11);
    return 0x1fffffff & (newHash + ((0x00003fff & newHash) << 15));
  }
}
