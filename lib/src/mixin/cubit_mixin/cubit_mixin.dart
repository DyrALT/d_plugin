import 'package:bloc/bloc.dart';

mixin CubitMixin<T> on Cubit<T> {
/// The function emits a state if the stream is not closed.
/// 
/// Args:
///   state (T): The "state" parameter is the value that will be emitted by the method. It represents
/// the current state of the object or system.
/// 
/// Returns:
///   If the `isClosed` condition is true, then the method will return and nothing will be returned
/// explicitly.
  @override
  void emit(T state) {
    if (isClosed) return;
    super.emit(state);
  }
}
