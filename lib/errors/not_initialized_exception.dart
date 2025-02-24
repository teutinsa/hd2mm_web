class NotInitializedException implements Exception {
  final Object? object;

  const NotInitializedException({this.object});
  
  @override
  String toString() {
    if (object != null) return "`${object.runtimeType}` is not initialized yet!";
    return "Object is not initialize yet!";
  }
}