import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class Todotile extends StatelessWidget {
  final String task;
  final bool isCompleted;
  Function(bool?)? onChange;
  Function(BuildContext?)? onDelete;

  Todotile({
    super.key,
    required this.task,
    required this.isCompleted,
    required this.onChange,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(12.0),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
              onPressed: onDelete,
              icon: (Icons.delete),
              backgroundColor: Theme.of(context).colorScheme.secondary,
              borderRadius: BorderRadius.circular(12),
            ),
          ],
        ),
        child: Container(
          padding: EdgeInsets.all(12.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Theme.of(context).colorScheme.primary,
          ),
          child: Row(
            children: [
              Checkbox(
                value: isCompleted,
                onChanged: onChange,
                activeColor: Theme.of(context).colorScheme.secondary,
              ),
              Text(
                task,
                style: TextStyle(
                  decoration: isCompleted
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
