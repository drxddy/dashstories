abstract class HiveServiceInterface<T> {
  const HiveServiceInterface(this.boxname);

  final String boxname;

  void init();

  void close();

  /// Base method for requesting document data from the box with [boxname].
  T? getDocumentData({required String key});

  T? getDocumentDataAt(int index);
  void setDocumentData({required String key, required T data});

  Future<T> updateDocumentData({required String key, required T newData});

  Future<void> deleteDocumentData({
    required String key,
  });
}
