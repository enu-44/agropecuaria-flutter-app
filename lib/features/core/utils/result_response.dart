class Result<T, E> {
  final T? _value;
  final E? _error;

  Result._(this._value, this._error);

  factory Result.ok(T value) => Result<T, E>._(value, null);
  factory Result.error(E error) => Result<T, E>._(null, error);

  T? get value => _value;
  E? get error => _error;

  bool get isOk => _value != null;
  bool get isError => _error != null;
}