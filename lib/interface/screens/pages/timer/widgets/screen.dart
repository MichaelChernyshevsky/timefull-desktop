import 'package:timefull/exports.dart';
import 'package:timefull/interface/screens/widgets/container.dart';
import 'package:timefull/interface/utils/color.dart';

class TimeButton extends StatelessWidget {
  const TimeButton({
    super.key,
    required this.onTap,
    required this.text,
  });

  final VoidCallback onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.all(w * 0.01),
      child: GestureDetector(
        onTap: onTap,
        child: CustomContainer(
          color: Colors.purple,
          height: h * 0.05,
          width: w * 0.23,
          widget: Center(
            child: Text(text),
          ),
        ),
      ),
    );
  }
}

class StartOrStop extends StatelessWidget {
  const StartOrStop({
    super.key,
    required this.isStart,
    required this.onTap,
  });

  final bool isStart;

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.all(w * 0.02),
      child: GestureDetector(
        onTap: onTap,
        child: CustomContainer(
          color: Colors.white,
          colorBorder: UTILSConstants.purple,
          height: h * 0.07,
          width: w * 0.38,
          widget: Center(
            child: Text(isStart ? 'start' : 'stop'),
          ),
        ),
      ),
    );
  }
}

class RoundedButton extends StatelessWidget {
  const RoundedButton({super.key, required this.size, required this.tap, required this.isPlus, required this.color});
  final double size;
  final VoidCallback tap;
  final bool isPlus;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: tap,
      child: Container(
        height: size,
        width: size,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: UTILSConstants.grey2,
          borderRadius: BorderRadius.circular(100),
        ),
        child: Center(
          child: Text(
            isPlus ? '+' : '-',
            style: TextStyle(fontSize: h * 0.04, color: color),
          ),
        ),
      ),
    );
  }
}
