import 'package:ecommercecourse/core/constant/status_view.dart';
import 'package:ecommercecourse/core/constant/imgaeasset.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HandlingDataView extends StatelessWidget {
  final StatusView statusView;
  final Widget widget;
  const HandlingDataView(
      {Key? key, required this.statusView, required this.widget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return statusView == StatusView.loading
        ? Center(
            child: Lottie.asset(AppImageAsset.loading, width: 250, height: 250))
        : statusView == StatusView.offlineFailure
            ? Center(
                child: Lottie.asset(AppImageAsset.offline,
                    width: 250, height: 250))
            : statusView == StatusView.serverFailure
                ? Center(
                    child: Lottie.asset(AppImageAsset.server,
                        width: 250, height: 250))
            : widget;
  }
}

class HandlingDataRequest extends StatelessWidget {
  final StatusView statusView;
  final Widget widget;
  const HandlingDataRequest(
      {Key? key, required this.statusView, required this.widget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return statusView == StatusView.loading
        ? Center(child: Lottie.asset(AppImageAsset.loading, width: 250, height: 250))
        : statusView == StatusView.offlineFailure
            ? Center(child: Lottie.asset(AppImageAsset.offline, width: 250, height: 250))
            : statusView == StatusView.serverFailure
                ? Center(child: Lottie.asset(AppImageAsset.server, width: 250, height: 250))
            : statusView == StatusView.noContent
                ? Center(child: Lottie.asset(AppImageAsset.noContent, width: 250, height: 250))
                : widget;
  }
}
