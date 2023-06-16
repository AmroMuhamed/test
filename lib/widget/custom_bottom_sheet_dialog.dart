import 'package:hrapp/Utils/app_color.dart';
import 'package:hrapp/bases/base_state.dart';

class CustomBottomSheetDialog extends StatefulWidget {
  final Widget child;
  final bool fullScreen;

  CustomBottomSheetDialog({required this.child, this.fullScreen = false});

  @override
  _CustomBottomSheetDialogState createState() =>
      _CustomBottomSheetDialogState();
}

class _CustomBottomSheetDialogState extends State<CustomBottomSheetDialog> {
  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: blackColor70Percent,
        body: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              spaceDialogWidget,
              defaultDialogWidget,
            ],
          ),
        ),
      );

  Widget get spaceDialogWidget => Expanded(
        child: Container(),
        flex: 2,
      );

  Widget get defaultDialogWidget => widget.fullScreen
      ? Expanded(
          child: dialogDesignWidget,
        )
      : dialogDesignWidget;

  Widget get dialogDesignWidget => Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15.h),
                topRight: Radius.circular(15.h)),
            color: Colors.white),
        height: !widget.fullScreen ? null : 400.h,
        child: dialogDesign,
      );

  Widget get dialogDesign => Padding(
        padding: EdgeInsets.only(
            left: widget.fullScreen ? 16.w : 0,
            right: widget.fullScreen ? 16.w : 0),
        child: widget.fullScreen
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [Expanded(child: widget.child)],
              )
            : widget.child,
      );
}
