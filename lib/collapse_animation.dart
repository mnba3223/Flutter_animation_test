import 'package:flutter/material.dart';

///參考網頁(Reference) https://medium.com/@tsung-wei_hsu/flutter-custom-expandable-i-e-expansionpanel-aa8e056324c
///

/// 收合使用元件
class Flutter_Expandable extends StatefulWidget {
  ///   father layer widget
  final Widget firstLayerWidget;

  /// children layer widget
  final List<Widget> secondLayerWidgets;

  /// 預設開合選項
  final bool isExpandedByDefault;

  const Flutter_Expandable({
    Key? key,
    required this.firstLayerWidget,
    required this.secondLayerWidgets,
    this.isExpandedByDefault = false,
  }) : super(key: key);

  @override
  _ExpandableState createState() => _ExpandableState();
}

class _ExpandableState extends State<Flutter_Expandable>
    with TickerProviderStateMixin {
  late final AnimationController _controller;

  late final Animation<double> _animation;

  late final Tween<double> _sizeTween;

  bool _isExpanded = false;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 150),
      value: widget.isExpandedByDefault ? 1.0 : 0.0,
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.fastOutSlowIn,
    );

    _sizeTween = Tween(begin: 0.0, end: 1.0);
    // _sizeTween2 = Tween(begin: 1.0, end: 0.0);
    _isExpanded = widget.isExpandedByDefault;
    super.initState();
  }

  void _expandOnChanged() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
    _isExpanded ? _controller.forward() : _controller.reverse(from: 1.0);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: _expandOnChanged,
          child: Container(
            // height: 60,
            width: double.infinity,
            // color: Colors.green,
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // SizedBox(width: 8),
                widget.firstLayerWidget,
                if (!_isExpanded)
                  Icon(
                    _isExpanded ? null : Icons.keyboard_arrow_down,
                    color: Colors.black,
                  ),
              ],
            ),
          ),
        ),

        ///因動畫的問題，設定height會使動畫失效
        SizeTransition(
          sizeFactor: _isExpanded
              ? _sizeTween.animate(_animation)
              : _sizeTween.animate(_animation),
          child: Container(
            // height: _isExpanded ? null : null,
            child: ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: widget.secondLayerWidgets.length,
              itemBuilder: (context, index) {
                return widget.secondLayerWidgets[index];
              },
            ),
          ),
        ),
        if (_isExpanded)
          InkWell(
            onTap: _expandOnChanged,
            child: Icon(
              Icons.keyboard_arrow_up,
              color: Colors.black,
            ),
          )
      ],
    );
  }
}
