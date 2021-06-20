part of '../checkout_page.dart';

class _BuildProductOrderList extends StatelessWidget {
  const _BuildProductOrderList({
    Key? key,
    required CheckoutArgument? args,
  }) : _args = args, super(key: key);

  final CheckoutArgument? _args;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return CustomShakeTransition(
      duration: Duration(milliseconds: 1000),
      child: ListView.builder(
          itemCount: _args!.products!.length,
          physics: ScrollPhysics(),
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            var e = _args!.products![index]!;
            return ListTile(
              contentPadding: EdgeInsets.all(0),
              leading: Container(
                width: 60.0,
                height: 80.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  image: DecorationImage(
                    image: NetworkImage(e.images!.first),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              title: Text(
                e.name!,
                style: theme.textTheme.headline4,
                overflow: TextOverflow.clip,
                maxLines: 2,
              ),
              subtitle: Text(
                  NumberFormat.currency(
                    symbol: 'Rp. ',
                    decimalDigits: 0,
                    locale: 'id-ID',
                  ).format(e.price! * e.quantity),
                  style: theme.textTheme.subtitle1),
              trailing: Text(
                  '${e.quantity} ' + AppLocalizations.of(context)!.item,
                  style: theme.textTheme.subtitle1),
            );
          }),
    );
  }
}