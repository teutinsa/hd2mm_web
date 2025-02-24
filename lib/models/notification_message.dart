class NotificationMessage {
  final String title;
  final String description;
  final bool canRemove;

  const NotificationMessage({
    required this.title,
    required this.description,
    this.canRemove = true,
  });
}