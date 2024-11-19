class RepositoryResponse<T> {
  final T? data;
  final String? error;

  bool get hasError => data == null || error != null;

  const RepositoryResponse({this.data, this.error});
}
