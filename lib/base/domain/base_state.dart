import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

int inititalPage = 1;

class BaseState<T> extends GetxController with StateMixin<T> {
  int? nextPage = inititalPage;
  T? data;

  BaseState() {
    change(null, status: RxStatus.empty());
  }

  void onSuccess({T? data, int? nextPage}) {
    this.nextPage = nextPage ?? this.nextPage;

    if (status.isLoadingMore) {
      change(((value as List<dynamic>) + (data as List<dynamic>) as T),
          status: RxStatus.success());
    } else {
      change(data, status: RxStatus.success());
    }
  }

  void onError(String? message) {
    change(null, status: RxStatus.error(message));
  }

  void onLoading() {
    if (nextPage! > inititalPage) {
      change(value, status: RxStatus.loadingMore());
    } else {
      change(null, status: RxStatus.loading());
    }
  }

  void onRefreshing() {
    nextPage = inititalPage;
    data = null;
    change(null, status: RxStatus.empty());
  }

  widget({
    Function(T? value)? onSuccess,
    Widget Function(String? error)? onError,
    Widget? onLoading,
    Widget? onLoadingMore,
    Widget? onEmpty,
  }) {
    return obx((value) {
      if (status.isSuccess) {
        return onSuccess != null ? onSuccess(value) : const SizedBox.shrink();
      }
      if (status.isLoadingMore) {
        return onLoadingMore ?? const SizedBox.shrink();
      }
      // other custom state
      return const SizedBox.shrink();
    },
        onError: onError ??
            (_) {
              return const SizedBox.shrink();
            },
        onLoading:
            onLoading ?? const Center(child: CupertinoActivityIndicator()),
        onEmpty: onEmpty);
  }


}
