part of '../order_page.dart';

class _BuildOrderTimeline extends StatelessWidget {
  final OrderStatus? status;

  const _BuildOrderTimeline({Key? key, this.status}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    pendingLineColor(OrderStatus val) {
      switch (val) {
        case OrderStatus.pending:
          return theme.primaryColor;
        case OrderStatus.process:
          return theme.primaryColor;
        case OrderStatus.on_delivery:
          return theme.primaryColor;
        case OrderStatus.done:
          return theme.primaryColor;
        default:
          return theme.disabledColor;
      }
    }

    pendingIndicatorColor(OrderStatus val) {
      switch (val) {
        case OrderStatus.pending:
          return Colors.white;
        case OrderStatus.process:
          return Colors.white;
        case OrderStatus.on_delivery:
          return Colors.white;
        case OrderStatus.done:
          return Colors.white;
        default:
          return theme.disabledColor;
      }
    }

    processLineColor(OrderStatus val) {
      switch (val) {
        case OrderStatus.process:
          return theme.primaryColor;
        case OrderStatus.on_delivery:
          return theme.primaryColor;
        case OrderStatus.done:
          return theme.primaryColor;
        default:
          return theme.disabledColor;
      }
    }

    processIndicatorColor(OrderStatus val) {
      switch (val) {
        case OrderStatus.process:
          return Colors.white;
        case OrderStatus.on_delivery:
          return Colors.white;
        case OrderStatus.done:
          return Colors.white;
        default:
          return theme.disabledColor;
      }
    }

    onDeliveryLineColor(OrderStatus val) {
      switch (val) {
        case OrderStatus.on_delivery:
          return theme.primaryColor;
        case OrderStatus.done:
          return theme.primaryColor;
        default:
          return theme.disabledColor;
      }
    }

    onDeliveryIndicatorColor(OrderStatus val) {
      switch (val) {
        case OrderStatus.on_delivery:
          return Colors.white;
        case OrderStatus.done:
          return Colors.white;
        default:
          return theme.disabledColor;
      }
    }

    doneLineColor(OrderStatus val) {
      switch (val) {
        case OrderStatus.done:
          return theme.primaryColor;
        default:
          return theme.disabledColor;
      }
    }

    doneIndicatorColor(OrderStatus val) {
      switch (val) {
        case OrderStatus.done:
          return Colors.white;
        default:
          return theme.disabledColor;
      }
    }

    return Container(
      width: double.infinity,
      constraints: BoxConstraints(
        maxHeight: 100.0,
        maxWidth: double.infinity,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: TimelineTile(
              axis: TimelineAxis.horizontal,
              alignment: TimelineAlign.center,
              isFirst: true,
              lineXY: .2,
              afterLineStyle: LineStyle(
                color: pendingLineColor(status!),
              ),
              indicatorStyle: IndicatorStyle(
                height: 30,
                width: 15,
                color: pendingLineColor(status!),
                iconStyle: IconStyle(
                  color: pendingIndicatorColor(status!),
                  iconData: Icons.done,
                ),
              ),
              endChild: Container(
                width: double.infinity,
                height: 50.0,
                alignment: Alignment.topCenter,
                padding: EdgeInsets.only(top: 10.0),
                child: Text(
                  AppLocalizations.of(context)!.waiting_for_payment,
                  style: theme.textTheme.subtitle2!.copyWith(
                    height: 1.0,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          Expanded(
            child: TimelineTile(
              axis: TimelineAxis.horizontal,
              alignment: TimelineAlign.center,
              isFirst: false,
              lineXY: .2,
              beforeLineStyle: LineStyle(
                color: processLineColor(status!),
              ),
              afterLineStyle: LineStyle(
                color: processLineColor(status!),
              ),
              indicatorStyle: IndicatorStyle(
                height: 30,
                width: 15,
                color: processLineColor(status!),
                iconStyle: IconStyle(
                  color: processIndicatorColor(status!),
                  iconData: Icons.done,
                ),
              ),
              endChild: Container(
                width: double.infinity,
                height: 50.0,
                alignment: Alignment.topCenter,
                padding: EdgeInsets.only(top: 10.0),
                child: Text(
                  AppLocalizations.of(context)!.packaging,
                  style: theme.textTheme.subtitle2!.copyWith(
                    height: 1.0,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          Expanded(
            child: TimelineTile(
              axis: TimelineAxis.horizontal,
              alignment: TimelineAlign.center,
              isFirst: false,
              lineXY: .2,
              beforeLineStyle: LineStyle(
                color: onDeliveryLineColor(status!),
              ),
              afterLineStyle: LineStyle(
                  color: onDeliveryLineColor(status!)),
              indicatorStyle: IndicatorStyle(
                height: 30,
                width: 15,
                color: onDeliveryLineColor(status!),
                iconStyle: IconStyle(
                  color: onDeliveryIndicatorColor(status!),
                  iconData: Icons.done,
                ),
              ),
              endChild: Container(
                width: double.infinity,
                height: 50.0,
                alignment: Alignment.topCenter,
                padding: EdgeInsets.only(top: 10.0),
                child: Text(
                  AppLocalizations.of(context)!.on_delivery,
                  style: theme.textTheme.subtitle2!.copyWith(
                    height: 1.0,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          Expanded(
            child: TimelineTile(
              axis: TimelineAxis.horizontal,
              alignment: TimelineAlign.center,
              isFirst: false,
              isLast: true,
              lineXY: .2,
              beforeLineStyle: LineStyle(
                color: doneLineColor(status!),
              ),
              afterLineStyle: LineStyle(color: theme.primaryColor),
              indicatorStyle: IndicatorStyle(
                height: 30,
                width: 15,
                color:doneLineColor(status!),
                iconStyle: IconStyle(
                  color:doneIndicatorColor(status!),
                  iconData: Icons.done,
                ),
              ),
              endChild: Container(
                width: double.infinity,
                height: 50.0,
                alignment: Alignment.topCenter,
                padding: EdgeInsets.only(top: 10.0),
                child: Text(
                  AppLocalizations.of(context)!.done,
                  style: theme.textTheme.subtitle2!.copyWith(
                    height: 1.0,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// _orderStatusTimeline(BuildContext context, {OrderStatus? status}) {
//   final theme = Theme.of(context);
//   return}
