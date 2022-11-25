import 'package:flutter/material.dart';
import 'package:mobile_app_flutter/drivers/UI/edit_driver_route_dialog.dart';
import 'package:mobile_app_flutter/drivers/models/route.dart';

class RouteCard extends StatefulWidget {
  final DriverRoute route;
  final bool button;

  const RouteCard({
    super.key,
    required this.route,
    required this.button,
  });

  @override
  State<RouteCard> createState() => _RouteCardState();
}

class _RouteCardState extends State<RouteCard> {
  EditDriverRouteDialog? dialog;

  @override
  void initState() {
    dialog = EditDriverRouteDialog();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Card(
        clipBehavior: Clip.antiAlias,
        elevation: 10,
        shadowColor: Colors.indigo,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Column(
          children: [
            const FadeInImage(
              placeholder: AssetImage('assets/jar-loading.gif'),
              image: NetworkImage(
                  'https://img.freepik.com/foto-gratis/tiro-angulo-alto-carretera-vacia-noruega-rodeada-arboles-colinas_181624-20135.jpg?w=2000'),
              width: double.infinity,
              height: 150,
              fit: BoxFit.cover,
              fadeInDuration: Duration(milliseconds: 300),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: Column(
                children: [
                  _Data(route: widget.route),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if (widget.button)
                        ElevatedButton(
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) => dialog!
                                    .buildDialog(context, 1, widget.route));
                          },
                          child: const Text('Editar'),
                        ),
                      if (widget.button)
                        ElevatedButton(
                            onPressed: () {}, child: const Text('Eliminar'))
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Data extends StatelessWidget {
  const _Data({
    Key? key,
    required this.route,
  }) : super(key: key);

  final DriverRoute route;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _DataLeft(route: route),
        _DataRight(route: route),
      ],
    );
  }
}

class _DataRight extends StatelessWidget {
  const _DataRight({
    Key? key,
    required this.route,
  }) : super(key: key);

  final DriverRoute route;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _DataPair(
          subTitle: 'Punto de partida:',
          data: route.startingPoint,
        ),
        _DataPair(subTitle: 'Día de partida:', data: route.departureDate),
        _DataPair(subTitle: 'Costo', data: '${route.cost}')
      ],
    );
  }
}

class _DataPair extends StatelessWidget {
  const _DataPair({
    Key? key,
    required this.subTitle,
    required this.data,
  }) : super(key: key);

  final String subTitle;
  final String data;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          subTitle,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        Text(
          data,
          style: const TextStyle(fontSize: 16),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}

class _DataLeft extends StatelessWidget {
  const _DataLeft({
    Key? key,
    required this.route,
  }) : super(key: key);

  final DriverRoute route;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _DataPair(subTitle: 'destino', data: route.destiny),
        _DataPair(subTitle: 'Hora de partida:', data: route.departureTime),
        _DataPair(subTitle: 'Asientos:', data: '${route.seating}')
      ],
    );
  }
}