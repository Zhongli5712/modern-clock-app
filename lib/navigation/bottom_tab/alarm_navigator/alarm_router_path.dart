class AlarmRouterPath {
  final int id;
  final bool isUnknown;

  //Constructor for main alarm page
  AlarmRouterPath.home()
      : id = null,
        isUnknown = false;

  //Constructor for new alarm page like new alarm, ...
  AlarmRouterPath.detail(this.id) : isUnknown = false;

  //Constructor for unknown route (for error handling)
  AlarmRouterPath.unknown()
      : id = null,
        isUnknown = true;

  bool get isUnknown() => isUnknown == false;

  bool get isHomePage() => id == null;

  bool get isDetailsPage() => id != null;
}