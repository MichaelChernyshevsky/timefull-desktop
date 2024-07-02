import 'package:timefull/exports.dart';

enum Content {
  packages,
  user,
  signin,
  back,
  // packages
  economy,
  task,
  timer,
}

class ScreenHelper extends StatefulWidget {
  const ScreenHelper({
    super.key,
    required this.title,
    required this.drawers,
    required this.outDrawers,
  });

  final List<DrawerElement> drawers;
  final String title;
  final List<DrawerElement> outDrawers;
  final bool rounded = false;

  @override
  State<ScreenHelper> createState() => _ScreenHelperState();
}

class _ScreenHelperState extends State<ScreenHelper> {
  late UserBloc userBloc;
  Widget _content = const Column();

  @override
  void initState() {
    super.initState();
    setState(() {
      if (widget.drawers.isNotEmpty) {
        _content = widget.drawers[0].contentWidget!;
      } else {
        _content = widget.outDrawers[0].contentWidget!;
      }
    });

    userBloc = BlocProvider.of<UserBloc>(context);
  }

  void onTapDrawerItem(DrawerElement element) {
    if (element.content == Content.back) {
      context.pop();
    } else if (element.content == Content.signin) {
      context.pop();
    } else {
      setState(() => _content = element.contentWidget!);
    }
  }

  void listener(BuildContext context, UserBlocState state) {
    // if (state is Logouted) {
    //   context.pop();
    // }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserBloc, UserBlocState>(
      listener: listener,
      child: Scaffold(
        body: Row(
          children: [
            DrawerWidget(
              rounded: widget.rounded,
              content: widget.drawers,
              onItemSelect: onTapDrawerItem,
              outWidget: widget.outDrawers,
            ),
            _content,
          ],
        ),
      ),
    );
  }
}

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({
    super.key,
    required this.content,
    required this.onItemSelect,
    required this.outWidget,
    required this.rounded,
  });
  final List<DrawerElement> content;
  final List<DrawerElement> outWidget;
  final ValueChanged<DrawerElement> onItemSelect;
  final bool rounded;

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Drawer(
      width: w * 0.07,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(topRight: Radius.circular(widget.rounded ? 10 : 0), bottomRight: Radius.circular(widget.rounded ? 10 : 0)),
      ),
      backgroundColor: Colors.red,
      elevation: 10,
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.all(w * 0.01),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Padding(
                //   padding: EdgeInsets.only(bottom: h * 0.04),
                //   child: ImageHelper(
                //     height: h * 0.07,
                //     imagePath: ImageConstants.appIcon,
                //     radius: BorderRadius.circular(90),
                //   ),
                // ),
                for (final element in widget.content) GestureDetector(onTap: () => widget.onItemSelect(element), child: element),
                const Spacer(),
                for (final element in widget.outWidget) GestureDetector(onTap: () => widget.onItemSelect(element), child: element),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DrawerElement extends StatelessWidget {
  const DrawerElement({
    super.key,
    required this.title,
    required this.icon,
    required this.contentWidget,
    required this.content,
  });

  final String title;
  final IconData icon;
  final Widget? contentWidget;
  final Content content;

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.all(h * 0.01),
      child: Center(
        child: Icon(
          icon,
          size: h * 0.035,
          color: Colors.white,
        ),
      ),
    );
  }
}
