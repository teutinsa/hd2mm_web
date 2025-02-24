import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/notification_provider.dart';

class NotificationButton extends StatefulWidget {
  const NotificationButton({super.key});

  @override
  State<StatefulWidget> createState() => _NotificationButtonState();
}

class _NotificationButtonState extends State<NotificationButton> {
  final _buttonKey = GlobalKey();
  OverlayEntry? _overlayEntry;

  @override
  Widget build(BuildContext context) {
    return Consumer<NotificationProvider>(
      builder: (context, value, child) => IconButton(
        key: _buttonKey,
        onPressed: _toggle,
        icon: Stack(
          children: [
            Icon(Icons.notifications),
            if (value.notifications.isNotEmpty)
              Positioned(
                right: 3,
                top: 3,
                child: Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.redAccent,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
  
  void _toggle() {
    if (_overlayEntry != null) {
      _overlayEntry!.remove();
      _overlayEntry = null;
    } else {
      _overlayEntry = _createOverlayEntry();
      Overlay.of(context).insert(_overlayEntry!);
    }
  }

  OverlayEntry _createOverlayEntry() {
    final renderBox = _buttonKey.currentContext!.findRenderObject() as RenderBox;
    final position = renderBox.localToGlobal(Offset.zero);
    final buttonWidth = renderBox.size.width;
    final buttonHeight = renderBox.size.height;

    return OverlayEntry(
      builder: (context) => Stack(
        children: [
          Positioned.fill(
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: _toggle,
            ),
          ),
          Positioned(
            left: position.dx + buttonWidth - 300,
            top: position.dy + buttonHeight + 5,
            width: 300,
            child: Material(
              elevation: 4,
              borderRadius: BorderRadius.circular(8),
              color: Theme.of(context).colorScheme.surfaceBright,
              child: SizedBox(
                height: 250,
                child: Scrollbar(
                  child: Consumer<NotificationProvider>(
                    builder: (context, value, child) => ListView.builder(
                      shrinkWrap: true,
                      itemCount: value.notifications.length,
                      padding: EdgeInsets.all(5),
                      itemBuilder: (context, index) {
                        final msg = value.notifications[index];
                        return Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 5),
                          child: Card(
                            child: ListTile(
                              title: Text(msg.title),
                              subtitle: Text(msg.description),
                              trailing: msg.canRemove ? IconButton(
                                icon: const Icon(Icons.delete_outline),
                                onPressed: () => value.remove(msg),
                              ) : null,
                            ),
                          ),
                        );
                      }
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}