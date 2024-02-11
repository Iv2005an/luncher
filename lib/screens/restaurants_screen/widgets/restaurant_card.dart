import 'package:flutter/material.dart';

import 'package:luncher/generated/l10n.dart';

class RestaurantCard extends StatelessWidget {
  const RestaurantCard({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    text: S.of(context).address,
                    style: theme.textTheme.titleLarge,
                    children: [
                      TextSpan(
                          text:
                              'пр Театральный 5, ТЦ Центральный Детский Мир 6 этаж',
                          style: theme.textTheme.bodyLarge)
                    ],
                  ),
                ),
                const Divider(),
                Text(
                  S.of(context).metroStations,
                  style: theme.textTheme.titleLarge,
                ),
                const Wrap(
                  spacing: 8,
                  children: [
                    Chip(
                      avatar: CircleAvatar(
                        backgroundColor: Colors.purple,
                      ),
                      label: Text('Выхино'),
                    ),
                    Chip(
                      avatar: CircleAvatar(
                        backgroundColor: Colors.pink,
                      ),
                      label: Text('Косино'),
                    ),
                    Chip(
                      avatar: CircleAvatar(
                        backgroundColor: Colors.purple,
                      ),
                      label: Text('Лермонтовский проспект'),
                    ),
                    Chip(
                      avatar: CircleAvatar(
                        backgroundColor: Colors.grey,
                      ),
                      label: Text('Бульвар Дмитрия Донского'),
                    ),
                  ],
                ),
                const Divider(),
                Text(
                  'Открыто до 22:00',
                  style:
                      theme.textTheme.titleLarge!.copyWith(color: Colors.green),
                ),
                const Divider(),
                Text(S.of(context).services, style: theme.textTheme.titleLarge),
                Wrap(
                  spacing: 8,
                  children: [
                    Chip(
                      avatar: Icon(
                        Icons.access_time_outlined,
                        color: theme.colorScheme.onBackground,
                      ),
                      label: const Text('Открыто сейчас'),
                    ),
                    Chip(
                      avatar: Icon(
                        Icons.directions_car_outlined,
                        color: theme.colorScheme.onBackground,
                      ),
                      label: const Text('Авто'),
                    ),
                    Chip(
                      avatar: Icon(
                        Icons.local_cafe_outlined,
                        color: theme.colorScheme.onBackground,
                      ),
                      label: const Text('Завтрак'),
                    ),
                    Chip(
                      avatar: Icon(
                        Icons.local_parking_outlined,
                        color: theme.colorScheme.onBackground,
                      ),
                      label: const Text('Вынос на парковку'),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('AlertDialog Title'),
                        content: const Text('AlertDialog description'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {},
                            child: Text(S.of(context).cancel),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Text(S.of(context).delete),
                          ),
                        ],
                      ),
                    ),
                    child: Text(
                      S.of(context).delete,
                      style: theme.textTheme.bodyMedium!
                          .copyWith(color: Colors.red),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
