abstract class DataState<T> {
  R when<R>({
    required R Function(T data) success,
    required R Function(Exception error, String message) error,
  }) {
    if (this is DataStateSuccess<T>) {
      return success((this as DataStateSuccess<T>).data);
    } else if (this is DataStateError<T>) {
      return error(
        (this as DataStateError<T>).error,
        (this as DataStateError<T>).message,
      );
    }

    throw Exception('Unhandled state: $this');
  }
}

class DataStateSuccess<T> extends DataState<T> {
  DataStateSuccess(this.data);

  final T data;
}

class DataStateError<T> extends DataState<T> {
  DataStateError(this.error, this.message);

  final Exception error;
  final String message;
}
